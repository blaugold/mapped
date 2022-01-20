import 'package:expressions/expressions.dart';

import 'delegate_builder.dart';
import 'types.dart';

void literalExpression(StyleExpressionDelegateBuilder builder) => builder
  ..literalChecker((literal, context) {
    final value = literal.value;
    if (value is! String && value is! bool && value is! num) {
      context.invalidLiteralValue('Must be a string, boolean or number.');
    }
  })
  ..literalTypeResolver((literal, context) {
    final value = literal.value;
    if (value is String) {
      return stringType;
    } else if (value is bool) {
      return booleanType;
    } else if (value is num) {
      return numberType;
    } else {
      return unknownType;
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
