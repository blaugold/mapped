import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

void expectExpressionType(
  Expression expression,
  ExpressionType expectedType,
  ExpressionAnalyzer analyzer,
) {
  expect(
    () {
      final actualType = analyzer.getExpressionType(expression);
      return expect(
        actualType.isAssignableTo(expectedType),
        isTrue,
        reason:
            'The actual type "$actualType" is not assignable to the expected '
            'type "$expectedType".',
      );
    },
    returnsNormally,
    reason: 'get expression type',
  );
}

void expectAnalysisErrors(
  Expression expression,
  Object? errors,
  ExpressionAnalyzer analyzer,
) {
  expect(analyzer.checkExpression(expression), errors);
}

void expectExpressionValue<C, R>(
  Expression expression,
  R value,
  ExpressionCompiler<C> compiler, {
  Object? context,
}) {
  final compiledExpression = compiler.compileExpression<R>(expression);
  expect(
    () => expect(compiledExpression(context as C), value),
    returnsNormally,
    reason: 'evaluating compiled expression threw',
  );
}
