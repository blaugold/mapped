// ignore_for_file: avoid_print, overridden_fields

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';

abstract class SpecElement {
  SpecElement? get parent => null;

  late final StyleSpec spec = parent!.spec;

  late final List<SpecElement> elementPath =
      elementPathReversed.toList().reversed.toList();

  late final List<SpecElement> elementPathReversed = [
    this,
    for (var parent = this.parent; parent != null; parent = parent.parent)
      parent
  ];

  final List<SpecElement> children = [];

  String? get name => null;

  String? get doc => null;

  String? get group => null;

  late final String? pathString =
      elementPath.map((element) => element.name ?? '<anonym>').join('.');
}

class AnySpec extends SpecElement {
  AnySpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => '*';
}

class UnionSpec extends SpecElement {
  UnionSpec({required this.parent, required this.name});

  @override
  final SpecElement parent;

  @override
  final String name;

  late final List<ObjectSpec> types;
}

class ColorSpec extends SpecElement {
  ColorSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'color';
}

class FormattedSpec extends SpecElement {
  FormattedSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'formatted';
}

class ResolvedImageSpec extends SpecElement {
  ResolvedImageSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'resolvedImage';
}

class StringSpec extends SpecElement {
  StringSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'string';
}

class BooleanSpec extends SpecElement {
  BooleanSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'boolean';
}

class NumberSpec extends SpecElement {
  NumberSpec(this.parent);

  @override
  final SpecElement parent;

  @override
  String? get name => 'number';
}

class ArraySpec extends SpecElement {
  ArraySpec({required this.parent});

  @override
  final SpecElement parent;

  late final SpecElement values;
}

class EnumSpec extends SpecElement {
  EnumSpec({required this.parent, required this.name});

  @override
  final SpecElement parent;

  @override
  final String? name;

  @override
  late final List<EnumValue> children = super.children.cast();
}

class EnumValue extends SpecElement {
  EnumValue({required this.parent, required this.value, this.doc, this.group});

  @override
  final EnumSpec parent;

  final Object value;

  @override
  String? get name {
    final value = this.value;
    return value is String ? value : null;
  }

  @override
  final String? doc;

  @override
  final String? group;
}

class ValueSpec extends SpecElement {
  ValueSpec({
    required this.parent,
    this.name,
    this.doc,
    this.defaultValue,
    this.example,
    this.units,
    this.period,
    this.length,
    this.minimum,
    this.maximum,
  });

  @override
  final SpecElement parent;

  @override
  final String? name;

  late final SpecElement type;

  @override
  final String? doc;

  final Object? defaultValue;

  final Object? example;

  final String? units;

  final num? period;

  final int? length;

  final Object? minimum;

  final Object? maximum;
}

class ObjectSpec extends SpecElement {
  ObjectSpec({
    required this.parent,
    required this.name,
  });

  @override
  final SpecElement parent;

  @override
  final String name;

  @override
  late final List<PropertySpec> children = super.children.cast();

  late final PropertySpec? additionalProperties =
      children.where((property) => property.isAdditionalProperty).firstOrNull;
}

class PropertySpec extends SpecElement {
  PropertySpec({
    required this.parent,
    required this.name,
    required this.required,
    required this.isTransitionable,
    this.propertyType,
  });

  @override
  final ObjectSpec parent;

  @override
  final String name;

  final bool required;

  bool get isAdditionalProperty => name == '*';

  late final ValueSpec type = children.whereType<ValueSpec>().single;

  final bool isTransitionable;

  bool get isExpression => expression != null;

  late final ExpressionSpec? expression =
      children.whereType<ExpressionSpec>().singleOrNull;

  final PropertyType? propertyType;

  late final List<Requirement>? requires =
      children.whereType<Requirement>().toList();
}

class ExpressionSpec extends SpecElement {
  ExpressionSpec({
    required this.parent,
    required this.interpolated,
    required this.featureParameters,
    required this.parameters,
  });

  @override
  final PropertySpec parent;

  final bool interpolated;

  final bool featureParameters;

  final List<EnumValue> parameters;
}

class PropertyType extends SpecElement {
  PropertyType({
    required this.parent,
    required this.name,
    required this.doc,
  });

  @override
  final SpecElement parent;

  @override
  final String name;

  @override
  final String doc;
}

abstract class Requirement extends SpecElement {
  Requirement(this.parent);

  @override
  final PropertySpec parent;
}

class PropertyRequirement extends Requirement {
  PropertyRequirement({
    required PropertySpec parent,
    required String property,
    this.allowedValues,
  })  : _property = property,
        super(parent);

  final String _property;

  PropertySpec get property => parent.parent.children.singleWhere(
        (element) => element.name == _property,
      );

  final List<Object?>? allowedValues;
}

class DisabledByProperty extends Requirement {
  DisabledByProperty({
    required PropertySpec parent,
    required String property,
  })  : _property = property,
        super(parent);

  final String _property;

  PropertySpec get property => parent.parent.children.singleWhere(
        (element) => element.name == _property,
      );
}

class SourceRequirement extends Requirement {
  SourceRequirement({
    required PropertySpec parent,
    required String source,
    Map<String, Object?>? sourceProperties,
  })  : _source = source,
        _sourceProperties = sourceProperties,
        super(parent);

  // ignore: unused_field
  final String _source;
  // ignore: unused_field
  final Map<String, Object?>? _sourceProperties;

  ObjectSpec get source => throw UnimplementedError();

  Map<PropertySpec, Object?>? get sourceProperties =>
      throw UnimplementedError();
}

class StyleSpec extends SpecElement {
  StyleSpec({
    required this.name,
    required this.version,
  });

  @override
  StyleSpec get spec => this;

  @override
  final String name;

  final int version;
}

class ParseContext {
  ParseContext({
    required this.specJson,
    this.parent,
    this.name,
    this.debug = false,
  });

  final Map<String, Object?> specJson;
  final SpecElement? parent;
  final String? name;
  final bool debug;

  StyleSpec? get spec => parent?.spec;

  ParseContext child(SpecElement parent, [String? name]) => ParseContext(
        specJson: specJson,
        parent: parent,
        name: name,
        debug: debug,
      );

  T parse<T extends SpecElement>(
    String elementDescription,
    T Function(SpecElement? parent, String? name) fn,
  ) {
    log('Parsing $elementDescription');
    final child = fn(parent, name);
    parent?.children.add(child);
    return child;
  }

  void log(String message) {
    if (!debug) {
      return;
    }

    final path = [
      if (parent != null) ...parent!.elementPath.map((e) => e.name),
      name,
    ].map((name) => name ?? '<anonym>');

    print('${path.join('.')}: $message');
  }

  SpecElement resolveElement(Object json) {
    log('Resolving element');

    if (json is String) {
      return resolveNamedElement(json);
    }

    if (json is List<Object?>) {
      return parseUnionSpec(this, json);
    }

    if (json is Map<String, Object?>) {
      if (json['type'] is String) {
        return parseValueSpec(this, json);
      }
      return parseObjectSpec(this, json);
    }

    throw UnsupportedError('Unable to resolve type $json');
  }

  SpecElement resolveNamedElement(String name) {
    final element =
        spec?.children.firstWhereOrNull((element) => element.name == name);

    if (element != null) {
      return element;
    }

    return child(spec!, name).resolveElement(specJson[name]!);
  }

  PropertyType resolvePropertyType(String name) {
    final element = spec?.children
        .whereType<PropertyType>()
        .firstWhereOrNull((element) => element.name == name);

    if (element != null) {
      return element;
    }

    final json = specJson['property-type']! as Map<String, Object?>;

    return parsePropertyType(
      child(spec!, name),
      json[name]! as Map<String, Object?>,
    );
  }
}

SpecElement parseUnionSpec(ParseContext context, List<Object?> json) =>
    context.parse('union', (parent, name) {
      final unionSpec = UnionSpec(parent: parent!, name: name!);

      unionSpec.types = json
          .cast<String>()
          .map(context.child(unionSpec).resolveElement)
          .toList()
          .cast();

      return unionSpec;
    });

EnumSpec parseEnumSpec(ParseContext context, Object json) =>
    context.parse('enum', (parent, name) {
      final enumSpec = EnumSpec(parent: parent!, name: name);

      if (json is List<Object?>) {
        for (final value in json) {
          context.child(enumSpec).parse(
                'enum value (anonym)',
                (parent, _) => EnumValue(
                  parent: parent! as EnumSpec,
                  value: value!,
                ),
              );
        }
      } else if (json is Map<String, Object?>) {
        for (final entry in json.entries) {
          parseEnumValue(
            context.child(enumSpec, entry.key),
            entry.value! as Map<String, Object?>,
          );
        }
      } else {
        throw ArgumentError('Invalid enum spec: $json');
      }

      return enumSpec;
    });

EnumValue parseEnumValue(ParseContext context, Map<String, Object?> json) =>
    context.parse(
      'enum value',
      (parent, name) => EnumValue(
        parent: parent! as EnumSpec,
        value: name!,
        doc: json['doc'] as String?,
        group: json['group'] as String?,
      ),
    );

ArraySpec parseArraySpec(ParseContext context, Map<String, Object?> json) =>
    context.parse('array', (parent, name) {
      final arraySpec = ArraySpec(parent: parent!);

      final value = json['value']!;
      arraySpec.values = value == 'enum'
          ? parseEnumSpec(context.child(arraySpec), json['values']!)
          : context.child(arraySpec).resolveElement(value);

      return arraySpec;
    });

ValueSpec parseValueSpec(ParseContext context, Map<String, Object?> json) =>
    context.parse('value', (parent, name) {
      final valueSpec = ValueSpec(
        parent: parent!,
        name: name,
        doc: json['doc'] as String?,
        defaultValue: json['default'],
        example: json['example'],
        units: json['units'] as String?,
        period: json['period'] as num?,
        length: json['length'] as int?,
        minimum: json['minimum'],
        maximum: json['maximum'],
      );

      final type = json['type']!;
      switch (type) {
        case 'enum':
          valueSpec.type =
              parseEnumSpec(context.child(valueSpec), json['values']!);
          break;
        case 'array':
          valueSpec.type = parseArraySpec(context.child(valueSpec), json);
          break;
        default:
          valueSpec.type = context.child(valueSpec).resolveElement(type);
      }

      return valueSpec;
    });

ObjectSpec parseObjectSpec(ParseContext context, Map<String, Object?> json) =>
    context.parse('object', (parent, name) {
      final objectSpec = ObjectSpec(parent: parent!, name: name!);

      for (final entry in json.entries) {
        parsePropertySpec(
          context.child(objectSpec, entry.key),
          entry.value! as Map<String, Object?>,
        );
      }

      return objectSpec;
    });

PropertySpec parsePropertySpec(
  ParseContext context,
  Map<String, Object?> json,
) =>
    context.parse(
      'property',
      (parent, name) {
        final propertyType = json['property-type'] as String?;

        final propertySpec = PropertySpec(
          parent: parent! as ObjectSpec,
          name: name!,
          required: json['required'] as bool? ?? false,
          isTransitionable: json['transition'] as bool? ?? false,
          propertyType: propertyType != null
              ? context.resolvePropertyType(propertyType)
              : null,
        );

        parseValueSpec(context.child(propertySpec), json);

        final expression = json['expression'];
        if (expression != null) {
          parseExpressionSpec(
            context.child(propertySpec),
            expression as Map<String, Object?>,
          );
        }

        final requires = json['requires'];
        if (requires != null) {
          for (final json in requires as List<Object?>) {
            parseRequirement(context.child(propertySpec), json!);
          }
        }

        return propertySpec;
      },
    );

ExpressionSpec parseExpressionSpec(
  ParseContext context,
  Map<String, Object?> json,
) =>
    context.parse('expression', (parent, name) {
      final expressionName = context.resolveElement('expression_name');
      final expressionNames = (expressionName as ValueSpec).type as EnumSpec;
      final parameters = json['parameters']! as List<Object?>;

      return ExpressionSpec(
        parent: parent! as PropertySpec,
        interpolated: json['interpolated']! as bool,
        featureParameters: parameters.contains('feature'),
        parameters: [
          for (final parameter in parameters)
            if (parameter != 'feature')
              expressionNames.children
                  .singleWhere((value) => value.value == parameter)
        ],
      );
    });

PropertyType parsePropertyType(
  ParseContext context,
  Map<String, Object?> json,
) =>
    context.parse(
      'property type',
      (parent, name) => PropertyType(
        parent: parent!,
        name: name!,
        doc: json['doc']! as String,
      ),
    );

Requirement parseRequirement(ParseContext context, Object json) =>
    context.parse('requirement', (parent, name) {
      if (json is String) {
        return PropertyRequirement(
          parent: parent! as PropertySpec,
          property: json,
        );
      }

      if (json is Map<String, Object?>) {
        if (json.containsKey('source')) {
          return SourceRequirement(
            parent: parent! as PropertySpec,
            source: json['source']! as String,
            sourceProperties: json['has'] as Map<String, Object?>?,
          );
        }

        final entry = json.entries.single;
        final key = entry.key;
        final value = entry.value;

        if (key == '!') {
          return DisabledByProperty(
            parent: parent! as PropertySpec,
            property: value! as String,
          );
        }

        return PropertyRequirement(
          parent: parent! as PropertySpec,
          property: key,
          allowedValues: value is List<Object?> ? value : [value],
        );
      }

      throw ArgumentError('Invalid requirement: $json');
    });

StyleSpec parseStyleSpec(ParseContext context, Map<String, Object?> json) =>
    context.parse('spec', (parent, name) {
      final spec = StyleSpec(
        name: name!,
        version: json[r'$version']! as int,
      );

      spec.children.addAll([
        AnySpec(spec),
        ColorSpec(spec),
        FormattedSpec(spec),
        ResolvedImageSpec(spec),
        StringSpec(spec),
        BooleanSpec(spec),
        NumberSpec(spec),
      ]);

      parseObjectSpec(
        context.child(spec, r'$root'),
        json[r'$root']! as Map<String, Object?>,
      );

      return spec;
    });

Future<StyleSpec> loadStyleSpec({bool debug = false}) async {
  final file = File('mapbox-style-spec-v8.json');
  final contents = await file.readAsString();
  final json = jsonDecode(contents) as Map<String, Object?>;
  final context = ParseContext(
    specJson: json,
    name: 'spec',
    debug: debug,
  );
  return parseStyleSpec(context, json);
}
