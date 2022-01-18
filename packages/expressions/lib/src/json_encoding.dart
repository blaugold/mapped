import 'dart:convert';

import 'encoding.dart';
import 'expression.dart';
import 'utils.dart';

class JsonExpressionDecoder extends ExpressionDecoder<Object?> {
  JsonExpressionDecoder({
    this.operationDecoders = const {},
  });

  /// Decoders for operations that need to be decoded specially.
  final Map<String, JsonOperationDecoder> operationDecoders;

  @override
  Expression convert(Object? input) => decode(input, ExpressionLocation.root());

  Expression decode(Object? value, ExpressionLocation parentLocation) {
    if (value is String || value is bool || value is num || value == null) {
      return Literal(value);
    }

    if (value is List<Object?>) {
      if (value.isEmpty) {
        throw JsonExpressionDecodingException(
          'Cannot decode an empty array as an expression.',
          parentLocation,
          value,
        );
      }

      final operation = value[0]!;
      if (operation is! String) {
        throw JsonExpressionDecodingException(
          'Expected the first element of the array to be the name of an '
          'expression.',
          parentLocation,
          value,
        );
      }

      final operationDecoder = operationDecoders[operation];
      if (operationDecoder != null) {
        return operationDecoder.decode(
          operation,
          value.sublist(1),
          parentLocation.child(ExpressionLocationType.operation, operation),
          this,
        );
      }

      var i = 0;
      return Operation(operation, [
        for (final element in value.skip(1))
          decode(
            element,
            parentLocation.child(ExpressionLocationType.operationArgument, i++),
          )
      ]);
    }

    if (value is Map<String, Object?>) {
      return ExpressionsObject({
        for (final entry in value.entries)
          entry.key: decode(
            entry.value,
            parentLocation.child(ExpressionLocationType.objectField, entry.key),
          ),
      });
    }

    throw JsonExpressionDecodingException(
      'Cannot decode a value of type ${value.runtimeType}.',
      parentLocation,
      value,
    );
  }
}

abstract class JsonOperationDecoder {
  const JsonOperationDecoder();

  Expression decode(
    String operation,
    List<Object?> arguments,
    ExpressionLocation location,
    JsonExpressionDecoder decoder,
  );
}

class JsonExpressionDecodingException extends ExpressionDecodingException {
  JsonExpressionDecodingException(
    String message,
    ExpressionLocation location,
    this.value,
  ) : super(message, location);

  final Object? value;

  @override
  String toString() => '${super.toString()}\n'
      'Value:\n'
      '${const JsonEncoder.withIndent('  ').convert(value)}';
}

class JsonExpressionEncoder extends ExpressionEncoder<Object?> {
  JsonExpressionEncoder({
    this.operationEncoders = const {},
  });

  /// Decoders for operations that need to be encoded specially.
  final Map<String, JsonOperationEncoder> operationEncoders;

  @override
  Object? convert(Expression input) => encode(input);

  Object? encode(Expression expression) {
    if (expression is Literal) {
      final value = expression.value;
      assert(value is String || value is bool || value is num || value == null);
      return value;
    }

    if (expression is ExpressionsObject) {
      return {
        for (final entry in expression.fields.entries)
          entry.key: encode(entry.value),
      };
    }

    if (expression is Operation) {
      final expressionEncoder = operationEncoders[expression.name];
      if (expressionEncoder != null) {
        return expressionEncoder.encode(expression, this);
      }

      return [
        expression.name,
        for (final argument in expression.arguments) encode(argument)
      ];
    }

    unreachable();
  }
}

abstract class JsonOperationEncoder {
  const JsonOperationEncoder();

  Object? encode(
    Operation operation,
    JsonExpressionEncoder encoder,
  );
}
