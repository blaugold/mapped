// ignore_for_file: prefer_int_literals

import 'dart:math';

import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';
import 'package:test/test.dart';

import 'fixtures/add_operation.dart';
import 'fixtures/any_operation.dart';
import 'fixtures/concat_operation.dart';
import 'fixtures/context_operation.dart';
import 'fixtures/cos_operation.dart';
import 'fixtures/operations.dart';
import 'fixtures/pi_operation.dart';
import 'fixtures/test_literal.dart';
import 'fixtures/type_system.dart';
import 'fixtures/typeof_operation.dart';

void main() {
  final compiler = ExpressionCompiler.fromDelegateBuilder(
    DelegateBuilder<TestContext>([
      testLiteral,
      ...allTestOperations,
    ]),
    context: [testRuntimeTypeSystem],
  );

  group('constantOperation', () {
    test('does not take any arguments', () {
      expectAnalysisErrors(
        coercingOperation('pi', [1]),
        [analysisErrorDescriptor(isUnexpectedArgument)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(piExpr(), floatType, compiler);
    });

    test('evaluates to constant', () {
      expectConstantExpression(piExpr(), pi, compiler);
    });
  });

  group('contextLookupOperation', () {
    test('does not take any arguments', () {
      expectAnalysisErrors(
        coercingOperation('context-string', [1]),
        [analysisErrorDescriptor(isUnexpectedArgument)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(contextString(), stringType, compiler);
    });

    test('evaluates to value from context', () {
      expectExpressionValue(
        contextString(),
        'a',
        TestContext(string: 'a'),
        compiler,
      );
      expectExpressionValue(
        contextFloat(),
        42.1,
        TestContext(float: 42.1),
        compiler,
      );
    });
  });

  group('reduceOperation', () {
    test('does require specified range of arguments', () {
      expectAnalysisErrors(
        any([]),
        [analysisErrorDescriptor(isTooFewArguments(minimum: 1))],
        compiler,
      );
    });

    test('does require specified type for arguments', () {
      expectAnalysisErrors(
        any([1]),
        [analysisErrorDescriptor(isIncompatibleExpressionType)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(any([true, true]), booleanType, compiler);
    });

    test('with context expression', () {
      expectExpressionValue(
        any([false, contextBoolean()]),
        true,
        TestContext(boolean: true),
        compiler,
      );
    });

    test('compiles to constant with constant arguments', () {
      expectConstantExpression(
        any([false, true]),
        true,
        compiler,
      );
    });
  });

  group('binaryReduceOperation', () {
    test('does require exactly 2 arguments', () {
      expectAnalysisErrors(
        coercingOperation('+', []),
        [analysisErrorDescriptor(isTooFewArguments(exact: 2))],
        compiler,
      );
    });

    test('does require specified type for arguments', () {
      expectAnalysisErrors(
        add(true, 1),
        [analysisErrorDescriptor(isIncompatibleExpressionType)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(add(0, 0), floatType, compiler);
    });

    test('with context expression', () {
      expectExpressionValue(
        add(1, contextFloat()),
        3.0,
        TestContext(float: 2),
        compiler,
      );
    });

    test('compiles to constant with constant arguments', () {
      expectConstantExpression(
        add(1, 2),
        3.0,
        compiler,
      );
    });
  });

  group('mapOperation', () {
    test('does require exactly 1 arguments', () {
      expectAnalysisErrors(
        coercingOperation('cos', []),
        [analysisErrorDescriptor(isTooFewArguments(exact: 1))],
        compiler,
      );
    });

    test('does require specified type for arguments', () {
      expectAnalysisErrors(
        cosExpr(true),
        [analysisErrorDescriptor(isIncompatibleExpressionType)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(cosExpr(0), floatType, compiler);
    });

    test('with context expression', () {
      expectExpressionValue(
        cosExpr(contextFloat()),
        1.0,
        TestContext(float: 0),
        compiler,
      );
    });

    test('compiles to constant with constant arguments', () {
      expectConstantExpression(
        cosExpr(0),
        1.0,
        compiler,
      );
    });
  });

  group('mapOperationWithAnalysisContext', () {
    test('does require exactly 1 arguments', () {
      expectAnalysisErrors(
        coercingOperation('typeof', []),
        [analysisErrorDescriptor(isTooFewArguments(exact: 1))],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(typeof(0), stringType, compiler);
    });

    test('with context expression', () {
      expectExpressionValue(
        typeof(contextFloat()),
        'float',
        TestContext(float: 0),
        compiler,
      );
    });

    test('compiles to constant with constant arguments', () {
      expectConstantExpression(
        typeof(0),
        'float',
        compiler,
      );
    });
  });

  group('concatOperation', () {
    test('does require specified range of arguments', () {
      expectAnalysisErrors(
        coercingOperation('concat', []),
        [analysisErrorDescriptor(isTooFewArguments(minimum: 1))],
        compiler,
      );
    });

    test('does require specified type for arguments', () {
      expectAnalysisErrors(
        concat([true]),
        [analysisErrorDescriptor(isIncompatibleExpressionType)],
        compiler,
      );
    });

    test('has static type', () {
      expectExpressionType(concat(['']), stringType, compiler);
    });

    test('evaluates with context expression', () {
      expectExpressionValue(
        concat([contextString(), 'cd']),
        'abcd',
        TestContext(string: 'ab'),
        compiler,
      );
    });

    test(
      'keeps order when partially optimizing constant argument groups',
      () {
        expectExpressionValue(
          concat(['ab', contextString(), 'ef', 'gh']),
          'abcdefgh',
          TestContext(string: 'cd'),
          compiler,
        );
      },
    );

    test('compiles to constant with constant arguments', () {
      expectConstantExpression(
        concat(['ab', 'cd']),
        'abcd',
        compiler,
      );
    });
  });
}
