import 'analysis.dart';
import 'analysis_context.dart';
import 'expression.dart';

extension AnalysisContextCompilationExt on AnalysisContext {
  CompiledExpression<C, R> compiledExpression<C, R>(Expression expression) =>
      firstOfType<CompiledExpressionResolver<C>>()
          .resolveCompiledExpression(expression, this);
}

typedef CompiledExpressionFn<C, R> = R Function(C context);

class CompiledExpression<C, R> {
  CompiledExpression(this.fn);

  final CompiledExpressionFn<C, R> fn;

  @pragma('vm:prefer-inline')
  R call(C context) => fn(context);
}

class ConstantCompiledExpression<C, R> extends CompiledExpression<C, R> {
  ConstantCompiledExpression(this.value) : super((_) => value);

  ConstantCompiledExpression<Object?, R> withNullableContext() =>
      ConstantCompiledExpression<Object?, R>(value);

  final R value;
}

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
