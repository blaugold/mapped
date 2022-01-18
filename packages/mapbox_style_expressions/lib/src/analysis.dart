import 'package:expressions/expressions.dart';

import 'types.dart';

void literalTypeResolverDelegate(DelegateBuilder builder) {
  builder.literalTypeResolver((literal, context) {
    final value = literal.value;
    if (value is num) {
      return numberType;
    } else if (value is bool) {
      return booleanType;
    } else if (value is String) {
      return stringType;
    } else {
      return unknownType;
    }
  });
}
