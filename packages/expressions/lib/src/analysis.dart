import 'analysis_context.dart';
import 'expression.dart';
import 'expression_type.dart';

extension AnalysisContextAnalysisExt on AnalysisContext {
  ExpressionLocation get location =>
      ExpressionLocation.fromExpressions(expressions.toList().reversed);

  Iterable<Expression> get expressions => allOfType();

  Expression get expression => expressions.first;

  AnalysisContext expressionContext(Expression expression) =>
      firstOfType<ExpressionContextResolver>()
          .resolveExpressionContext(expression, this);

  ExpressionType expressionType(Expression expression) =>
      firstOfType<ExpressionTypeResolver>()
          .resolveExpressionType(expression, this);
}

abstract class ExpressionContextResolver {
  AnalysisContext resolveExpressionContext(
    Expression expression,
    AnalysisContext context,
  );
}

abstract class ExpressionTypeResolver {
  ExpressionType resolveExpressionType(
    Expression expression,
    AnalysisContext context,
  );
}

abstract class AnalysisDelegate {
  bool canHandleExpression(Expression expression);
}

abstract class ExpressionContextResolverDelegate extends AnalysisDelegate {
  AnalysisContext resolveExpressionContext(
    Expression expression,
    AnalysisContext parentContext,
  );
}

abstract class ExpressionTypeResolverDelegate extends AnalysisDelegate {
  ExpressionType resolveExpressionType(
    Expression expression,
    AnalysisContext context,
  );
}

abstract class ExpressionCheckerDelegate extends AnalysisDelegate {
  void checkExpression(
    Expression expression,
    AnalysisContext context,
  );
}
