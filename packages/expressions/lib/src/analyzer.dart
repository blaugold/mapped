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
    List<Object>? context,
  }) = ExpressionAnalyzerImpl;

  factory ExpressionAnalyzer.fromDelegateBuilder(
    DelegateBuilder builder, {
    List<Object>? context,
  }) =>
      ExpressionAnalyzer(
        analysisDelegates: builder.analysisDelegates,
        context: context,
      );

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
    this.context,
  });

  final List<AnalysisDelegate> analysisDelegates;

  final List<Object>? context;

  @override
  List<AnalysisError> checkExpression(Expression expression) {
    final context = createRootContext();
    _checkExpression(expression, resolveExpressionContext(expression, context));
    return context.analysisErrors.errors;
  }

  @override
  ExpressionType getExpressionType(Expression expression) =>
      resolveExpressionType(
        expression,
        resolveExpressionContext(expression, createRootContext()),
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
          expressionContext =
              resolver.resolveExpressionContext(expression, expressionContext);
        }

        return expressionContext;
      });

  void _checkExpression(Expression expression, AnalysisContext context) {
    final checkers =
        _findAllAnalysisDelegates<ExpressionCheckerDelegate>(expression);

    for (final checker in checkers) {
      checker.checkExpression(expression, context);
    }

    if (expression is Operation) {
      for (final argument in expression.arguments) {
        _checkExpression(argument, context.expressionContext(argument));
      }
    }

    if (expression is ExpressionsObject) {
      for (final propertyValue in expression.fields.values) {
        _checkExpression(
          propertyValue,
          context.expressionContext(propertyValue),
        );
      }
    }
  }

  @override
  ExpressionType resolveExpressionType(
    Expression expression,
    AnalysisContext context,
  ) =>
      _findSingleOrNullAnalysisDelegate<ExpressionTypeResolverDelegate>(
        expression,
      )?.resolveExpressionType(
        expression,
        resolveExpressionContext(expression, context),
      ) ??
      unknownType;

  @protected
  AnalysisContext createRootContext() {
    var context = AnalysisContext();
    context += this;
    context += _ExpressionContexts();
    context += AnalysisErrors();
    for (final element in this.context ?? <Object?>[]) {
      context += element;
    }
    return context;
  }

  Iterable<T> _findAllAnalysisDelegates<T extends AnalysisDelegate>(
    Expression expression,
  ) =>
      analysisDelegates
          .whereType<T>()
          .where((delegate) => delegate.canHandleExpression(expression));

  T? _findSingleOrNullAnalysisDelegate<T extends AnalysisDelegate>(
    Expression expression,
  ) {
    final delegates = _findAllAnalysisDelegates<T>(expression);

    if (delegates.isEmpty) {
      return null;
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
