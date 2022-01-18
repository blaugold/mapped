abstract class ExpressionType {
  const ExpressionType();

  bool isAssignableFrom(ExpressionType other);

  bool isAssignableTo(ExpressionType other) => other.isAssignableFrom(this);
}

class _UnknownType extends ExpressionType {
  const _UnknownType();

  @override
  bool isAssignableFrom(ExpressionType other) => false;

  @override
  String toString() => 'UnknownType';
}

const unknownType = _UnknownType();

class HierarchicalType extends ExpressionType {
  HierarchicalType(this.name, {this.superType});

  final String name;

  HierarchicalType? superType;

  late final List<HierarchicalType> allSuperTypes = [
    if (superType != null) superType!,
    ...superType?.allSuperTypes ?? [],
  ];

  @override
  bool isAssignableFrom(ExpressionType other) {
    if (this == other) {
      return true;
    }

    if (other is HierarchicalType) {
      return other.allSuperTypes.contains(this);
    }

    return false;
  }

  @override
  String toString() => name;
}

class UnionType extends ExpressionType {
  UnionType(this.types);

  final List<ExpressionType> types;

  @override
  bool isAssignableFrom(ExpressionType other) {
    if (this == other) {
      return true;
    }

    if (other is UnionType) {
      return other.types.every(isAssignableFrom);
    }

    return types.any((type) => type.isAssignableFrom(other));
  }
}

class _NullType extends ExpressionType {
  const _NullType();

  @override
  bool isAssignableFrom(ExpressionType other) => other == nullType;

  @override
  String toString() => 'Null';
}

const nullType = _NullType();

ExpressionType nullableType(ExpressionType type) {
  if (type is _NullType) {
    return type;
  }

  return UnionType([type, nullType]);
}
