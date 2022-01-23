import 'package:collection/collection.dart';

import 'analysis.dart';
import 'analysis_context.dart';
import 'analysis_error.dart';
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
      [..._analysisDelegates, _knownOperationChecker()];
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

  final _operationNames = <String>{};

  void registerOperation(String operationName) {
    if (_operationNames.contains(operationName)) {
      throw ArgumentError.value(
        operationName,
        'operationName',
        'Operation "$operationName" is already registered.',
      );
    }

    _operationNames.add(operationName);
  }

  AnalysisDelegate _knownOperationChecker() {
    // Take a snapshot of the operation names to ensure that the we only check
    // for operations, known at the time of this call.
    final operationNames = {..._operationNames};

    return FunctionalExpressionCheckerDelegate<Operation>(
      anyExpression,
      (operation, context) {
        if (!operationNames.contains(operation.name)) {
          context.unknownOperation();
        }
      },
    );
  }

  void constantOperation(
    String operationName,
    ExpressionType type,
    Object? value,
  ) {
    registerOperation(operationName);
    staticOperationArgumentTypeChecker(operationName, []);
    staticOperationTypeResolver(operationName, type);
    addCompilerDelegate(
      FunctionalExpressionCompilerDelegate<Operation, C>(
        byOperationName(operationName),
        <R>(expression, context) => ConstantCompiledExpression(value as R),
      ),
    );
  }

  void contextLookupOperation<R>(
    String operationName,
    ExpressionType type,
    R Function(C) lookup,
  ) {
    registerOperation(operationName);
    operationArgumentChecker(
      operationName,
      (operation) => [],
      const Range.zero(),
    );
    staticOperationTypeResolver(operationName, type);
    operationCompiler(
      operationName,
      <RR>(operation, __) => assertRequiredType(
        CompiledExpression<C, R>(lookup),
      ),
    );
  }

  void reduceOperation<T, R extends T>(
    String operationName,
    ExpressionType argumentType,
    Range argumentCount,
    ExpressionType type,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    registerOperation(operationName);
    operationArgumentChecker(
      operationName,
      (_) => [
        OperationArgumentChecker(
          checkExpressionType(argumentType),
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
    ExpressionType argumentType,
    ExpressionType type,
    R Function(T a, T b) compute,
  ) {
    reduceOperation<T, R>(
      operationName,
      argumentType,
      const Range.exact(2),
      type,
      <C>(arguments, __) {
        final a = arguments[0];
        final b = arguments[1];
        return CompiledExpression((_) => compute(a(_), b(_)));
      },
    );
  }

  void mapOperation<T, R>(
    String operationName,
    ExpressionType argumentType,
    ExpressionType type,
    R Function(T value) compute,
  ) {
    _mapOperationBase<T, R>(
      operationName,
      argumentType,
      type,
      <C>(argument, __) => CompiledExpression((_) => compute(argument(_))),
    );
  }

  void mapOperationWithAnalysisContext<T, R>(
    String operationName,
    ExpressionType argumentType,
    ExpressionType type,
    R Function(T value, AnalysisContext context) compute,
  ) {
    _mapOperationBase<T, R>(
      operationName,
      argumentType,
      type,
      <C>(argument, context) =>
          CompiledExpression((_) => compute(argument(_), context)),
    );
  }

  void _mapOperationBase<T, R>(
    String operationName,
    ExpressionType argumentType,
    ExpressionType type,
    MapOperationCompilerFn<T, R> compile,
  ) {
    registerOperation(operationName);
    operationArgumentChecker(
      operationName,
      (_) => [OperationArgumentChecker(checkExpressionType(argumentType))],
      const Range.exact(1),
    );
    staticOperationTypeResolver(operationName, type);
    mapOperationCompiler<T, R>(
      operationName,
      compile,
    );
  }

  void concatOperation<T, R extends T>(
    String operationName,
    ExpressionType argumentsType,
    Range argumentCount,
    ExpressionType type,
    CombineOperationCompilerFn<T, R> compile,
  ) {
    registerOperation(operationName);
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
