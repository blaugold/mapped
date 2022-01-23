import 'package:expressions/expressions.dart';

import 'type_system.dart';

void testLiteral<C>(DelegateBuilder<C> builder) => builder
  ..literalTypeResolver((literal, context) {
    final value = literal.value;
    if (value is String) {
      return stringType;
    } else if (value is bool) {
      return booleanType;
    } else if (value is num) {
      return floatType;
    } else {
      return unknownType;
    }
  })
  ..literalChecker((literal, context) {
    final value = literal.value;
    if (value is! String && value is! num && value is! bool) {
      context.invalidLiteralValue('Not a string, boolean or number.');
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
