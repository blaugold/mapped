import 'package:expressions/expressions.dart';

final valueType = HierarchicalType('value');

final nullableValueType = nullableType(valueType);

final stringType = HierarchicalType('string', superType: valueType);

final booleanType = HierarchicalType('boolean', superType: valueType);

final numberType = HierarchicalType('number', superType: valueType);

final objectType = HierarchicalType('object', superType: valueType);

class ArrayType extends HierarchicalType {
  ArrayType({this.itemType, this.length})
      : super('array', superType: valueType);

  final ExpressionType? itemType;

  final int? length;

  @override
  bool isAssignableFrom(ExpressionType other) {
    if (other is! ArrayType) {
      return false;
    }

    final itemType = this.itemType;
    final otherItemType = other.itemType;
    if (itemType != null) {
      if (otherItemType == null) {
        return false;
      }

      if (!itemType.isAssignableFrom(otherItemType)) {
        return false;
      }
    }

    final length = this.length;
    final otherLength = other.length;
    if (length != null) {
      if (otherLength == null) {
        return false;
      }

      if (length != otherLength) {
        return false;
      }
    }

    return true;
  }

  @override
  String toString() {
    final buffer = StringBuffer(name);

    if (itemType != null || length != null) {
      buffer.write('<');
      if (itemType != null) {
        buffer.write(itemType);
      }
      if (itemType != null && length != null) {
        buffer.write(', ');
      }
      if (length != null) {
        buffer.write(length);
      }
      buffer.write('>');
    }

    return buffer.toString();
  }
}

class ArrayRuntimeType extends RuntimeTypeDelegate {
  const ArrayRuntimeType();

  @override
  bool canHandleType(ExpressionType type) => type is ArrayType;

  @override
  bool canHandleRuntimeValue(Object? value) => value is List;

  @override
  R runtimeTypeOfType<R>(
    covariant ArrayType type,
    R Function<T>() f,
    RuntimeTypeSystem typeSystem,
  ) {
    final itemType = type.itemType;
    if (itemType == null) {
      return f<List>();
    }

    return typeSystem.runtimeTypeOfType(itemType, <T>() => f<List<T>>());
  }

  @override
  ExpressionType typeOfRuntimeValue(
    covariant List value,
    RuntimeTypeSystem typeSystem,
  ) {
    // We find the type of the array items by taking the first item's type
    // end check if all other items are assignable to it.
    // If not, we fallback to the nullableValueType.
    // This is a simple approach without type widening.
    var itemType = nullableValueType;
    final itemTypes = value.map(typeSystem.typeOfRuntimeValue).toList();
    if (itemTypes.isNotEmpty) {
      itemType = itemTypes.first;
      for (final otherItemType in itemTypes.skip(1)) {
        if (!itemType.isAssignableFrom(otherItemType)) {
          itemType = nullableValueType;
          break;
        }
      }
    }

    return ArrayType(itemType: itemType, length: value.length);
  }
}

final styleExpressionRuntimeTypeSystem = RuntimeTypeSystem([
  // ignore: prefer_void_to_null
  const DefiniteRuntimeType<Null>(nullType),
  DefiniteRuntimeType<String>(stringType),
  DefiniteRuntimeType<bool>(booleanType),
  DefiniteRuntimeType<num>(numberType),
  DefiniteRuntimeType<Map>(objectType),
  const ArrayRuntimeType(),
  DefiniteRuntimeType<Object>(valueType),
]);
