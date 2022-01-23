import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';

import 'type_system.dart';

Expression concat(Iterable<Object?> arguments) =>
    coercingOperation('concat', arguments);

void concatOperation<C>(DelegateBuilder<C> builder) =>
    builder.concatOperation<String, String>(
      'concat',
      stringType,
      const Range(1),
      stringType,
      <C>(arguments, __) => CompiledExpression((_) {
        final buffer = StringBuffer();
        for (final argument in arguments) {
          buffer.write(argument(_));
        }
        return buffer.toString();
      }),
    );
