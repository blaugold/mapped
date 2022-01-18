import 'package:collection/collection.dart';

import 'type.dart';

abstract class ModelElement {
  ModelElement({
    this.annotations = const [],
  });

  final List<Object> annotations;
}

class Docs {
  Docs(this.docs);

  final String docs;
}

class TypeDiscriminatorProperty {}

class TypeDiscriminatorValue {
  TypeDiscriminatorValue(this.value);

  final EnumValue value;
}

final objectType = BasicType();

final stringType = BasicType();

final booleanType = BasicType();

final numberType = BasicType();

class ArrayType extends ModelElement implements Type {
  ArrayType({
    required this.elementType,
    this.size,
    List<Object> annotations = const [],
  }) : super(annotations: annotations);

  final Type elementType;
  final int? size;
}

class StringMapType implements Type {
  StringMapType(this.valueType);

  final Type valueType;
}

class EnumType extends ModelElement implements Type {
  EnumType({
    required this.name,
    required this.values,
    List<Object> annotations = const [],
  }) : super(annotations: annotations) {
    for (final value in values) {
      value.enumType = this;
    }
  }

  final String name;
  final List<EnumValue> values;
}

class EnumValue extends ModelElement {
  EnumValue({
    required this.value,
    List<Object> annotations = const [],
  }) : super(annotations: annotations);

  final Object value;
  late final EnumType enumType;
}

class DataType extends ModelElement implements Type {
  DataType({
    required this.name,
    this.isAbstract = false,
    List<Object> annotations = const [],
  }) : super(annotations: annotations);

  final String name;

  final bool isAbstract;

  bool get hasSuperType => superType != null;

  DataType? get superType => _superType;
  DataType? _superType;

  Iterable<DataType> get superTypes sync* {
    final superType = this.superType;
    if (superType != null) {
      yield superType;
      yield* superType.superTypes;
    }
  }

  final List<DataType> subTypes = [];

  final List<DataProperty> ownFixedProperties = [];

  Iterable<DataProperty> get fixedProperties sync* {
    yield* ownFixedProperties;
    yield* superType?.fixedProperties.where(
          (superProperty) => !ownFixedProperties.any(
            (ownProperty) => superProperty.name == ownProperty.name,
          ),
        ) ??
        [];
  }

  DataProperty? ownDynamicProperties;

  DataProperty? get dynamicProperties =>
      ownDynamicProperties ?? superType?.dynamicProperties;

  EnumValue? get typeDiscriminatorValue =>
      annotations.whereType<TypeDiscriminatorValue>().firstOrNull?.value;

  DataProperty? get typeDiscriminatorProperty => ownFixedProperties
      .where((property) => property.isTypeDiscriminator)
      .firstOrNull;

  void addSubType(DataType type) {
    subTypes.add(type);
    type._superType = this;
  }

  void addOwnFixedProperty(DataProperty property) {
    ownFixedProperties.add(property);
    property._data = this;
  }

  void setOwnDynamicProperties(DataProperty property) {
    ownDynamicProperties = property;
    property._data = this;
  }
}

class DataProperty extends ModelElement {
  DataProperty({
    required this.name,
    required this.type,
    List<Object> annotations = const [],
  }) : super(annotations: annotations);

  DataType get data => _data;
  late final DataType _data;

  final String? name;

  final Type type;

  bool get isTypeDiscriminator =>
      annotations.whereType<TypeDiscriminatorProperty>().isNotEmpty;

  bool get isOverride => data.superTypes.any((superData) {
        if (name == null) {
          return superData.ownDynamicProperties != null;
        } else {
          return superData.ownFixedProperties
              .any((property) => property.name == name);
        }
      });

  bool get isOverridden => data.subTypes.any((subData) {
        if (name == null) {
          return subData.ownDynamicProperties != null;
        } else {
          return subData.ownFixedProperties
              .any((property) => property.name == name);
        }
      });
}
