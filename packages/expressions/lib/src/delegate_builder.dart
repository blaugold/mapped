import 'package:collection/collection.dart';

import 'analysis.dart';
import 'analysis_context.dart';
import 'compilation.dart';
import 'expression.dart';
import 'expression_checker.dart';
import 'expression_predicate.dart';
import 'expression_type.dart';
import 'functional_delegate.dart';
import 'operation_arguments_checker.dart';
import 'optimization.dart';
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

typedef LiteralCheckerFn = void Function(
  Literal literal,
  AnalysisContext context,
);

typedef OperationCompilerFn<C> = CompiledExpression<C, R> Function<R>(
  Operation operation,
  AnalysisContext context,
);

typedef CombineOperationCompilerFn<T, R> = CompiledExpression<C, R> Function<C>(
  List<CompiledExpression<C, T>> arguments,
  AnalysisContext context,
);

typedef MapOperationCompilerFn<T, R> = CompiledExpression<C, R> Function<C>(
  CompiledExpression<C, T> argument,
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

  void literalChecker(
    LiteralCheckerFn check, {
    ExpressionPredicate<Literal>? filter,
  }) {
    addAnalysisDelegate(
      FunctionalExpressionCheckerDelegate(filter, check),
    );
  }

  void operationArgumentChecker(
    String operationName,
    OperationArgumentCheckersFactory factory,
    Range argumentCount,
  ) {
    addAnalysisDelegate(
      OperationArgumentsCheckerDelegate(
        byOperationName(operationName),
        factory,
        argumentCount,
      ),
    );
  }

  void staticOperationArgumentTypeChecker(
    String operationName,
    List<ExpressionCheckerFn> argumentCheckers,
  ) {
    operationArgumentChecker(
      operationName,
      (_) => [
        for (final argumentChecker in argumentCheckers)
          OperationArgumentChecker(argumentChecker)
      ],
      Range.exact(argumentCheckers.length),
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
          final value = transform?.call(expression.value) ?? expression.value;
          return ConstantCompiledExpression(value as R);
        },
      ),
    );
  }

  void operationCompiler(String operationName, OperationCompilerFn<C> compile) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        compile,
      ),
    );
  }

  void reduceOperationCompiler<T, R extends T>(
    String operationName,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        <RR>(expression, context) => assertRequiredType(
          optimizeReduceOperationToConstant<C, T, R>(
            expression,
            context,
            compile,
          ),
        ),
      ),
    );
  }

  void mapOperationCompiler<T, R>(
    String operationName,
    MapOperationCompilerFn<T, R> compile,
  ) {
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        <RR>(expression, context) => assertRequiredType(
          optimizeMapOperationToConstant<C, T, R>(
            expression,
            context,
            compile,
          ),
        ),
      ),
    );
  }

  void concatOperationCompiler<T, R extends T>(
    String operationName,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    operationCompiler(
      operationName,
      <RR>(operation, context) => assertRequiredType(
        optimizeConcatOperationToConstant<C, T, R>(
          operation,
          context,
          compile,
        ),
      ),
    );
  }

  // === Operations ============================================================

  void constantOperation(
    String operationName,
    ExpressionType type,
    Object? value,
  ) {
    staticOperationArgumentTypeChecker(operationName, []);
    staticOperationTypeResolver(operationName, type);
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        <R>(expression, context) => ConstantCompiledExpression(value as R),
      ),
    );
  }

  void reduceOperation<T, R extends T>(
    String operationName,
    ExpressionType type,
    Range argumentCount,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    operationArgumentChecker(
      operationName,
      (_) => [
        OperationArgumentChecker(
          checkExpressionType(type),
          repeats: argumentCount,
        )
      ],
      argumentCount,
    );
    staticOperationTypeResolver(operationName, type);
    reduceOperationCompiler(operationName, compile);
  }

  void binaryReduceOperation<T, R extends T>(
    String operationName,
    ExpressionType type,
    R Function(T a, T b) compute,
  ) {
    reduceOperation<T, R>(
      operationName,
      type,
      const Range.exact(2),
      <C>(arguments, __) {
        final a = arguments[0];
        final b = arguments[1];
        return CompiledExpression((_) => compute(a(_), b(_)));
      },
    );
  }

  void mapOperation<T, R>(
    String operationName,
    ExpressionType inputType,
    ExpressionType outputType,
    R Function(T value) compute,
  ) {
    operationArgumentChecker(
      operationName,
      (_) => [OperationArgumentChecker(checkExpressionType(inputType))],
      const Range.exact(1),
    );
    staticOperationTypeResolver(operationName, outputType);
    mapOperationCompiler<T, R>(
      operationName,
      <C>(argument, __) => CompiledExpression((_) => compute(argument(_))),
    );
  }

  void mapOperationWithContext<T, R>(
    String operationName,
    ExpressionType inputType,
    ExpressionType outputType,
    R Function(T value, AnalysisContext context) compute,
  ) {
    operationArgumentChecker(
      operationName,
      (_) => [OperationArgumentChecker(checkExpressionType(inputType))],
      const Range.exact(1),
    );
    staticOperationTypeResolver(operationName, outputType);
    mapOperationCompiler<T, R>(
      operationName,
      <C>(argument, context) =>
          CompiledExpression((_) => compute(argument(_), context)),
    );
  }

  void concatOperation<T, R extends T>(
    String operationName,
    ExpressionType argumentsType,
    ExpressionType type,
    Range argumentCount,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    operationArgumentChecker(
      operationName,
      (_) => [
        OperationArgumentChecker(
          checkExpressionType(argumentsType),
          repeats: argumentCount,
        )
      ],
      argumentCount,
    );
    staticOperationTypeResolver(operationName, type);
    concatOperationCompiler<T, R>(operationName, compile);
  }
}
