import 'package:collection/collection.dart';
import 'package:expressions/expressions.dart';

JsonExpressionDecoder styleExpressionDecoder() => JsonExpressionDecoder(
      operationDecoders: {
        'literal': const LiteralDecoder(),
        'match': const MatchDecoder(),
      },
    );

JsonExpressionEncoder styleExpressionEncoder() => JsonExpressionEncoder(
      operationEncoders: {
        'literal': const LiteralEncoder(),
        'match': const MatchEncoder(),
      },
    );

class LiteralDecoder extends JsonOperationDecoder {
  const LiteralDecoder();

  @override
  Expression decode(
    String operation,
    List<Object?> arguments,
    ExpressionLocation location,
    JsonExpressionDecoder decoder,
  ) {
    if (arguments.length != 1) {
      throw JsonExpressionDecodingException(
        'Expected exactly one argument for the literal expression.',
        location,
        arguments,
      );
    }

    final value = arguments[0];
    if (value is! List && value is! Map) {
      throw JsonExpressionDecodingException(
        'Cannot decode a value of type ${value.runtimeType} as a literal.',
        location.child(ExpressionLocationType.operationArgument, 0),
        value,
      );
    }

    return Operation(operation, [Literal(arguments[0])]);
  }
}

class LiteralEncoder extends JsonOperationEncoder {
  const LiteralEncoder();

  @override
  Object? encode(Operation operation, JsonExpressionEncoder encoder) => [
        operation.name,
        (operation.arguments[0] as Literal).value,
      ];
}

class MatchDecoder extends JsonOperationDecoder {
  const MatchDecoder();

  @override
  Expression decode(
    String operation,
    List<Object?> arguments,
    ExpressionLocation location,
    JsonExpressionDecoder decoder,
  ) =>
      Operation(
        operation,
        arguments.mapIndexed((index, argument) {
          final isLabel = index.isOdd && index != (arguments.length - 1);
          if (isLabel && argument is List<Object?>) {
            return Literal(argument);
          }

          return decoder.decode(
            argument,
            location.child(ExpressionLocationType.operationArgument, index),
          );
        }).toList(),
      );
}

class MatchEncoder extends JsonOperationEncoder {
  const MatchEncoder();

  @override
  Object? encode(Operation operation, JsonExpressionEncoder encoder) => [
        operation.name,
        ...operation.arguments.mapIndexed((index, argument) {
          final isLabel =
              index.isOdd && index != (operation.arguments.length - 1);
          if (isLabel && argument is Literal) {
            return argument.value;
          }

          return encoder.encode(argument);
        }).toList(),
      ];
}
