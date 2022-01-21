import 'package:expressions/expressions.dart';

import 'delegate_builder.dart';

void literalExpression(StyleExpressionDelegateBuilder builder) => builder
  ..literalChecker((literal, context) {
    if (!isValidLiteralValue(literal.value)) {
      context.invalidLiteralValue();
    }
  })
  ..literalTypeResolver(
    (literal, context) =>
        context.runtimeTypeSystem.typeOfRuntimeValue(literal.value),
  )
  ..literalCompiler(transform: preprocessLiteralValue);

bool isValidLiteralValue(Object? value) {
  if (value == null) {
    return true;
  }

  if (value is String || value is bool || value is num) {
    return true;
  }

  if (value is List) {
    return value.every(isValidLiteralValue);
  }

  if (value is Map<String, Object?>) {
    return value.values.every(isValidLiteralValue);
  }

  return false;
}

Object? preprocessLiteralValue(Object? value) {
  if (value is int) {
    return value.toDouble();
  }

  if (value is List) {
    return value.map(preprocessLiteralValue).toList();
  }

  if (value is Map<String, Object?>) {
    return value
        .map((key, value) => MapEntry(key, preprocessLiteralValue(value)));
  }

  return value;
}
