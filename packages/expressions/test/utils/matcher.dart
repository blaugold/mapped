import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

Matcher literal([Object? value]) =>
    isA<Literal>().having((it) => it.value, 'value', value ?? anything);

Matcher operation([Object? name, Iterable<Object?>? arguments]) =>
    isA<Operation>()
        .having((it) => it.name, 'name', name ?? anything)
        .having((it) => it.arguments, 'arguments', arguments ?? anything);

Matcher expressionsObject([Map<String, Object?>? fields]) =>
    isA<ExpressionsObject>()
        .having((it) => it.fields, 'fields', fields ?? anything);

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
            'the actual type ($actualType) is not assignable to the expected '
            'type ($expectedType)',
      );
    },
    returnsNormally,
    reason: 'get expression type',
  );
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
