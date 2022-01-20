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

  test('literal is compiled into a constant expression', () {
    final compiledExpression = compiler.compileExpression<num>(Literal(1));
    expect(
      compiledExpression,
      isA<ConstantCompiledExpression>(),
    );
  });

  test('add operation with constants is compiled into a constant', () {
    final compiledExpression =
        compiler.compileExpression<Object?>(add(1, add(1, 1)));
    expect(compiledExpression, isA<ConstantCompiledExpression>());
    expect((compiledExpression as ConstantCompiledExpression).value, 3);
  });
}
