import 'package:collection/collection.dart';

import 'analysis.dart';
import 'analysis_context.dart';
import 'analysis_error.dart';
import 'compilation.dart';
import 'expression.dart';
import 'expression_predicate.dart';
import 'expression_type.dart';
import 'functional_delegate.dart';
import 'utils.dart';

typedef DelegateBuilderFn<T> = void Function(DelegateBuilder<T> builder);

/// Builder for convenient creation of [AnalysisDelegate]s and
/// [ExpressionCompilerDelegate]s.
///
/// [C] is the evaluation context for [ExpressionCompilerDelegate]s.
class DelegateBuilder<C extends Object?> {
  DelegateBuilder([Iterable<DelegateBuilderFn<C>>? builderFunctions]) {
    if (builderFunctions != null) {
      applyBuilderFunctions(builderFunctions);
    }
  }

  List<AnalysisDelegate> get analysisDelegates =>
      UnmodifiableListView(_analysisDelegates);
  final List<AnalysisDelegate> _analysisDelegates = [];

  List<ExpressionCompilerDelegate<C>> get compilerDelegates =>
      UnmodifiableListView(_compilerDelegates);
  final List<ExpressionCompilerDelegate<C>> _compilerDelegates = [];

  void applyBuilderFunctions(Iterable<DelegateBuilderFn<C>> builderFunctions) {
    for (final fn in builderFunctions) {
      fn(this);
    }
  }

  void addAnalysisDelegate(AnalysisDelegate delegate) {
    _analysisDelegates.add(delegate);
  }

  void addCompilerDelegate(ExpressionCompilerDelegate<C> delegate) {
    _compilerDelegates.add(delegate);
  }
}

typedef OperationArgumentContextResolverFn = AnalysisContext Function(
  Operation operation,
  Expression argument,
  AnalysisContext parentContext,
);

typedef LiteralTypeResolverFn = ExpressionType Function(
  Literal literal,
  AnalysisContext context,
);

typedef OperationTypeResolverFn = ExpressionType Function(
  Operation operation,
  AnalysisContext context,
);

typedef OperationCompilerFn<C> = CompiledExpression<C, R> Function<R>(
  Operation operation,
  AnalysisContext context,
);

extension DelegateBuilderExt<C> on DelegateBuilder<C> {
  // === Context resolvers =====================================================

  void operationArgumentContextResolver(
    String operationName,
    OperationArgumentContextResolverFn resolve,
  ) {
    addAnalysisDelegate(
      FunctionalExpressionContextResolverDelegate<Expression>(
        byParent(byOperationName(operationName)),
        (expression, parentContext) => resolve(
          expression.parent! as Operation,
          expression,
          parentContext,
        ),
      ),
    );
  }

  // === Type resolvers ========================================================

  void literalTypeResolver(
    LiteralTypeResolverFn resolve, {
    ExpressionPredicate<Literal>? filter,
  }) {
    addAnalysisDelegate(
      FunctionalExpressionTypeResolverDelegate(filter, resolve),
    );
  }

  void operationTypeResolver(
    String operationName,
    OperationTypeResolverFn resolve,
  ) {
    addAnalysisDelegate(
      FunctionalExpressionTypeResolverDelegate<Operation>(
        byOperationName(operationName),
        resolve,
      ),
    );
  }

  void staticOperationTypeResolver(String operationName, ExpressionType type) {
    operationTypeResolver(operationName, (_, __) => type);
  }

  // === Checkers ==============================================================

  void staticOperationArgumentTypeChecker(
    String operationName,
    List<ExpressionType> argumentTypes,
  ) {
    addAnalysisDelegate(
      FunctionalExpressionCheckerDelegate<Operation>(
        byOperationName(operationName),
        (expression, context) {
          context.expectExactArgumentCount(argumentTypes.length);

          final typedArguments =
              maxLengthMapFromIterables(argumentTypes, expression.arguments);
          for (final argument in typedArguments.entries) {
            context.expectArgumentType(argument.value, argument.key);
          }
        },
      ),
    );
  }

  // === Compilers =============================================================

  void literalCompiler({
    Object? Function(Object? value)? transform,
    ExpressionPredicate<Literal>? filter,
  }) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Literal, C>(
        filter,
        <R>(expression, context) {
          final value =
              (transform?.call(expression.value) ?? expression.value) as R;
          return (_) => value;
        },
      ),
    );
  }

  void operationCompiler(String operationName, OperationCompilerFn compile) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        compile,
      ),
    );
  }

  void binaryReduceOperationCompiler<T>(
    String operationName,
    T Function(T a, T b) compute,
  ) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        <R>(expression, context) {
          final a = context.compiledExpression<T>(expression.arguments[0]);
          final b = context.compiledExpression<T>(expression.arguments[1]);

          return assertRequiredType(
            (evaluationContext) =>
                compute(a(evaluationContext), b(evaluationContext)),
          );
        },
      ),
    );
  }

  // === Operations ============================================================

  void binaryReduceOperation<T>(
    String operationName,
    ExpressionType type,
    T Function(T a, T b) compute,
  ) {
    staticOperationArgumentTypeChecker(operationName, [type, type]);
    staticOperationTypeResolver(operationName, type);
    binaryReduceOperationCompiler(operationName, compute);
  }
}
