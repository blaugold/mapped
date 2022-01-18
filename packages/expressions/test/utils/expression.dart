import 'package:expressions/expressions.dart';

Expression coerceExpression(Object? value) {
  if (value is! Expression) {
    return Literal(value);
  }
  return value;
}

Operation testOperation(String name, Iterable<Object?> arguments) =>
    Operation(name, arguments.map(coerceExpression).toList());
