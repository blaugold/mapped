import 'analysis_error.dart';
import 'expression.dart';
import 'expression_type.dart';
import 'functional_delegate.dart';

ExpressionCheckerFn checkExpressionKind<T extends Expression>(
  ExpressionKind<T> kind, [
  ExpressionCheckerFn<T>? check,
]) =>
    (expression, context) {
      context.expectExpressionKind(expression, kind);

      if (expression is T) {
        check?.call(expression, context);
      }
    };

ExpressionCheckerFn checkExpressionType(ExpressionType type) =>
    (expression, context) => context.expectExpressionType(expression, type);

ExpressionCheckerFn regexLiteralStringChecker(
  RegExp regExp, {
  String? valueDescription,
  required ExpressionType stringType,
}) =>
    combineExpressionCheckers([
      checkExpressionKind<Literal>(Literal.kind, (expression, context) {
        final value = expression.value;
        if (value is! String) {
          return;
        }

        if (regExp.hasMatch(value)) {
          return;
        }

        if (valueDescription != null) {
          context.invalidLiteralValue('Not a valid $valueDescription.');
        } else {
          context.invalidLiteralValue('Does not match "${regExp.pattern}".');
        }
      }),
      checkExpressionType(stringType),
    ]);
