import 'package:expressions/expressions.dart';

Expression coerceToExpression(Object? value) {
  if (value is! Expression) {
    return Literal(value);
  }
  return value;
}

Operation coercingOperation(String name, Iterable<Object?> arguments) =>
    Operation(name, arguments.map(coerceToExpression).toList());
