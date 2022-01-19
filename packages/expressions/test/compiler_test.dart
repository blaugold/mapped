import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

import 'fixtures/add_operation.dart';
import 'fixtures/let_var_operation.dart';
import 'fixtures/literal.dart';
import 'utils/expect.dart';

void main() {
  final compiler = ExpressionCompiler.fromDelegateBuilder(
    DelegateBuilder([
      literalDelegates,
      letVarOperationDelegates,
      addOperationDelegates,
    ]),
  );

  test('evaluate add operation', () {
    expectExpressionValue<void, double>(add(1, add(1, 1)), 3, compiler);
  });

  test('evaluate let var', () {
    expectExpressionValue(let('a', 'b', var_('a')), 'b', compiler);
  });
}
