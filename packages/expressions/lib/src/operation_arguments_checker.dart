import 'analysis.dart';
import 'analysis_context.dart';
import 'analysis_error.dart';
import 'expression.dart';
import 'expression_predicate.dart';
import 'functional_delegate.dart';
import 'utils.dart';

enum ArgumentCheckerContinuation {
  next,
  maybeNext,
  done,
}

abstract class OperationArgumentChecker {
  factory OperationArgumentChecker(
    ExpressionCheckerFn argumentChecker, {
    bool repeatable = false,
  }) =>
      _OperationArgumentGroupChecker([argumentChecker], repeatable: repeatable);

  factory OperationArgumentChecker.group(
    List<ExpressionCheckerFn> argumentCheckers, {
    bool repeatable,
  }) = _OperationArgumentGroupChecker;

  OperationArgumentChecker.custom();

  ArgumentCheckerContinuation checkArgument(
    Operation operation,
    Expression argument,
    AnalysisContext context,
  );
}

class _OperationArgumentGroupChecker extends OperationArgumentChecker {
  _OperationArgumentGroupChecker(
    this.argumentCheckers, {
    this.repeatable = false,
  }) : super.custom();

  final List<ExpressionCheckerFn> argumentCheckers;

  final bool repeatable;

  var _currentArgumentCheckerIndex = 0;

  @override
  ArgumentCheckerContinuation checkArgument(
    Operation operation,
    Expression argument,
    AnalysisContext context,
  ) {
    final currentArgumentCheckerIndex = _currentArgumentCheckerIndex;

    argumentCheckers[currentArgumentCheckerIndex](argument, context);

    _currentArgumentCheckerIndex =
        (currentArgumentCheckerIndex + 1) % argumentCheckers.length;

    if (currentArgumentCheckerIndex < argumentCheckers.length - 1) {
      return ArgumentCheckerContinuation.next;
    } else {
      if (repeatable) {
        return ArgumentCheckerContinuation.maybeNext;
      }

      return ArgumentCheckerContinuation.done;
    }
  }
}

typedef OperationArgumentCheckersFactory = Iterable<OperationArgumentChecker>
    Function(Operation operation);

class OperationArgumentsCheckerDelegate
    extends FunctionalAnalysisDelegate<Operation>
    implements ExpressionCheckerDelegate {
  OperationArgumentsCheckerDelegate(
    ExpressionPredicate<Operation>? filter,
    this._checkersFactory,
    this._argumentCount,
  ) : super(filter) {
    if (!(_argumentCount.isEmpty || _argumentCount.isPositive)) {
      throw ArgumentError.value(
        _argumentCount,
        '_argumentCount',
        'must be empty or positive',
      );
    }
  }

  final OperationArgumentCheckersFactory _checkersFactory;

  final Range _argumentCount;

  @override
  void checkExpression(
    covariant Operation expression,
    AnalysisContext context,
  ) {
    final checkers = _checkersFactory(expression).toList();
    if (checkers.isEmpty) {
      throw StateError(
        'Operation argument checker factory created no checkers for '
        '$expression.',
      );
    }

    OperationArgumentChecker? checker;
    ArgumentCheckerContinuation? continuation;

    final it = expression.arguments.iterator;
    while (it.moveNext()) {
      final argument = it.current;

      if (checker == null) {
        if (checkers.isEmpty) {
          context.unexpectedArgument(argument);
          continue;
        }
        checker = checkers.removeAt(0);
      }

      continuation = checker.checkArgument(
        expression,
        argument,
        context.expressionContext(argument),
      );

      switch (continuation) {
        case ArgumentCheckerContinuation.next:
          // Current checker requires another argument.
          break;
        case ArgumentCheckerContinuation.maybeNext:
          // Current checker can check another argument.
          break;
        case ArgumentCheckerContinuation.done:
          // Current checker is done, so continue with the next checker.
          checker = null;
          break;
      }
    }

    if (checkers.isNotEmpty ||
        continuation == ArgumentCheckerContinuation.next) {
      assert(!_argumentCount.isEmpty);
      if (_argumentCount.isExact) {
        context.addError(TooFewArguments(exactly: _argumentCount.start));
      } else {
        context.addError(TooFewArguments(minimum: _argumentCount.start));
      }
    }
  }
}
