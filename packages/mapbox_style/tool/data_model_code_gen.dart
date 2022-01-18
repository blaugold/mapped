import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;

import 'code_gen.dart';
import 'data_model.dart';
import 'type.dart';
import 'utils.dart';

Future<void> generateDataModelDartCode({
  required String modelFilePath,
  required CodeGenContext context,
  required List<ModelElement> model,
  List<String> ignoredLints = const [],
}) async {
  final modelBasename = p.basenameWithoutExtension(modelFilePath);
  final generatedFilePath = p.join(
    p.dirname(modelFilePath),
    '$modelBasename.g.dart',
  );

  final fileGenerator = DartFileGenerator(
    partOf: p.basename(modelFilePath),
    ignoredLints: ignoredLints,
    generateTopLevelDeclarations: (context, writeBuffer) sync* {
      for (final generator in context.getAllOfType<ModelElementGenerator>()) {
        for (final element in model) {
          generator.generate(element);
          yield null;
        }
      }
    },
  );

  await DartFileGenerator.generateFile(
    context: context,
    generator: fileGenerator,
    filePath: generatedFilePath,
  );
}

final dataMixinType = BasicType();

final dataContextType = BasicType();

final mapMixinType = BasicType();

final iterableType = BasicType();

String? dataModelTypeResolver(Type type, DartTypeProvider getDartType) {
  if (type == objectType) {
    return 'Object';
  }
  if (type == stringType) {
    return 'String';
  }
  if (type == booleanType) {
    return 'bool';
  }
  if (type == numberType) {
    return 'num';
  }
  if (type == dataMixinType) {
    return 'DataMixin';
  }
  if (type == dataContextType) {
    return 'DataContext';
  }
  if (type == mapMixinType) {
    return 'MapMixin';
  }
  if (type == iterableType) {
    return 'Iterable';
  }
  if (type is EnumType) {
    return type.name.camelCase.capitalized;
  }
  if (type is DataType) {
    return type.name.camelCase.capitalized;
  }
  if (type is ArrayType) {
    return 'List<${getDartType(type.elementType)}>';
  }
  if (type is StringMapType) {
    return 'Map<String, ${getDartType(type.valueType)}>';
  }
}

abstract class DartEnumValueResolver {
  String call(Object value);
}

extension DartEnumValueResolverContextExt on CodeGenContext {
  DartEnumValueResolver get dartEnumValueResolver => getOneOfType();
}

abstract class DartIdentifierResolver {
  String call(String name);
}

extension DartIdentifierResolverContextExt on CodeGenContext {
  DartIdentifierResolver get dartIdentifierResolver => getOneOfType();
}

abstract class DartDocsResolver {
  String? call(ModelElement element);
}

extension DartDocsResolverContextExt on CodeGenContext {
  DartDocsResolver get dartDocsResolver => getOneOfType();
}

mixin DataModelGeneratorHelpers on CodeGenerator {
  void writeDartDocs(ModelElement element) {
    final docs = context.dartDocsResolver(element);
    if (docs != null) {
      writeDocComment(docs);
    }
  }
}

abstract class ModelElementGenerator extends CodeGenerator {
  void generate(ModelElement element);
}

class EnumGenerator extends ModelElementGenerator
    with DataModelGeneratorHelpers {
  @override
  void generate(ModelElement element) {
    final enumType = element;
    if (enumType is! EnumType) {
      return;
    }

    writeDartDocs(enumType);
    write('enum ');
    writeDartType(enumType);
    writeln(' {');
    for (final value in enumType.values) {
      writeDartDocs(value);
      write(context.dartEnumValueResolver(value.value));
      writeln(',');
    }
    writeln('}');
    writeln();
    write('extension ');
    writeDartType(enumType);
    write('Extension on ');
    writeDartType(enumType);
    writeln(' {');
    writeFunction(
      name: 'toJson',
      returnType: objectType,
      body: () {
        writeln('switch (this) {');
        for (final value in enumType.values) {
          write('case ');
          writeDartType(enumType);
          write('.');
          write(context.dartEnumValueResolver(value.value));
          writeln(':');
          write('return ');
          writeLiteral(value.value);
          writeln(';');
        }
        writeln('}');
      },
    );
    writeln('}');
    writeln();
    writeFunction(
      name: '_parseFromJsonAs${context.dartTypeProvider(enumType)}',
      returnType: NullableType.from(enumType),
      parameters: ParameterList(
        parameters: [
          Parameter(
            name: 'context',
            type: dataContextType,
          ),
        ],
      ),
      body: () {
        writeln('switch (context.value) {');
        for (final value in enumType.values) {
          write('case ');
          writeLiteral(value.value);
          writeln(':');
          write('return ');
          writeDartType(enumType);
          write('.');
          write(context.dartEnumValueResolver(value.value));
          writeln(';');
        }
        writeln('default:');
        write(
          "context._recordException(DataException('Unknown enum value.'));",
        );
        writeln('}');
      },
    );
  }
}

class DataClassGenerator extends ModelElementGenerator
    with DataModelGeneratorHelpers {
  @override
  void generate(ModelElement element) {
    final dataType = element;
    if (dataType is! DataType) {
      return;
    }

    final allProperties = dataType.fixedProperties.sortedByName;
    final ownProperties = dataType.ownFixedProperties.sortedByName;
    final superTypeProperties =
        dataType.superType?.fixedProperties.sortedByName ?? [];
    final dynamicProperties = dataType.ownDynamicProperties;
    final overriddenProperties =
        ownProperties.where((property) => property.isOverridden).toList();
    final overridingProperties =
        ownProperties.where((property) => property.isOverride).toList();
    final propertyTypeParameters = {
      for (final property in overriddenProperties)
        property: TypeParameter(
          context.dartIdentifierResolver(property.name!).capitalized,
        ),
    };
    final hasOnlyDynamicProperties =
        dynamicProperties != null && allProperties.isEmpty;
    final hasAlsoDynamicProperties =
        dynamicProperties != null && allProperties.isNotEmpty;

    Type getPropertyType(DataProperty property) {
      final isOverridden = overriddenProperties.contains(property);
      return isOverridden ? propertyTypeParameters[property]! : property.type;
    }

    Type getApiPropertyType(DataProperty property) {
      if (property.isTypeDiscriminator) {
        return getPropertyType(property);
      }
      return NullableType.from(getPropertyType(property));
    }

    String getPropertyName(DataProperty property) =>
        context.dartIdentifierResolver(property.name!);

    String getPropertyFieldName(DataProperty property) =>
        '_${getPropertyName(property)}';

    writeDartDocs(dataType);

    // Class hierarchy
    startClass(
      abstract: dataType.isAbstract,
      type: dataType,
      typeArguments: {
        for (final property in overriddenProperties)
          propertyTypeParameters[property]!: property.type,
      },
      extends_: _superType(dataType.superType, overridingProperties),
      with_: [
        if (dataType.superType == null) dataMixinType,
        if (dynamicProperties != null)
          ParameterizedType(mapMixinType, [stringType, dynamicProperties.type]),
      ],
    );

    String dynamicPropertiesConstructorParameterName() {
      assert(dynamicProperties != null);
      return allProperties.isEmpty ? 'values' : 'other';
    }

    // Constructor
    writeConstructor(
      type: dataType,
      name: dataType.isAbstract ? '_' : null,
      parameters: ParameterList(
        optionalParameters: [
          for (final property in allProperties)
            if (!property.isTypeDiscriminator ||
                ownProperties.contains(property))
              Parameter(
                name: getPropertyName(property),
                type: getApiPropertyType(property),
                required: getApiPropertyType(property) is! NullableType,
              ),
          if (dynamicProperties != null)
            Parameter(
              name: dynamicPropertiesConstructorParameterName(),
              type: NullableType.from(StringMapType(dynamicProperties.type)),
            ),
        ],
        namedOptionalParameters: !hasOnlyDynamicProperties,
      ),
      initializers: {
        for (final property in ownProperties)
          if (!overridingProperties.contains(property))
            getPropertyFieldName(property): getPropertyName(property),
      },
      super_: dataType.hasSuperType,
      superName: dataType.hasSuperType ? '_' : null,
      superArguments: ArgumentList(
        namedArguments: {
          for (final property in superTypeProperties)
            getPropertyName(property): property.isTypeDiscriminator
                ? _enumValueString(dataType.typeDiscriminatorValue!)
                : getPropertyName(property),
        },
      ),
      body: dynamicProperties == null
          ? null
          : () {
              final dynamicPropertiesParameter =
                  dynamicPropertiesConstructorParameterName();
              writeln('if ($dynamicPropertiesParameter != null) {');
              writeln(
                '_dynamicProperties.addAll($dynamicPropertiesParameter);',
              );
              writeln('}');
            },
    );

    // Properties
    for (final property in ownProperties) {
      if (property.isOverride) {
        continue;
      }
      final apiType = getApiPropertyType(property);
      final propertyName = getPropertyName(property);
      final fieldName = getPropertyFieldName(property);

      writeln();
      writeGetter(
        name: propertyName,
        type: apiType,
        body: () => write(fieldName),
        bodyType: FunctionBodyType.expression,
      );
      writeField(
        name: fieldName,
        type: apiType,
        final_: property.isTypeDiscriminator,
      );
      if (!property.isTypeDiscriminator) {
        writeln();
        writeSetter(
          name: propertyName,
          type: apiType,
          body: () {
            writeln('_checkNotFrozen();');
            write(fieldName);
            writeln(' = value;');
          },
        );
      }
    }

    // Dynamic properties
    if (dynamicProperties != null) {
      final type = dynamicProperties.type;
      final nullableType = NullableType.from(type);
      const fieldName = '_dynamicProperties';

      writeln();
      writeOverrideAnnotation();
      writeGetter(
        name: 'keys',
        type: ParameterizedType(iterableType, [stringType]),
        body: () => write('_dynamicProperties.keys'),
        bodyType: FunctionBodyType.expression,
      );

      writeln();
      writeOverrideAnnotation();
      writeFunction(
        operator: true,
        name: '[]',
        returnType: nullableType,
        parameters: ParameterList(
          parameters: [
            Parameter(
              name: 'key',
              type: NullableType.from(objectType),
            ),
          ],
          trailingComma: false,
        ),
        body: () => write('_dynamicProperties[key]'),
        bodyType: FunctionBodyType.expression,
      );

      writeln();
      writeOverrideAnnotation();
      writeFunction(
        operator: true,
        name: '[]=',
        returnType: voidType,
        parameters: ParameterList(
          parameters: [
            Parameter(
              name: 'key',
              type: stringType,
            ),
            Parameter(
              name: 'value',
              type: type,
            ),
          ],
          trailingComma: false,
        ),
        body: () {
          writeln('_checkNotFrozen();');
          writeln('_dynamicProperties[key] = value;');
        },
      );

      writeln();
      writeOverrideAnnotation();
      writeFunction(
        name: 'remove',
        returnType: nullableType,
        parameters: ParameterList(
          parameters: [
            Parameter(
              name: 'key',
              type: NullableType.from(objectType),
            ),
          ],
          trailingComma: false,
        ),
        body: () {
          writeln('_checkNotFrozen();');
          writeln('_dynamicProperties.remove(key);');
        },
      );

      writeln();
      writeOverrideAnnotation();
      writeFunction(
        name: 'clear',
        returnType: voidType,
        body: () {
          writeln('_checkNotFrozen();');
          writeln('_dynamicProperties.clear();');
        },
      );

      writeln();
      writeField(
        final_: true,
        name: fieldName,
        type: StringMapType(type),
        initializer: '{}',
      );
    }

    // Copy method
    writeln();
    writeOverrideAnnotation();
    if (!dataType.isAbstract) {
      writeFunction(
        name: 'copy',
        returnType: dataType,
        body: () {
          writeDartType(dataType);
          write('(');
          for (final property in allProperties) {
            if (property.isTypeDiscriminator) {
              continue;
            }
            write(getPropertyName(property));
            write(': ');
            writeCopyExpression(
              getApiPropertyType(property),
              getPropertyFieldName(property),
            );
            writeln(', ');
          }
          if (dynamicProperties != null) {
            if (hasAlsoDynamicProperties) {
              write(dynamicPropertiesConstructorParameterName());
              write(': ');
            }
            writeCopyExpression(
              StringMapType(dynamicProperties.type),
              '_dynamicProperties',
            );
            writeln(', ');
          }
          write(')');
        },
        bodyType: FunctionBodyType.expression,
      );
    } else {
      writeFunction(
        name: 'copy',
        returnType: dataType,
      );
    }

    // Freeze method
    final needsToOverrideFreeze = [
      ...allProperties,
      if (dynamicProperties != null) dynamicProperties
    ].any((property) => freezingNeededForType(property.type));

    if (!dataType.isAbstract && needsToOverrideFreeze) {
      writeln();
      writeOverrideAnnotation();
      writeFunction(
        name: 'freeze',
        returnType: voidType,
        body: () {
          for (final property in allProperties) {
            if (!freezingNeededForType(property.type)) {
              continue;
            }

            final fieldName = getPropertyFieldName(property);
            if (freezingCreatesNewValue(property.type)) {
              write(fieldName);
              write(' = ');
            }
            writeFreezeExpression(
              NullableType.from(property.type),
              fieldName,
            );
            writeln(';');
          }

          if (dynamicProperties != null) {
            final createsNewValue =
                freezingCreatesNewValue(dynamicProperties.type);
            writeln('for (final entry in _dynamicProperties.entries) {');
            if (createsNewValue) {
              write('_dynamicProperties[entry.key] = ');
            }
            writeFreezeExpression(dynamicProperties.type, 'entry.value');
            writeln(';');
            writeln('}');
          }

          writeln('super.freeze();');
        },
      );
    }

    // ToJson method
    if (!dataType.isAbstract) {
      writeln();
      writeOverrideAnnotation();
      writeFunction(
        name: 'toJson',
        returnType: StringMapType(NullableType.from(objectType)),
        body: () {
          writeln('{');
          for (final property in allProperties) {
            final fieldName = getPropertyFieldName(property);

            final type = getApiPropertyType(property);
            if (type is NullableType) {
              // Since we are performing a null check we can eliminate the
              // nullable type.
              write('if (');
              write(fieldName);
              write(' != null)');
              writeLiteral(property.name);
              write(':');
              writeToJsonExpression(type.type, '$fieldName!');
              writeln(',');
            } else {
              writeLiteral(property.name);
              write(':');
              writeToJsonExpression(type, fieldName);
              writeln(',');
            }
          }

          if (dynamicProperties != null) {
            writeln('for (final entry in _dynamicProperties.entries)');
            write('entry.key');
            write(':');
            writeToJsonExpression(dynamicProperties.type, 'entry.value');
            writeln(',');
          }
          writeln('}');
        },
        bodyType: FunctionBodyType.expression,
      );
    }

    // FromJson method
    if (!dataType.isAbstract) {
      writeln();
      writeFunction(
        static: true,
        name: 'fromJson',
        returnType: NullableType.from(dataType),
        parameters: ParameterList(
          parameters: [
            Parameter(
              name: 'context',
              type: dataContextType,
            ),
          ],
          trailingComma: false,
        ),
        body: () {
          writeln('final value = context.value;');
          writeln('if (value is! Map<String, Object?>) {');
          writeln(
            'context._recordException('
            "DataException('Expected value of type Map<String, Object?>.'), "
            ');',
          );
          writeln('return null;');
          writeln('}');
          writeln();
          writeln('final map = Map.of(value);');
          write('final result = ');
          writeDartType(dataType);
          writeln('();');

          for (final property in allProperties) {
            if (property.isTypeDiscriminator) {
              write('const typeKey = ');
              writeLiteral(property.name);
              writeln(';');
              writeln('const expectedType = ');
              writeLiteral(
                context.dartEnumValueResolver(
                  dataType.typeDiscriminatorValue!.value,
                ),
              );
              writeln(';');
              writeln('final type = map.remove(typeKey);');
              writeln('if (type != expectedType) {');
              writeln(
                // ignore: missing_whitespace_between_adjacent_strings
                'DataContext.child(parent: context, key: typeKey, value: type)'
                '._recordException('
                // ignore: lines_longer_than_80_chars
                r"DataException('Unexpected $expectedType for type discriminator but got $type',), "
                ');',
              );
              writeln('}');
            } else {
              write('if (map.containsKey(');
              writeLiteral(property.name);
              writeln(')) {');
              write('result.');
              write(getPropertyFieldName(property));
              write(' = _parseDataProperty(context, ');
              writeLiteral(property.name);
              writeln(', ');
              write('map.remove(');
              writeLiteral(property.name);
              write('), (context) => ');
              writeFromJsonExpression(property.type, 'context');
              writeln(',);');
              writeln('}');
            }
          }

          if (dynamicProperties != null) {
            write(
              '_parseDynamicProperties('
              'context, map, result._dynamicProperties, (context) => ',
            );
            writeFromJsonExpression(dynamicProperties.type, 'context');
            writeln(',);');
          } else {
            writeln('if (map.isNotEmpty) {');
            writeln(
              'context._recordException('
              r"DataException('Unexpected properties: ${map.keys}'), "
              ');',
            );
            writeln('}');
          }

          writeln('return result;');
        },
      );
    }
    final typeDiscriminatorProperty = dataType.typeDiscriminatorProperty;
    if (typeDiscriminatorProperty != null) {
      writeln();
      writeFunction(
        static: true,
        name: 'fromJson',
        returnType: NullableType.from(dataType),
        parameters: ParameterList(
          parameters: [
            Parameter(
              name: 'context',
              type: dataContextType,
            ),
          ],
          trailingComma: false,
        ),
        body: () {
          writeln('final value = context.value;');
          writeln('if (value is! Map<String, Object?>) {');
          writeln(
            'context._recordException('
            "DataException('Expected value of type Map<String, Object?>.'), "
            ');',
          );
          writeln('return null;');
          writeln('}');
          writeln();
          write('final type = value[');
          writeLiteral(typeDiscriminatorProperty.name);
          writeln('];');
          writeln('switch (type) {');
          final typeEnum = typeDiscriminatorProperty.type as EnumType;
          for (final enumValue in typeEnum.values) {
            final subType = dataType.subTypes.firstWhere(
              (subType) => subType.typeDiscriminatorValue == enumValue,
            );
            write('case ');
            writeLiteral(enumValue.value);
            writeln(':');
            write('return ');
            writeFromJsonExpression(subType, 'context');
            writeln(';');
          }
          writeln('default:');
          writeln(
            'context._recordException('
            "DataException('Unable to parse value.'), "
            ');',
          );
          write('DataContext.child(parent: context, key: ');
          writeLiteral(typeDiscriminatorProperty.name);
          writeln(
            // ignore: missing_whitespace_between_adjacent_strings
            ', value: type)._recordException('
            "DataException('Unknown value for type discriminator'), "
            ');',
          );

          writeln('}');
        },
      );
    }

    finishClass();
  }

  Type? _superType(
    DataType? superType,
    List<DataProperty> overridingProperties,
  ) {
    if (superType == null) {
      return null;
    }
    if (overridingProperties.isNotEmpty) {
      return ParameterizedType(superType, [
        for (final property in overridingProperties) property.type,
      ]);
    }
    return superType;
  }

  String _enumValueString(EnumValue enumValue) =>
      '${context.dartTypeProvider(enumValue.enumType)}.'
      '${context.dartEnumValueResolver(enumValue.value)}';
}

extension on Iterable<DataProperty> {
  List<DataProperty> get sortedByName =>
      toList()..sort((a, b) => a.name!.compareTo(b.name!));
}

abstract class CopyExpressionGenerator extends CodeGenerator {
  bool canHandleType(Type type);

  bool hasPassthroughExpression(Type type) => false;

  void generate(Type type, String valueExpression);
}

extension WriteCopyExpressionExt on CodeGenerator {
  bool hasPassthroughCopyExpression(Type type) =>
      getCopyExpressionGenerator(type).hasPassthroughExpression(type);

  void writeCopyExpression(Type type, String valueExpression) {
    getCopyExpressionGenerator(type).generate(type, valueExpression);
  }

  CopyExpressionGenerator getCopyExpressionGenerator(Type type) {
    final generator = context
        .getAllOfType<CopyExpressionGenerator>()
        .firstWhereOrNull((generator) => generator.canHandleType(type));

    if (generator == null) {
      throw UnsupportedError(
        'Could not find a CopyExpressionGenerator for type $type',
      );
    }

    return generator;
  }
}

final defaultCopyExpressionGenerators = [
  IdentityCopyExpressionGenerator.forType(stringType),
  IdentityCopyExpressionGenerator.forType(booleanType),
  IdentityCopyExpressionGenerator.forType(numberType),
  IdentityCopyExpressionGenerator.forTypeOf<EnumType>(),
  NullableTypeCopyExpressionGenerator(),
  StringMapCopyExpressionGenerator(),
  ArrayCopyExpressionGenerator(),
  DataCopyExpressionGenerator(),
];

class IdentityCopyExpressionGenerator extends CopyExpressionGenerator {
  IdentityCopyExpressionGenerator(this._canHandleType);

  factory IdentityCopyExpressionGenerator.forType(Type type) =>
      IdentityCopyExpressionGenerator((t) => t == type);

  static IdentityCopyExpressionGenerator forTypeOf<T>() =>
      IdentityCopyExpressionGenerator((t) => t is T);

  final bool Function(Type) _canHandleType;

  @override
  bool canHandleType(Type type) => _canHandleType(type);

  @override
  bool hasPassthroughExpression(Type type) => true;

  @override
  void generate(Type type, String valueExpression) {
    write(valueExpression);
  }
}

class NullableTypeCopyExpressionGenerator extends CopyExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is NullableType;

  @override
  bool hasPassthroughExpression(covariant NullableType type) =>
      hasPassthroughCopyExpression(type.type);

  @override
  void generate(covariant NullableType type, String valueExpression) {
    if (hasPassthroughCopyExpression(type.type)) {
      write(valueExpression);
      return;
    }

    writeln('(){');
    write('final value = ');
    write(valueExpression);
    writeln(';');
    writeln('if (value != null) {');
    write('return ');
    writeCopyExpression(type.type, 'value');
    writeln(';');
    writeln('}');
    writeln('}()');
  }
}

class StringMapCopyExpressionGenerator extends CopyExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is StringMapType;

  @override
  void generate(covariant StringMapType type, String valueExpression) {
    if (hasPassthroughCopyExpression(type.valueType)) {
      write('Map');
      write('<String, ');
      writeDartType(type.valueType);
      write('>');
      write('.of(');
      write(valueExpression);
      write(')');
      return;
    }

    write('<String, ');
    writeDartType(type.valueType);
    write('>');
    writeln('{');
    write('for (final entry in ');
    write(valueExpression);
    writeln('.entries)');
    write('entry.key: ');
    writeCopyExpression(type.valueType, 'entry.value');
    writeln(',');
    writeln('}');
  }
}

class ArrayCopyExpressionGenerator extends CopyExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is ArrayType;

  @override
  void generate(covariant ArrayType type, String valueExpression) {
    if (hasPassthroughCopyExpression(type.elementType)) {
      write('List');
      write('<');
      writeDartType(type.elementType);
      write('>');
      write('.of(');
      write(valueExpression);
      write(')');
      return;
    }

    write('<');
    writeDartType(type.elementType);
    write('>');
    writeln('[');
    write('for (final element in ');
    write(valueExpression);
    writeln(')');
    writeCopyExpression(type.elementType, 'element');
    writeln(',');
    writeln(']');
  }
}

class DataCopyExpressionGenerator extends CopyExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is DataType;

  @override
  void generate(covariant DataType type, String valueExpression) {
    write(valueExpression);
    write('.copy()');
  }
}

abstract class FreezeExpressionGenerator extends CodeGenerator {
  bool canHandleType(Type type);

  bool neededForType(Type type);

  bool createsNewValue(Type type);

  void generate(Type type, String valueExpression);
}

extension FreezeExpressionGeneratorExt on CodeGenerator {
  bool freezingNeededForType(Type type) =>
      getFreezeExpressionGenerator(type).neededForType(type);

  bool freezingCreatesNewValue(Type type) =>
      getFreezeExpressionGenerator(type).createsNewValue(type);

  void writeFreezeExpression(Type type, String valueExpression) {
    getFreezeExpressionGenerator(type).generate(type, valueExpression);
  }

  FreezeExpressionGenerator getFreezeExpressionGenerator(Type type) {
    final generator = context
        .getAllOfType<FreezeExpressionGenerator>()
        .firstWhereOrNull((generator) => generator.canHandleType(type));

    if (generator == null) {
      throw UnsupportedError(
        'Could not find a FreezeExpressionGenerator for type $type',
      );
    }

    return generator;
  }
}

final defaultFreezeExpressionGenerators = [
  IdentityFreezeExpressionGenerator.forType(stringType),
  IdentityFreezeExpressionGenerator.forType(booleanType),
  IdentityFreezeExpressionGenerator.forType(numberType),
  IdentityFreezeExpressionGenerator.forTypeOf<EnumType>(),
  NullableTypeFreezeExpressionGenerator(),
  StringMapFreezeExpressionGenerator(),
  ArrayFreezeExpressionGenerator(),
  DataFreezeExpressionGenerator(),
];

class IdentityFreezeExpressionGenerator extends FreezeExpressionGenerator {
  IdentityFreezeExpressionGenerator(this._canHandleType);

  factory IdentityFreezeExpressionGenerator.forType(Type type) =>
      IdentityFreezeExpressionGenerator((t) => t == type);

  static IdentityFreezeExpressionGenerator forTypeOf<T>() =>
      IdentityFreezeExpressionGenerator((t) => t is T);

  final bool Function(Type) _canHandleType;

  @override
  bool canHandleType(Type type) => _canHandleType(type);

  @override
  bool neededForType(Type type) => false;

  @override
  bool createsNewValue(Type type) => false;

  @override
  void generate(Type type, String valueExpression) {}
}

class NullableTypeFreezeExpressionGenerator extends FreezeExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is NullableType;

  @override
  bool neededForType(covariant NullableType type) =>
      freezingNeededForType(type.type);

  @override
  bool createsNewValue(covariant NullableType type) =>
      freezingCreatesNewValue(type.type);

  @override
  void generate(covariant NullableType type, String valueExpression) {
    writeln('(){');
    write('final value = ');
    write(valueExpression);
    writeln(';');
    writeln('if (value != null) {');
    if (freezingCreatesNewValue(type.type)) {
      write('return ');
    }
    writeFreezeExpression(type.type, 'value');
    writeln(';');
    writeln('}');
    writeln('}()');
  }
}

class StringMapFreezeExpressionGenerator extends FreezeExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is StringMapType;

  @override
  bool neededForType(Type type) => true;

  @override
  bool createsNewValue(Type type) => true;

  @override
  void generate(covariant StringMapType type, String valueExpression) {
    final freezingNeededForValueType = freezingNeededForType(type.valueType);
    final freezingOfValueTypeCreatesNewValue =
        freezingCreatesNewValue(type.valueType);

    if (!freezingNeededForValueType) {
      _writeUnmodifiableMapOf(type, valueExpression);
      return;
    }

    if (!freezingOfValueTypeCreatesNewValue) {
      writeln('(){');
      write('for (final value in ');
      write(valueExpression);
      writeln('.values) {');
      writeFreezeExpression(type.valueType, 'value');
      writeln(';');
      writeln('}');
      write('return ');
      _writeUnmodifiableMapOf(type, valueExpression);
      writeln(';');
      writeln('}()');
      return;
    }

    write('<String, ');
    writeDartType(type.valueType);
    write('>');
    writeln('{');
    write('for (final entry in ');
    write(valueExpression);
    writeln('.entries)');
    write('entry.key: ');
    writeFreezeExpression(type.valueType, 'entry.value');
    writeln(',');
    writeln('}');
  }

  void _writeUnmodifiableMapOf(StringMapType type, String valueExpression) {
    write('Map');
    write('<String, ');
    writeDartType(type.valueType);
    write('>');
    write('.unmodifiable(');
    write(valueExpression);
    write(')');
  }
}

class ArrayFreezeExpressionGenerator extends FreezeExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is ArrayType;

  @override
  bool neededForType(Type type) => true;

  @override
  bool createsNewValue(Type type) => true;

  @override
  void generate(covariant ArrayType type, String valueExpression) {
    final freezingNeededForElementType =
        freezingNeededForType(type.elementType);
    final freezingOfElementTypeCreatesNewValue =
        freezingCreatesNewValue(type.elementType);

    if (!freezingNeededForElementType) {
      _writeUnmodifiableListOf(type, valueExpression);
      return;
    }

    if (!freezingOfElementTypeCreatesNewValue) {
      writeln('(){');
      write('for (final element in ');
      write(valueExpression);
      writeln(') {');
      writeFreezeExpression(type.elementType, 'element');
      writeln(';');
      writeln('}');
      write('return ');
      _writeUnmodifiableListOf(type, valueExpression);
      writeln(';');
      writeln('}()');
      return;
    }

    write('<');
    writeDartType(type.elementType);
    write('>');
    writeln('[');
    write('for (final element in ');
    write(valueExpression);
    writeln(')');
    writeFreezeExpression(type.elementType, 'element');
    writeln(',');
    writeln(']');
  }

  void _writeUnmodifiableListOf(ArrayType type, String valueExpression) {
    write('List');
    write('<');
    writeDartType(type.elementType);
    write('>');
    write('.unmodifiable(');
    write(valueExpression);
    write(')');
  }
}

class DataFreezeExpressionGenerator extends FreezeExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is DataType;

  @override
  bool neededForType(Type type) => true;

  @override
  bool createsNewValue(Type type) => false;

  @override
  void generate(Type type, String valueExpression) {
    write(valueExpression);
    writeln('.freeze()');
  }
}

abstract class ToJsonExpressionGenerator extends CodeGenerator {
  bool canHandleType(Type type);

  bool hasPassthroughExpression(Type type) => false;

  void generate(Type type, String valueExpression);
}

extension ToJsonExpressionExt on CodeGenerator {
  bool hasPassthroughToJsonExpression(Type type) =>
      getToJsonExpressionGenerator(type).hasPassthroughExpression(type);

  void writeToJsonExpression(Type type, String valueExpression) {
    getToJsonExpressionGenerator(type).generate(type, valueExpression);
  }

  ToJsonExpressionGenerator getToJsonExpressionGenerator(Type type) {
    final generator = context
        .getAllOfType<ToJsonExpressionGenerator>()
        .firstWhereOrNull((generator) => generator.canHandleType(type));

    if (generator == null) {
      throw UnsupportedError(
        'Could not find a ToJsonExpressionGenerator for type $type',
      );
    }

    return generator;
  }
}

final defaultToJsonExpressionGenerators = [
  IdentityToJsonExpressionGenerator.forType(stringType),
  IdentityToJsonExpressionGenerator.forType(booleanType),
  IdentityToJsonExpressionGenerator.forType(numberType),
  SimpleToJsonExpressionGenerator.forTypeOf<EnumType>('toJson()'),
  NullableTypeToJsonExpressionGenerator(),
  StringMapToJsonExpressionGenerator(),
  ArrayToJsonExpressionGenerator(),
  SimpleToJsonExpressionGenerator.forTypeOf<DataType>('toJson()'),
];

class IdentityToJsonExpressionGenerator extends ToJsonExpressionGenerator {
  IdentityToJsonExpressionGenerator(this._canHandleType);

  factory IdentityToJsonExpressionGenerator.forType(Type type) =>
      IdentityToJsonExpressionGenerator((t) => t == type);

  static IdentityToJsonExpressionGenerator forTypeOf<T>() =>
      IdentityToJsonExpressionGenerator((t) => t is T);

  final bool Function(Type) _canHandleType;

  @override
  bool canHandleType(Type type) => _canHandleType(type);

  @override
  bool hasPassthroughExpression(Type type) => true;

  @override
  void generate(Type type, String valueExpression) {
    write(valueExpression);
  }
}

class SimpleToJsonExpressionGenerator extends ToJsonExpressionGenerator {
  SimpleToJsonExpressionGenerator(this._canHandleType, this._accessor);

  factory SimpleToJsonExpressionGenerator.forType(Type type, String accessor) =>
      SimpleToJsonExpressionGenerator((t) => t == type, accessor);

  static SimpleToJsonExpressionGenerator forTypeOf<T>(String accessor) =>
      SimpleToJsonExpressionGenerator((t) => t is T, accessor);

  final bool Function(Type) _canHandleType;

  final String _accessor;

  @override
  bool canHandleType(Type type) => _canHandleType(type);

  @override
  void generate(Type type, String valueExpression) {
    write(valueExpression);
    write('.');
    write(_accessor);
  }
}

class NullableTypeToJsonExpressionGenerator extends ToJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is NullableType;

  @override
  bool hasPassthroughExpression(covariant NullableType type) =>
      hasPassthroughToJsonExpression(type.type);

  @override
  void generate(covariant NullableType type, String valueExpression) {
    if (hasPassthroughCopyExpression(type.type)) {
      write(valueExpression);
      return;
    }

    writeln('(){');
    write('final value = ');
    write(valueExpression);
    writeln(';');
    writeln('if (value != null) {');
    write('return ');
    writeToJsonExpression(type.type, 'value');
    writeln(';');
    writeln('}');
    writeln('}()');
  }
}

class StringMapToJsonExpressionGenerator extends ToJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is StringMapType;

  @override
  bool hasPassthroughExpression(covariant StringMapType type) =>
      hasPassthroughToJsonExpression(type.valueType);

  @override
  void generate(covariant StringMapType type, String valueExpression) {
    if (hasPassthroughToJsonExpression(type.valueType)) {
      write(valueExpression);
      return;
    }

    write('<String, ');
    writeDartType(NullableType.from(objectType));
    write('>');
    writeln('{');
    write('for (final entry in ');
    write(valueExpression);
    writeln('.entries)');
    write('entry.key: ');
    writeToJsonExpression(type.valueType, 'entry.value');
    writeln(',');
    writeln('}');
  }
}

class ArrayToJsonExpressionGenerator extends ToJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is ArrayType;

  @override
  bool hasPassthroughExpression(covariant ArrayType type) =>
      hasPassthroughToJsonExpression(type.elementType);

  @override
  void generate(covariant ArrayType type, String valueExpression) {
    if (hasPassthroughCopyExpression(type.elementType)) {
      write(valueExpression);
      return;
    }

    write('<');
    writeDartType(NullableType.from(objectType));
    write('>');
    writeln('[');
    write('for (final element in ');
    write(valueExpression);
    writeln(')');
    writeToJsonExpression(type.elementType, 'element');
    writeln(',');
    writeln(']');
  }
}

abstract class FromJsonExpressionGenerator extends CodeGenerator {
  bool canHandleType(Type type);

  void generate(Type type, String contextExpression);
}

extension FromJsonExpressionExt on CodeGenerator {
  void writeFromJsonExpression(Type type, String contextExpression) {
    getFromJsonExpressionGenerator(type).generate(type, contextExpression);
  }

  FromJsonExpressionGenerator getFromJsonExpressionGenerator(Type type) {
    final generator = context
        .getAllOfType<FromJsonExpressionGenerator>()
        .firstWhereOrNull((generator) => generator.canHandleType(type));

    if (generator == null) {
      throw UnsupportedError(
        'Could not find a FromJsonExpressionGenerator for type $type',
      );
    }

    return generator;
  }
}

final defaultFromJsonExpressionGenerators = [
  AsTypeFromJsonExpressionGenerator(stringType),
  AsTypeFromJsonExpressionGenerator(booleanType),
  AsTypeFromJsonExpressionGenerator(numberType),
  EnumFromJsonExpressionGenerator(),
  NullableTypeFromJsonExpressionGenerator(),
  StringMapFromJsonExpressionGenerator(),
  ArrayFromJsonExpressionGenerator(),
  OnTypeFromJsonExpressionGenerator.forTypeOf<DataType>()
];

class OnTypeFromJsonExpressionGenerator extends FromJsonExpressionGenerator {
  OnTypeFromJsonExpressionGenerator(this._canHandleType);

  factory OnTypeFromJsonExpressionGenerator.forType(Type type) =>
      OnTypeFromJsonExpressionGenerator((t) => t == type);

  static OnTypeFromJsonExpressionGenerator forTypeOf<T>() =>
      OnTypeFromJsonExpressionGenerator((t) => t is T);

  final bool Function(Type) _canHandleType;

  @override
  bool canHandleType(Type type) => _canHandleType(type);

  @override
  void generate(Type type, String contextExpression) {
    writeDartType(type);
    write('.fromJson(');
    write(contextExpression);
    write(')');
  }
}

class AsTypeFromJsonExpressionGenerator extends FromJsonExpressionGenerator {
  AsTypeFromJsonExpressionGenerator(this.type);

  final Type type;

  @override
  bool canHandleType(Type type) => type == this.type;

  @override
  void generate(Type type, String contextExpression) {
    write('_parseAsType<');
    writeDartType(type);
    write('>(');
    write(contextExpression);
    write(')');
  }
}

class EnumFromJsonExpressionGenerator extends FromJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is EnumType;

  @override
  void generate(Type type, String contextExpression) {
    write('_parseFromJsonAs');
    writeDartType(type);
    write('(');
    write(contextExpression);
    write(')');
  }
}

class NullableTypeFromJsonExpressionGenerator
    extends FromJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is NullableType;

  @override
  void generate(covariant NullableType type, String contextExpression) {
    write(contextExpression);
    write('.value');
    write(' == null ? null : ');
    writeFromJsonExpression(type.type, contextExpression);
  }
}

class StringMapFromJsonExpressionGenerator extends FromJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is StringMapType;

  @override
  void generate(covariant StringMapType type, String contextExpression) {
    write('_parseStringMap<');
    writeDartType(type.valueType);
    write('>(');
    write(contextExpression);
    write(', (context) => ');
    writeFromJsonExpression(type.valueType, 'context');
    write(',)');
  }
}

class ArrayFromJsonExpressionGenerator extends FromJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is ArrayType;

  @override
  void generate(covariant ArrayType type, String contextExpression) {
    write('_parseArray<');
    writeDartType(type.elementType);
    write('>(');
    write(contextExpression);
    write(', (context) => ');
    writeFromJsonExpression(type.elementType, 'context');
    write(',)');
  }
}
