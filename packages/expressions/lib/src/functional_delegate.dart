import 'analysis.dart';
import 'analysis_context.dart';
import 'compilation.dart';
import 'expression.dart';
import 'expression_predicate.dart';
import 'expression_type.dart';

typedef ExpressionContextResolverFn<T extends Expression> = AnalysisContext
    Function(
  T expression,
  AnalysisContext parentContext,
);

typedef ExpressionTypeResolverFn<T extends Expression> = ExpressionType
    Function(
  T expression,
  AnalysisContext context,
);

typedef ExpressionCheckerFn<T extends Expression> = void Function(
  T expression,
  AnalysisContext context,
);

typedef ExpressionCompilerFn<T extends Expression, C> = CompiledExpression<C, R>
    Function<R>(
  T expression,
  AnalysisContext context,
);

abstract class FunctionalAnalysisDelegate<T extends Expression>
    extends AnalysisDelegate {
  FunctionalAnalysisDelegate(ExpressionPredicate<T>? filter)
      : _filter = filter ?? anyExpression;

  final ExpressionPredicate<T> _filter;

  @override
  bool canHandleExpression(Expression expression) =>
      expression is T && _filter(expression);
}

class FunctionalExpressionContextResolverDelegate<T extends Expression>
    extends FunctionalAnalysisDelegate<T>
    implements ExpressionContextResolverDelegate {
  FunctionalExpressionContextResolverDelegate(
    ExpressionPredicate<T>? filter,
    this._resolve,
  ) : super(filter);

  final ExpressionContextResolverFn<T> _resolve;

  @override
  AnalysisContext resolveExpressionContext(
    covariant T expression,
    AnalysisContext parentContext,
  ) =>
      _resolve(expression, parentContext);
}

class FunctionalExpressionTypeResolverDelegate<T extends Expression>
    extends FunctionalAnalysisDelegate<T>
    implements ExpressionTypeResolverDelegate {
  FunctionalExpressionTypeResolverDelegate(
    ExpressionPredicate<T>? filter,
    this._resolve,
  ) : super(filter);

  final ExpressionTypeResolverFn<T> _resolve;

  @override
  ExpressionType resolveExpressionType(
    covariant T expression,
    AnalysisContext context,
  ) =>
      _resolve(expression, context);
}

class FunctionalExpressionCheckerDelegate<T extends Expression>
    extends FunctionalAnalysisDelegate<T> implements ExpressionCheckerDelegate {
  FunctionalExpressionCheckerDelegate(
    ExpressionPredicate<T>? filter,
    this._check,
  ) : super(filter);

  final ExpressionCheckerFn<T> _check;

  @override
  void checkExpression(
    covariant T expression,
    AnalysisContext context,
  ) =>
      _check(expression, context);
}

class FunctionalExpressionCompilerDelegate<T extends Expression, C>
    extends FunctionalAnalysisDelegate<T>
    implements ExpressionCompilerDelegate<C> {
  FunctionalExpressionCompilerDelegate(
    ExpressionPredicate<T>? filter,
    this._compile,
  ) : super(filter);

  final ExpressionCompilerFn<T, C> _compile;

  @override
  CompiledExpression<C, R> compileExpression<R>(
    covariant T expression,
    AnalysisContext context,
  ) =>
      _compile(expression, context);
}
