import 'package:expressions/expressions.dart';

import 'type_system.dart';

void literalDelegates(DelegateBuilder builder) => builder
  ..literalTypeResolver((literal, context) {
    final value = literal.value;
    if (value is String) {
      return stringType;
    } else if (value is num) {
      return floatType;
    } else {
      return unknownType;
    }
  })
  ..literalChecker((literal, context) {
    final value = literal.value;
    if (value is! String && value is! num) {
      context.invalidLiteralValue('Not a string or number.');
    }
  })
  ..literalCompiler(
    transform: (value) {
      if (value is int) {
        return value.toDouble();
      }
      return value;
    },
  );
