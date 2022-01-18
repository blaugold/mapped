abstract class Type {}

class BasicType implements Type {}

final voidType = BasicType();

class NullableType extends Type {
  NullableType(this.type) : assert(type is! NullableType);

  factory NullableType.from(Type type) {
    if (type is NullableType) {
      return type;
    } else {
      return NullableType(type);
    }
  }

  final Type type;
}

class TypeParameter extends Type {
  TypeParameter(this.name);

  final String name;
}

class ParameterizedType extends Type {
  ParameterizedType(this.type, this.typeArguments)
      : assert(typeArguments.isNotEmpty);

  final Type type;
  final List<Type> typeArguments;
}
