import 'analysis.dart';
import 'analysis_context.dart';
import 'analyzer.dart';
import 'compilation.dart';
import 'delegate_builder.dart';
import 'expression.dart';

abstract class ExpressionCompiler<C> implements ExpressionAnalyzer {
  factory ExpressionCompiler({
    required List<AnalysisDelegate> analysisDelegates,
    required List<ExpressionCompilerDelegate<C>> compilerDelegates,
    List<Object>? context,
  }) = ExpressionCompilerImpl;

  factory ExpressionCompiler.fromDelegateBuilder(
    DelegateBuilder<C> builder, {
    List<Object>? context,
  }) =>
      ExpressionCompiler(
        analysisDelegates: builder.analysisDelegates,
        compilerDelegates: builder.compilerDelegates,
        context: context,
      );

  CompiledExpression<C, R> compileExpression<R>(Expression expression);
}

class ExpressionCompilerImpl<C> extends ExpressionAnalyzerImpl
    implements ExpressionCompiler<C>, CompiledExpressionResolver<C> {
  ExpressionCompilerImpl({
    required List<AnalysisDelegate> analysisDelegates,
    required this.compilerDelegates,
    List<Object>? context,
  }) : super(analysisDelegates: analysisDelegates, context: context);

  final List<ExpressionCompilerDelegate<C>> compilerDelegates;

  @override
  CompiledExpression<C, R> compileExpression<R>(Expression expression) =>
      resolveCompiledExpression(
        expression,
        resolveExpressionContext(expression, createRootContext()),
      );

  @override
  CompiledExpression<C, R> resolveCompiledExpression<R>(
    Expression expression,
    AnalysisContext context,
  ) =>
      _findSingleCompilerDelegate(expression).compileExpression<R>(
        expression,
        resolveExpressionContext(expression, context),
      );

  Iterable<ExpressionCompilerDelegate<C>> _findAllCompilerDelegates(
    Expression expression,
  ) =>
      compilerDelegates
          .where((delegate) => delegate.canHandleExpression(expression));

  ExpressionCompilerDelegate<C> _findSingleCompilerDelegate(
    Expression expression,
  ) {
    final delegates = _findAllCompilerDelegates(expression);

    if (delegates.isEmpty) {
      throw StateError('Could not find an compiler delegate for $expression.');
    }

    if (delegates.length > 1) {
      throw StateError('Found multiple compiler delegates for $expression.');
    }

    return delegates.first;
  }
}
