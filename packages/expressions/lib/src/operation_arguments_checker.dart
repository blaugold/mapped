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
    Range repeats = const Range.exact(1),
  }) =>
      _OperationArgumentGroupChecker([argumentChecker], repeats: repeats);

  factory OperationArgumentChecker.group(
    List<ExpressionCheckerFn> argumentCheckers, {
    Range repeats,
  }) = _OperationArgumentGroupChecker;

  OperationArgumentChecker.custom();

  bool isOptional();

  ArgumentCheckerContinuation checkArgument(
    Operation operation,
    Expression argument,
    AnalysisContext context,
  );
}

class _OperationArgumentGroupChecker extends OperationArgumentChecker {
  _OperationArgumentGroupChecker(
    this.argumentCheckers, {
    this.repeats = const Range.exact(1),
  })  : assert(repeats.isPositiveOrZero),
        super.custom();

  final List<ExpressionCheckerFn> argumentCheckers;

  final Range repeats;

  var _currentRepeat = 0;
  var _currentArgumentCheckerIndex = 0;

  @override
  bool isOptional() => repeats.includes(0);

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
      // We have finished a repeat. Now decide whether we are done, can continue
      // or must continue.
      _currentRepeat++;

      if (repeats.includes(_currentRepeat + 1)) {
        if (repeats.isExact) {
          return ArgumentCheckerContinuation.next;
        }
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
    if (!_argumentCount.isPositiveOrZero) {
      throw ArgumentError.value(
        _argumentCount,
        '_argumentCount',
        'must be zero or positive',
      );
    }
  }

  OperationArgumentsCheckerDelegate.noArguments(
    ExpressionPredicate<Operation>? filter,
  ) : this(filter, (_) => [], const Range.zero());

  final OperationArgumentCheckersFactory _checkersFactory;

  final Range _argumentCount;

  @override
  void checkExpression(
    covariant Operation expression,
    AnalysisContext context,
  ) {
    final checkers = _checkersFactory(expression).toList();

    // The current checker. After a checker has received the number of required
    // argument it is set to null. If this variable has a value, it means that
    // the checker has not yet received the required number of arguments.
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

    if (continuation == ArgumentCheckerContinuation.maybeNext) {
      // The last checker finished cleanly since it does not require another
      // argument.
      checker = null;
    }

    // We finish up checkers that are optional.
    if (checker == null) {
      while (checkers.isNotEmpty) {
        checker = checkers.removeAt(0);
        if (!checker.isOptional()) {
          break;
        } else {
          checker = null;
        }
      }
    }

    // Load up the next checker that requires an argument, if it exists.
    if (checker == null && checkers.isNotEmpty) {
      checker = checkers.removeAt(0);
    }

    if (checker != null) {
      // We have too few arguments, because there is at least one checker that
      // requires another argument.

      assert(!_argumentCount.isEmpty);
      if (_argumentCount.isExact) {
        context.addError(TooFewArguments(exactly: _argumentCount.start));
      } else {
        context.addError(TooFewArguments(minimum: _argumentCount.start));
      }
    }
  }
}
