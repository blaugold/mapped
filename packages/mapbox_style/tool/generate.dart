import 'package:collection/collection.dart';

import 'code_gen.dart';
import 'data_model.dart';
import 'data_model_code_gen.dart';
import 'spec_to_data_model.dart';
import 'style_spec.dart';
import 'type.dart';
import 'utils.dart';

Future<void> main() async {
  await generateDataModelDartCode(
    modelFilePath: 'lib/mapbox_style.dart',
    ignoredLints: [
      'lines_longer_than_80_chars',
      'unnecessary_getters_setters',
      'prefer_expression_function_bodies',
      'require_trailing_commas',
      'unnecessary_cast',
      'avoid_single_cascade_in_expression_statements',
      'unnecessary_lambdas',
      'unused_element',
    ],
    model: styleSpecToDataModel(await loadStyleSpec()),
    context: CodeGenContext([
      DartTypeResolverProvider([
        defaultDartTypeResolver,
        dataModelTypeResolver,
        styleDartTypeResolver,
      ]),
      _DartEnumValueResolver(),
      _DartIdentifierResolver(),
      _DartDocsResolver(),
      EnumGenerator(),
      DataClassGenerator(),
      ...defaultCopyExpressionGenerators,
      IdentityCopyExpressionGenerator.forType(colorType),
      IdentityCopyExpressionGenerator.forType(promoteIdType),
      IdentityCopyExpressionGenerator.forTypeOf<ExpressionType>(),
      _JsonCopyExpressionGenerator(),
      ...defaultFreezeExpressionGenerators,
      IdentityFreezeExpressionGenerator.forType(colorType),
      IdentityFreezeExpressionGenerator.forType(promoteIdType),
      IdentityFreezeExpressionGenerator.forTypeOf<ExpressionType>(),
      _JsonFreezeExpressionGenerator(),
      ...defaultToJsonExpressionGenerators,
      SimpleToJsonExpressionGenerator.forType(colorType, 'toString()'),
      SimpleToJsonExpressionGenerator.forType(promoteIdType, 'toJson()'),
      SimpleToJsonExpressionGenerator.forTypeOf<ExpressionType>('value'),
      IdentityToJsonExpressionGenerator.forType(objectType),
      ...defaultFromJsonExpressionGenerators,
      OnTypeFromJsonExpressionGenerator.forType(colorType),
      OnTypeFromJsonExpressionGenerator.forType(promoteIdType),
      _ExpressionFromJsonExpressionGenerator(),
      AsTypeFromJsonExpressionGenerator(objectType)
    ]),
  );
}

class _DartEnumValueResolver extends DartEnumValueResolver {
  @override
  String call(Object value) {
    if (value is String) {
      return value.camelCase;
    }
    if (value is int) {
      assert(value == 8);
      return 'eight';
    }
    throw UnimplementedError();
  }
}

class _DartIdentifierResolver extends DartIdentifierResolver {
  @override
  String call(String name) => name.camelCase;
}

class _DartDocsResolver implements DartDocsResolver {
  @override
  String? call(ModelElement element) =>
      element.annotations.whereType<Docs>().firstOrNull?.docs;
}

String? styleDartTypeResolver(Type type, DartTypeProvider getDartType) {
  if (type == colorType) {
    return 'Color';
  }
  if (type == formattedType) {
    return 'Formatted';
  }
  if (type == resolvedImageType) {
    return 'ResolvedImage';
  }
  if (type == promoteIdType) {
    return 'PromoteId';
  }
  if (type is ExpressionType) {
    return 'Expression<${getDartType(type.outputType)}>';
  }
}

class _JsonCopyExpressionGenerator extends CopyExpressionGenerator {
  @override
  bool canHandleType(Type type) => type == objectType;

  @override
  void generate(Type type, String valueExpression) {
    write('_copyJson(');
    write(valueExpression);
    writeln(', immutable: false)');
  }
}

class _JsonFreezeExpressionGenerator extends FreezeExpressionGenerator {
  @override
  bool canHandleType(Type type) => type == objectType;

  @override
  bool neededForType(Type type) => true;

  @override
  bool createsNewValue(Type type) => true;

  @override
  void generate(Type type, String valueExpression) {
    write('_copyJson(');
    write(valueExpression);
    writeln(', immutable: true)');
  }
}

class _ExpressionFromJsonExpressionGenerator
    extends FromJsonExpressionGenerator {
  @override
  bool canHandleType(Type type) => type is ExpressionType;

  @override
  void generate(Type type, String contextExpression) {
    write('Expression.fromJson');
    write('(');
    write(contextExpression);
    write(')');
  }
}
