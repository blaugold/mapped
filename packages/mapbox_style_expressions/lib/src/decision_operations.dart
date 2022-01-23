import 'package:expressions/expressions.dart';

import 'delegate_builder.dart';
import 'type_system.dart';

void decisionOperations(StyleExpressionDelegateBuilder builder) => builder
  ..mapOperation<bool, bool>(
    '!',
    booleanType,
    booleanType,
    (value) => !value,
  )
  ..reduceOperation<bool, bool>(
    'all',
    booleanType,
    const Range(2),
    booleanType,
    <C>(arguments, _) {
      switch (arguments.length) {
        case 2:
          final arg0 = arguments[0];
          final arg1 = arguments[0];
          return CompiledExpression((_) => arg0(_) && arg1(_));
        case 3:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          return CompiledExpression((_) => arg0(_) && arg1(_) && arg2(_));
        case 4:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          return CompiledExpression(
            (_) => arg0(_) && arg1(_) && arg2(_) && arg3(_),
          );
        case 5:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          return CompiledExpression(
            (_) => arg0(_) && arg1(_) && arg2(_) && arg3(_) && arg4(_),
          );
        case 6:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          return CompiledExpression(
            (_) =>
                arg0(_) && arg1(_) && arg2(_) && arg3(_) && arg4(_) && arg5(_),
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
                arg6(_) &&
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
                arg6(_) &&
                arg7(_) &&
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
                arg6(_) &&
                arg7(_) &&
                arg8(_) &&
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
                arg6(_) &&
                arg7(_) &&
                arg8(_) &&
                arg9(_) &&
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
                arg0(_) &&
                arg1(_) &&
                arg2(_) &&
                arg3(_) &&
                arg4(_) &&
                arg5(_) &&
                arg6(_) &&
                arg7(_) &&
                arg8(_) &&
                arg9(_) &&
                arg10(_) &&
                arg11(_),
          );
        default:
          return CompiledExpression((_) {
            for (final arg in arguments) {
              if (!arg(_)) {
                return false;
              }
            }
            return true;
          });
      }
    },
  )
  ..reduceOperation<bool, bool>(
    'any',
    booleanType,
    const Range(2),
    booleanType,
    <C>(arguments, _) {
      switch (arguments.length) {
        case 2:
          final arg0 = arguments[0];
          final arg1 = arguments[0];
          return CompiledExpression((_) => arg0(_) || arg1(_));
        case 3:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          return CompiledExpression((_) => arg0(_) || arg1(_) || arg2(_));
        case 4:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          return CompiledExpression(
            (_) => arg0(_) || arg1(_) || arg2(_) || arg3(_),
          );
        case 5:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          return CompiledExpression(
            (_) => arg0(_) || arg1(_) || arg2(_) || arg3(_) || arg4(_),
          );
        case 6:
          final arg0 = arguments[0];
          final arg1 = arguments[1];
          final arg2 = arguments[2];
          final arg3 = arguments[3];
          final arg4 = arguments[4];
          final arg5 = arguments[5];
          return CompiledExpression(
            (_) =>
                arg0(_) || arg1(_) || arg2(_) || arg3(_) || arg4(_) || arg5(_),
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
                arg6(_) ||
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
                arg6(_) ||
                arg7(_) ||
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
                arg6(_) ||
                arg7(_) ||
                arg8(_) ||
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
                arg6(_) ||
                arg7(_) ||
                arg8(_) ||
                arg9(_) ||
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
                arg0(_) ||
                arg1(_) ||
                arg2(_) ||
                arg3(_) ||
                arg4(_) ||
                arg5(_) ||
                arg6(_) ||
                arg7(_) ||
                arg8(_) ||
                arg9(_) ||
                arg10(_) ||
                arg11(_),
          );
        default:
          return CompiledExpression((_) {
            for (final arg in arguments) {
              if (arg(_)) {
                return true;
              }
            }
            return false;
          });
      }
    },
  );
