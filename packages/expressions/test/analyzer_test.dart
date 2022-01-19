// ignore_for_file: no_adjacent_strings_in_list

import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

import 'fixtures/add_operation.dart';
import 'fixtures/let_var_operation.dart';
import 'fixtures/literal.dart';
import 'fixtures/type_system.dart';
import 'utils/expect.dart';
import 'utils/matcher.dart';

void main() {
  final analyzer = ExpressionAnalyzer.fromDelegateBuilder(
    DelegateBuilder([
      literalDelegates,
      letVarOperationDelegates,
      addOperationDelegates,
    ]),
  );

  test('resolve type of literal at root', () {
    expectExpressionType(Literal('a'), stringType, analyzer);
  });

  test('resolve type of variable', () {
    expectExpressionType(let('a', 'b', var_('a')), stringType, analyzer);
  });

  group('check', () {
    test('valid literal at root', () {
      expectAnalysisErrors(Literal(1), isEmpty, analyzer);
    });

    test('invalid literal at root', () {
      expectAnalysisErrors(
        Literal([1]),
        analysisErrorMessages([
          '_: Literal has invalid value: Not a string or number. '
              '(Value: [1])',
        ]),
        analyzer,
      );
    });

    test('invalid literal as expression argument', () {
      expectAnalysisErrors(
        add(0, Literal([1])),
        analysisErrorMessages([
          '+(#1: _): Literal has invalid value: Not a string or number. '
              '(Value: [1])',
        ]),
        analyzer,
      );
    });

    test('invalid var name', () {
      expectAnalysisErrors(
        let('0foo', 'a', 'b'),
        analysisErrorMessages([
          'let(#0: _): Literal has invalid value: Not a valid variable name. '
              '(Value: 0foo)'
        ]),
        analyzer,
      );
    });
  });
}
