import 'analysis.dart';
import 'analysis_context.dart';
import 'expression.dart';

extension AnalysisContextCompilationExt<C> on AnalysisContext {
  CompiledExpression<C, R> compiledExpression<R>(Expression expression) =>
      firstOfType<CompiledExpressionResolver<C>>()
          .resolveCompiledExpression(expression, this);
}

typedef CompiledExpression<C, R> = R Function(C context);

abstract class CompiledExpressionResolver<C> {
  CompiledExpression<C, R> resolveCompiledExpression<R>(
    Expression expression,
    AnalysisContext context,
  );
}

abstract class ExpressionCompilerDelegate<C> extends AnalysisDelegate {
  CompiledExpression<C, R> compileExpression<R>(
    Expression expression,
    AnalysisContext context,
  );
}

CompiledExpression<C, R> assertRequiredType<C, R>(
  CompiledExpression<C, dynamic> fn,
) =>
    fn as CompiledExpression<C, R>;
