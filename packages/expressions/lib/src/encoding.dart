import 'dart:convert';

import 'expression.dart';

abstract class ExpressionDecoder<T> extends Converter<T, Expression> {}

abstract class ExpressionEncoder<T> extends Converter<Expression, T> {}

class ExpressionDecodingException implements Exception {
  ExpressionDecodingException(this.message, this.location);

  final String message;

  final ExpressionLocation location;

  @override
  String toString() => 'ExpressionDecodingException at $location: $message';
}
