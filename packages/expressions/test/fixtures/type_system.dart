import 'package:expressions/expressions.dart';

final valueType = HierarchicalType('value');

final nullableValueType = nullableType(valueType);

final stringType = HierarchicalType('string', superType: valueType);

final booleanType = HierarchicalType('boolean', superType: valueType);

final floatType = HierarchicalType('float', superType: valueType);

final testRuntimeTypeSystem = RuntimeTypeSystem([
  // ignore: prefer_void_to_null
  const DefiniteRuntimeType<Null>(nullType),
  DefiniteRuntimeType<String>(stringType),
  DefiniteRuntimeType<bool>(booleanType),
  DefiniteRuntimeType<double>(floatType),
]);
