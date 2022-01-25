// ignore_for_file: depend_on_referenced_packages

import 'package:test/test.dart';

import '../expressions.dart';

void expectExpressionType(
  Expression expression,
  ExpressionType expectedType,
  ExpressionAnalyzer analyzer,
) {
  final actualType = analyzer.getExpressionType(expression);
  expect(
    actualType.isAssignableTo(expectedType),
    isTrue,
    reason: 'The actual type "$actualType" is not assignable to the expected '
        'type "$expectedType".',
  );
}

void expectAnalysisErrors(
  Expression expression,
  Object? errors,
  ExpressionAnalyzer analyzer,
) {
  expect(analyzer.checkExpression(expression), errors);
}

void expectConstantExpression<C, R>(
  Expression expression,
  R value,
  ExpressionCompiler<C> compiler,
) {
  final compiledExpression = compiler.compileExpression<R>(expression);
  expect(
    compiledExpression,
    isA<ConstantCompiledExpression<C, R>>()
        .having((it) => it.value, 'value', value),
  );
}

void expectExpressionValue<C, R>(
  Expression expression,
  R value,
  C context,
  ExpressionCompiler<C> compiler,
) {
  final compiledExpression = compiler.compileExpression<R>(expression);
  expect(compiledExpression(context), value);
}
