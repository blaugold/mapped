import 'dart:math';

import 'package:expressions/src/expression_parser.dart';
import 'package:test/test.dart';

import 'utils/matcher.dart';

void main() {
  final parser = ExpressionParser();

  void expectParsedExpression(String input, Object? expected) {
    expect(
      () => expect(parser.parse(input), expected, reason: 'input: $input'),
      returnsNormally,
      reason: 'input: $input',
    );
  }

  void expectParsedExpressions(Map<String, Object?> expected) {
    for (final entry in expected.entries) {
      expectParsedExpression(entry.key, entry.value);
    }
  }

  test('parse valid inputs', () {
    expectParsedExpressions({
      'null': literal(),
      ' null': literal(),
      'null ': literal(),
      ' null ': literal(),
      'true': literal(true),
      'false': literal(false),
      '0': literal(0),
      '00': literal(0),
      '.0': literal(0),
      '0.0': literal(0),
      '.1': literal(.1),
      '0.1': literal(.1),
      '.10': literal(.1),
      '.01': literal(.01),
      '0.01': literal(.01),
      '.010': literal(.01),
      '0.010': literal(.01),
      '$pi': literal(pi),
      '1': literal(1),
      '01': literal(1),
      '1.0': literal(1),
      '01.0': literal(1),
      '10': literal(10),
      '010': literal(10),
      '10.0': literal(10),
      '010.0': literal(10),
      'foo()': operation('foo'),
      'foo(true)': operation('foo', [true]),
      'foo(true )': operation('foo', [true]),
      'foo( true)': operation('foo', [true]),
      'foo( true )': operation('foo', [true]),
      'foo(true,)': operation('foo', [true]),
      'foo(true, )': operation('foo', [true]),
      'foo( true,)': operation('foo', [true]),
      'foo( true, )': operation('foo', [true]),
      'foo( true , )': operation('foo', [true]),
      'foo(true,true)': operation('foo', [true, true]),
      'foo(true,true )': operation('foo', [true, true]),
      'foo(true, true )': operation('foo', [true, true]),
      'foo(true , true )': operation('foo', [true, true]),
      'foo(true , true, )': operation('foo', [true, true]),
      'foo(true , true , )': operation('foo', [true, true]),
      'foo(bar())': operation('foo', [operation('bar')]),
      'foo( bar())': operation('foo', [operation('bar')]),
      'foo(bar() )': operation('foo', [operation('bar')]),
      'foo( bar() )': operation('foo', [operation('bar')]),
      'foo(bar(true))': operation('foo', [
        operation('bar', [true])
      ]),
      '''
      foo(
        bar(true),
        123,
        false,
        null,
        buz(),
      )
      ''': operation('foo', [
        operation('bar', [true]),
        123,
        false,
        null,
        operation('buz'),
      ]),
    });
  });
}
