import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';

import 'type_system.dart';

Expression any(Iterable<Object?> arguments) =>
    coercingOperation('any', arguments);

void anyOperation<C>(DelegateBuilder<C> builder) =>
    builder.reduceOperation<bool, bool>(
      'any',
      booleanType,
      const Range(1),
      booleanType,
      <C>(arguments, __) => CompiledExpression((_) {
        for (final arg in arguments) {
          if (arg(_)) {
            return true;
          }
        }
        return false;
      }),
    );
