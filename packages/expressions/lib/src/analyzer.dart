import 'package:meta/meta.dart';

import 'analysis.dart';
import 'analysis_context.dart';
import 'analysis_error.dart';
import 'delegate_builder.dart';
import 'expression.dart';
import 'expression_type.dart';

abstract class ExpressionAnalyzer {
  factory ExpressionAnalyzer({
    required List<AnalysisDelegate> analysisDelegates,
  }) = ExpressionAnalyzerImpl;

  factory ExpressionAnalyzer.fromDelegateBuilder(DelegateBuilder builder) =>
      ExpressionAnalyzer(analysisDelegates: builder.analysisDelegates);

  List<AnalysisError> checkExpression(Expression expression);

  ExpressionType getExpressionType(Expression expression);
}

class ExpressionAnalyzerImpl
    implements
        ExpressionAnalyzer,
        ExpressionTypeResolver,
        ExpressionContextResolver {
  ExpressionAnalyzerImpl({
    required this.analysisDelegates,
  });

  final List<AnalysisDelegate> analysisDelegates;

  @override
  List<AnalysisError> checkExpression(Expression expression) {
    void checkExpression(Expression expression, AnalysisContext context) {
      final checkers =
          _findAllAnalysisDelegates<ExpressionCheckerDelegate>(expression);

      for (final checker in checkers) {
        checker.checkExpression(expression, context);
      }

      if (expression is Operation) {
        for (final argument in expression.arguments) {
          checkExpression(argument, context.expressionContext(argument));
        }
      }

      if (expression is ExpressionsObject) {
        for (final propertyValue in expression.fields.values) {
          checkExpression(
            propertyValue,
            context.expressionContext(propertyValue),
          );
        }
      }
    }

    final context = createRootContext(expression);

    checkExpression(expression, context);

    return context.analysisErrors.errors;
  }

  @override
  ExpressionType getExpressionType(Expression expression) =>
      resolveExpressionType(expression, createRootContext(expression));

  @override
  ExpressionType resolveExpressionType(
    Expression expression,
    AnalysisContext context,
  ) =>
      _findSingleAnalysisDelegate<ExpressionTypeResolverDelegate>(expression)
          .resolveExpressionType(
        expression,
        resolveExpressionContext(expression, context),
      );

  @override
  AnalysisContext resolveExpressionContext(
    Expression expression,
    AnalysisContext context,
  ) =>
      context.expressionContexts.putIfAbsent(expression, () {
        final parent = expression.parent;
        var expressionContext = parent != null
            ? resolveExpressionContext(parent, context)
            : context;

        expressionContext += expression;

        final contextResolvers =
            _findAllAnalysisDelegates<ExpressionContextResolverDelegate>(
          expression,
        );

        for (final resolver in contextResolvers) {
          expressionContext +=
              resolver.resolveExpressionContext(expression, expressionContext);
        }

        return expressionContext;
      });

  @protected
  AnalysisContext createRootContext(Expression expression) {
    var context = AnalysisContext();
    context += this;
    context += _ExpressionContexts();
    context += expression;
    return context;
  }

  Iterable<T> _findAllAnalysisDelegates<T extends AnalysisDelegate>(
    Expression expression,
  ) =>
      analysisDelegates
          .whereType<T>()
          .where((delegate) => delegate.canHandleExpression(expression));

  T _findSingleAnalysisDelegate<T extends AnalysisDelegate>(
    Expression expression,
  ) {
    final delegates = _findAllAnalysisDelegates<T>(expression);

    if (delegates.isEmpty) {
      throw StateError(
        'Could not find an analysis delegate of type $T for expression '
        '$expression.',
      );
    }

    if (delegates.length > 1) {
      throw StateError(
        'Found multiple analysis delegates of type $T for expression '
        '$expression.',
      );
    }

    return delegates.first;
  }
}

class _ExpressionContexts {
  final Map<Expression, AnalysisContext> contexts = Map.identity();
}

extension on AnalysisContext {
  Map<Expression, AnalysisContext> get expressionContexts =>
      firstOfType<_ExpressionContexts>().contexts;
}
