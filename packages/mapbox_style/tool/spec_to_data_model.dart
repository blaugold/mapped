import 'data_model.dart';
import 'style_spec.dart' hide EnumValue;
import 'style_spec.dart' as spec;
import 'type.dart';

final anyType = NullableType(objectType);

final colorType = BasicType();

final formattedType = BasicType();

final resolvedImageType = BasicType();

final promoteIdType = BasicType();

final metadataType = StringMapType(anyType);

class ExpressionType implements Type {
  ExpressionType(this.outputType);

  final Type outputType;
}

List<ModelElement> styleSpecToDataModel(StyleSpec spec) {
  final enumTypes = _buildEnumTypes(spec);
  final dataTypes = _buildDataTypes(spec, enumTypes);

  return [
    ...enumTypes.values,
    ...dataTypes.values,
  ];
}

Map<String, EnumType> _buildEnumTypes(StyleSpec spec) {
  final enumTypes = <String, EnumType>{};

  // For the source type enum we have to collect the enum values from the
  // different source objects.
  final sourceTypeValues = <EnumValue>[];

  for (final objectSpec in spec.children.whereType<ObjectSpec>()) {
    for (final property in objectSpec.children) {
      var type = property.type.type;
      if (type is ArraySpec) {
        type = type.values;
      }
      if (type is EnumSpec) {
        final enumName = type.resolvedName;
        if (enumName == 'sourceType') {
          sourceTypeValues.addAll(type.children.map(_buildEnumValue));
        }

        enumTypes.putIfAbsent(
          enumName,
          () => EnumType(
            name: enumName,
            annotations: [
              if (property.type.doc != null) Docs(property.type.doc!),
            ],
            values: (type as EnumSpec).children.map(_buildEnumValue).toList(),
          ),
        );
      }
    }
  }

  enumTypes['sourceType'] = EnumType(
    name: 'sourceType',
    annotations: [Docs('A source type.')],
    values: sourceTypeValues,
  );

  return enumTypes;
}

EnumValue _buildEnumValue(spec.EnumValue value) => EnumValue(
      value: value.value,
      annotations: [
        if (value.doc != null) Docs(value.doc!),
      ],
    );

Map<String, DataType> _buildDataTypes(
  StyleSpec spec,
  Map<String, EnumType> enums,
) {
  final dataTypes = <String, DataType>{};

  final sourceType = DataType(
    name: 'source',
    isAbstract: true,
  )..addOwnFixedProperty(
      DataProperty(
        name: 'type',
        type: enums['sourceType']!,
        annotations: [TypeDiscriminatorProperty()],
      ),
    );
  dataTypes[sourceType.name] = sourceType;

  final layoutPropertiesType = DataType(
    name: 'layout_properties',
    isAbstract: true,
  );
  dataTypes[layoutPropertiesType.name] = layoutPropertiesType;

  final paintPropertiesType = DataType(
    name: 'paint_properties',
    isAbstract: true,
  );
  dataTypes[paintPropertiesType.name] = paintPropertiesType;

  // Build all the data types.
  for (final objectSpec in spec.children.whereType<ObjectSpec>()) {
    if (objectSpec.isLayer) {
      final layerType = DataType(
        name: objectSpec.resolvedName,
        isAbstract: true,
      );
      dataTypes[layerType.name] = layerType;

      for (final layerTypeValue in enums['layerType']!.values) {
        final layerName = '${layerTypeValue.value}_layer';
        final subLayerType = DataType(
          name: layerName,
          annotations: [
            TypeDiscriminatorValue(layerTypeValue),
          ],
        );
        layerType.addSubType(subLayerType);
        dataTypes[subLayerType.name] = subLayerType;
      }
      continue;
    }
    if (objectSpec.isPromoteId) {
      // PromoteId is not generated, but instead hand coded.
      continue;
    }
    if (objectSpec.isSource) {
      final sourceTypeEnum = enums['sourceType']!;
      final sourceTypeValue = sourceTypeEnum.values.firstWhere(
        (value) =>
            'source_${value.value}'.replaceAll('-', '_') == objectSpec.name,
      );
      final subSourceType = DataType(
        name: objectSpec.resolvedName,
        annotations: [
          TypeDiscriminatorValue(sourceTypeValue),
        ],
      );
      sourceType.addSubType(subSourceType);
      dataTypes[subSourceType.name] = subSourceType;
      continue;
    }
    if (objectSpec.isLayoutProperties) {
      final subLayoutPropertiesType = DataType(name: objectSpec.resolvedName);
      layoutPropertiesType.addSubType(subLayoutPropertiesType);
      dataTypes[subLayoutPropertiesType.name] = subLayoutPropertiesType;
      continue;
    }
    if (objectSpec.isPaintProperties) {
      final subPaintProperties = DataType(name: objectSpec.resolvedName);
      paintPropertiesType.addSubType(subPaintProperties);
      dataTypes[subPaintProperties.name] = subPaintProperties;
      continue;
    }

    // Build object without special handling.
    dataTypes[objectSpec.resolvedName] = DataType(
      name: objectSpec.resolvedName,
    );
  }

  // Add properties to the data types.
  for (final object in spec.children.whereType<ObjectSpec>()) {
    if (object.isPromoteId) {
      // PromoteId is not generated, but instead hand coded.
      continue;
    }

    final dataType = dataTypes[object.resolvedName]!;
    final transitionType = dataTypes['transition']!;

    for (final property in object.children) {
      if (object.isSource && property.isType) {
        // The super source type already has a type property and we don't
        // want to override it with a property of the same type in sub types.
        continue;
      }

      final dataProperty = _buildDataProperty(
        property,
        enums,
        dataTypes,
      );

      if (object.isLayer && property.isType) {
        dataProperty.annotations.add(TypeDiscriminatorProperty());
      }

      if (property.isAdditionalProperty) {
        dataType.setOwnDynamicProperties(dataProperty);
      } else {
        dataType.addOwnFixedProperty(dataProperty);
      }

      // Add *-transition properties to transitionable properties.
      if (property.isTransitionable) {
        dataType.addOwnFixedProperty(
          DataProperty(
            name: '${property.name}-transition',
            type: transitionType,
          ),
        );
      }
    }

    if (object.isLayer) {
      for (final layerType in dataType.subTypes) {
        final layerTypeEnum = layerType.name.replaceFirst('_layer', '');
        final layout = dataTypes.entries
            .firstWhere((element) => element.key == '${layerTypeEnum}_layout')
            .value;
        final paint = dataTypes.entries
            .firstWhere((element) => element.key == '${layerTypeEnum}_paint')
            .value;

        layerType
          ..addOwnFixedProperty(
            DataProperty(
              name: 'layout',
              type: layout,
            ),
          )
          ..addOwnFixedProperty(
            DataProperty(
              name: 'paint',
              type: paint,
            ),
          );
      }
      continue;
    }
  }

  return dataTypes;
}

DataProperty _buildDataProperty(
  PropertySpec property,
  Map<String, EnumType> enums,
  Map<String, DataType> objects,
) {
  Type type;
  if (property.isFilter) {
    type = booleanType;
  } else if (property.isMetadata) {
    type = metadataType;
  } else {
    type = property.type.resolvedType(enums, objects);
  }

  if (property.isExpression || property.isFilter) {
    type = ExpressionType(type);
  }

  return DataProperty(
    name: property.isAdditionalProperty ? null : property.name,
    annotations: [
      if (property.type.doc != null) Docs(property.type.doc!),
    ],
    type: type,
  );
}

extension _UnionSpecExt on UnionSpec {
  bool get isSource => name == 'source';
  bool get isLayoutProperties => name == 'layout';
  bool get isPaintProperties => name == 'paint';

  String get resolvedName {
    if (isSource) {
      return 'source';
    }
    if (isLayoutProperties) {
      return 'layout_properties';
    }
    if (isPaintProperties) {
      return 'paint_properties';
    }
    throw UnsupportedError('Cannot resolve union name for $name');
  }
}

extension _ObjectSpecExt on ObjectSpec {
  bool get isRoot => name == r'$root';
  bool get isProjection => name == 'projection';
  bool get isLayer => name == 'layer';
  bool get isSource => name.startsWith('source_');
  bool get isLayoutProperties => name.startsWith('layout_');
  bool get isPaintProperties => name.startsWith('paint_');
  bool get isPromoteId => name == 'promoteId';

  String get resolvedName {
    if (isRoot) {
      return 'Style';
    }
    if (isLayoutProperties) {
      return '${name.replaceFirst('layout_', '')}_layout';
    }
    if (isPaintProperties) {
      return '${name.replaceFirst('paint_', '')}_paint';
    }
    if (isSource) {
      return '${name.replaceFirst('source_', '')}_source';
    }

    return name;
  }
}

extension _PropertySpecExt on PropertySpec {
  bool get isType => name == 'type';
  bool get isLayerType => parent.isLayer && isType;
  bool get isSourceType => parent.isSource && isType;
  bool get isTileScheme => parent.isSource && name == 'scheme';
  bool get isLayerVisibility =>
      parent.isLayoutProperties && name == 'visibility';
  bool get isProjectionName => parent.isProjection && name == 'name';
  bool get isFilter => name == 'filter';
  bool get isMetadata => name == 'metadata';
  bool get isLightAnchor => parent.name == 'light' && name == 'anchor';
  bool get isDemEncoding =>
      parent.name == 'source_raster_dem' && name == 'encoding';
}

extension _EnumSpecExt on EnumSpec {
  String get resolvedName {
    final property = elementPathReversed.whereType<PropertySpec>().first;

    if (property.isLayerType) {
      return 'layerType';
    }
    if (property.isSourceType) {
      return 'sourceType';
    }
    if (property.isTileScheme) {
      return 'tileScheme';
    }
    if (property.isLayerVisibility) {
      return 'layerVisibility';
    }
    if (property.isProjectionName) {
      return 'projectionName';
    }
    if (property.isLightAnchor) {
      return 'lightAnchor';
    }
    if (property.isDemEncoding) {
      return 'demEncoding';
    }

    return property.name;
  }
}

extension _SpecElementExt on SpecElement {
  Type resolvedType(
    Map<String, EnumType> enums,
    Map<String, DataType> objects,
  ) {
    final self = this;
    if (self is ValueSpec) {
      return self.type.resolvedType(enums, objects);
    }
    if (self is AnySpec) {
      return anyType;
    }
    if (self is StringSpec) {
      return stringType;
    }
    if (self is NumberSpec) {
      return numberType;
    }
    if (self is BooleanSpec) {
      return booleanType;
    }
    if (self is ColorSpec) {
      return colorType;
    }
    if (self is FormattedSpec) {
      return formattedType;
    }
    if (self is ResolvedImageSpec) {
      return resolvedImageType;
    }
    if (self is EnumSpec) {
      return enums[self.resolvedName]!;
    }
    if (self is ObjectSpec) {
      if (self.isPromoteId) {
        return promoteIdType;
      }
      return objects[self.resolvedName]!;
    }
    if (self is UnionSpec) {
      return objects[self.resolvedName]!;
    }
    if (self is ArraySpec) {
      final parent = self.parent;
      return ArrayType(
        elementType: self.values.resolvedType(enums, objects),
        size: parent is ValueSpec ? parent.length : null,
      );
    }

    throw UnsupportedError('Cannot resolve type for spec element: $self');
  }
}
