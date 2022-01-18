import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

import 'fixtures/let_var_operation.dart';
import 'fixtures/literal.dart';
import 'fixtures/type_system.dart';
import 'utils/matcher.dart';

void main() {
  final analyzer = ExpressionAnalyzer.fromDelegateBuilder(
    DelegateBuilder([
      literalDelegates,
      letVarOperationDelegates,
    ]),
  );

  test('resolve type of literal at root', () {
    expectExpressionType(Literal('a'), stringType, analyzer);
  });

  test('resolve type of variable', () {
    expectExpressionType(let('a', 'b', var_('a')), stringType, analyzer);
  });
}
