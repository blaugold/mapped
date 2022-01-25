// ignore_for_file: prefer_int_literals

import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';
import 'package:test/test.dart';

import 'fixtures/add_operation.dart';
import 'fixtures/let_var_operation.dart';
import 'fixtures/test_literal.dart';

void main() {
  final compiler = ExpressionCompiler.fromDelegateBuilder(
    DelegateBuilder([
      testLiteral,
      letVarOperation,
      addOperation,
    ]),
  );

  test('evaluate let var', () {
    expectConstantExpression(let('a', 'b', var_('a')), 'b', compiler);
  });

  test('evaluate literal', () {
    expectConstantExpression(Literal(1), 1.0, compiler);
  });

  test('evaluate add operation with constants', () {
    expectConstantExpression(add(1, add(1, 1)), 3.0, compiler);
  });
}
