// ignore_for_file: no_adjacent_strings_in_list

import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';
import 'package:test/test.dart';

import 'fixtures/add_operation.dart';
import 'fixtures/let_var_operation.dart';
import 'fixtures/test_literal.dart';
import 'fixtures/type_system.dart';

void main() {
  final analyzer = ExpressionAnalyzer.fromDelegateBuilder(
    DelegateBuilder([
      testLiteral,
      letVarOperation,
      addOperation,
    ]),
  );

  group('resolve type', () {
    test('of literal at root', () {
      expectExpressionType(Literal('a'), stringType, analyzer);
    });

    test('of variable', () {
      expectExpressionType(let('a', 'b', var_('a')), stringType, analyzer);
    });
  });

  group('check', () {
    group('InvalidLiteralValue', () {
      test('valid literal at root', () {
        expectAnalysisErrors(Literal(1), isEmpty, analyzer);
      });

      test('invalid literal at root', () {
        expectAnalysisErrors(
          Literal([1]),
          analysisErrorMessages([
            'expr(_): Literal has invalid value: Not a string, boolean or '
                'number. (Value: [1])',
          ]),
          analyzer,
        );
      });

      test('invalid literal as expression argument', () {
        expectAnalysisErrors(
          add(0, Literal([1])),
          analysisErrorMessages([
            'expr(+(#1: _)): Literal has invalid value: Not a string, boolean '
                'or number. (Value: [1])',
          ]),
          analyzer,
        );
      });

      test('invalid var name', () {
        expectAnalysisErrors(
          let('0foo', 'a', 'b'),
          analysisErrorMessages([
            'expr(let(#0: _)): Literal has invalid value: Not a valid variable '
                'name. (Value: 0foo)'
          ]),
          analyzer,
        );
      });
    });

    group('UnknownOperation', () {
      test('error message', () {
        expectAnalysisErrors(
          Operation('foobar'),
          analysisErrorMessages([
            'expr(--> foobar() <--): The operation is not known.',
          ]),
          analyzer,
        );

        expectAnalysisErrors(
          add(0, Operation('foobar')),
          analysisErrorMessages([
            'expr(+(#1: --> foobar() <--)): The operation is not known.',
          ]),
          analyzer,
        );
      });
    });

    group('UnexpectedArgument', () {
      test('error message', () {
        expectAnalysisErrors(
          coercingOperation('+', [0, 1, 2]),
          analysisErrorMessages([
            'expr(+(#2: _)): Unexpected argument.',
          ]),
          analyzer,
        );
      });
    });
  });
}
