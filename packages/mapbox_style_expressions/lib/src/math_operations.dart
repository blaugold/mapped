import 'dart:math';

import 'package:expressions/expressions.dart';

import 'delegate_builder.dart';
import 'types.dart';
import 'utils.dart';

void mathOperations(StyleExpressionDelegateBuilder builder) => builder
  ..reduceOperation<double>(
    '-',
    numberType,
    const Range(1, 2),
    <C>(arguments) {
      switch (arguments.length) {
        case 1:
          final arg0 = arguments[0];
          return CompiledExpression((_) => -arg0(_));
        case 2:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          return CompiledExpression((_) => arg0(_) - arg1(_));
        default:
          unreachable();
      }
    },
  )
  ..reduceOperation<double>(
    '*',
    numberType,
    const Range(2),
    <C>(arguments) {
      switch (arguments.length) {
        case 2:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          return CompiledExpression((_) => arg0(_) * arg1(_));
        case 3:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          return CompiledExpression((_) => arg0(_) * arg1(_) * arg2(_));
        case 4:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          return CompiledExpression(
            (_) => arg0(_) * arg1(_) * arg2(_) * arg3(_),
          );
        case 5:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          return CompiledExpression(
            (_) => arg0(_) * arg1(_) * arg2(_) * arg3(_) * arg4(_),
          );
        case 6:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          return CompiledExpression(
            (_) => arg0(_) * arg1(_) * arg2(_) * arg3(_) * arg4(_) * arg5(_),
          );
        case 7:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_),
          );
        case 8:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_) *
                arg7(_),
          );
        case 9:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_) *
                arg7(_) *
                arg8(_),
          );
        case 10:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_) *
                arg7(_) *
                arg8(_) *
                arg9(_),
          );
        case 11:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          final arg10 = arguments[10];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_) *
                arg7(_) *
                arg8(_) *
                arg9(_) *
                arg10(_),
          );
        case 12:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          final arg10 = arguments[10];
          final arg11 = arguments[11];
          return CompiledExpression(
            (_) =>
                arg0(_) *
                arg1(_) *
                arg2(_) *
                arg3(_) *
                arg4(_) *
                arg5(_) *
                arg6(_) *
                arg7(_) *
                arg8(_) *
                arg9(_) *
                arg10(_) *
                arg11(_),
          );
        default:
          return CompiledExpression(
            (_) => arguments.fold<double>(1, (a, b) => a * b(_)),
          );
      }
    },
  )
  ..binaryMathOperation('/', (a, b) => a / b)
  ..binaryMathOperation('%', (a, b) => a.remainder(b))
  ..binaryMathOperation('^', (a, b) => pow(a, b).toDouble())
  ..reduceOperation<double>(
    '+',
    numberType,
    const Range(2),
    <C>(arguments) {
      switch (arguments.length) {
        case 2:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          return CompiledExpression((_) => arg0(_) + arg1(_));
        case 3:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          return CompiledExpression((_) => arg0(_) + arg1(_) + arg2(_));
        case 4:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          return CompiledExpression(
            (_) => arg0(_) + arg1(_) + arg2(_) + arg3(_),
          );
        case 5:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          return CompiledExpression(
            (_) => arg0(_) + arg1(_) + arg2(_) + arg3(_) + arg4(_),
          );
        case 6:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          return CompiledExpression(
            (_) => arg0(_) + arg1(_) + arg2(_) + arg3(_) + arg4(_) + arg5(_),
          );
        case 7:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_),
          );
        case 8:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_) +
                arg7(_),
          );
        case 9:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_) +
                arg7(_) +
                arg8(_),
          );
        case 10:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_) +
                arg7(_) +
                arg8(_) +
                arg9(_),
          );
        case 11:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          final arg10 = arguments[10];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_) +
                arg7(_) +
                arg8(_) +
                arg9(_) +
                arg10(_),
          );
        case 12:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          final arg6 = arguments[6];
          final arg7 = arguments[7];
          final arg8 = arguments[8];
          final arg9 = arguments[9];
          final arg10 = arguments[10];
          final arg11 = arguments[11];
          return CompiledExpression(
            (_) =>
                arg0(_) +
                arg1(_) +
                arg2(_) +
                arg3(_) +
                arg4(_) +
                arg5(_) +
                arg6(_) +
                arg7(_) +
                arg8(_) +
                arg9(_) +
                arg10(_) +
                arg11(_),
          );
        default:
          return CompiledExpression(
            (_) => arguments.fold<double>(1, (a, b) => a + b(_)),
          );
      }
    },
  )
  ..unaryMathOperation('abs', (value) => value.abs())
  ..unaryMathOperation('acos', acos)
  ..unaryMathOperation('asin', asin)
  ..unaryMathOperation('atan', atan)
  ..unaryMathOperation('ceil', (value) => value.ceil().toDouble())
  ..unaryMathOperation('cos', cos)
  // TODO: distance
  ..mathConstantOperation('e', e)
  ..unaryMathOperation('floor', (value) => value.floor().toDouble())
  ..unaryMathOperation('ln', log)
  ..mathConstantOperation('ln2', ln2)
  ..unaryMathOperation('log10', (value) => log(value) / ln10)
  ..unaryMathOperation('log2', (value) => log(value) / ln2)
  ..reduceOperation<double>(
    'max',
    numberType,
    const Range(2),
    <C>(arguments) => CompiledExpression(
      (_) => arguments
          .skip(1)
          .fold<double>(arguments[0](_), (a, b) => max(a, b(_))),
    ),
  )
  ..reduceOperation<double>(
    'min',
    numberType,
    const Range(2),
    <C>(arguments) => CompiledExpression(
      (_) => arguments
          .skip(1)
          .fold<double>(arguments[0](_), (a, b) => min(a, b(_))),
    ),
  )
  ..mathConstantOperation('pi', pi)
  ..unaryMathOperation('round', (value) => value.roundToDouble())
  ..unaryMathOperation('sin', sin)
  ..unaryMathOperation('sqrt', sqrt)
  ..unaryMathOperation('tan', tan);
