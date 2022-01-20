import 'package:expressions/expressions.dart';

final valueType = HierarchicalType('value');

final nullableValueType = nullableType(valueType);

final stringType = HierarchicalType('string', superType: valueType);

final booleanType = HierarchicalType('boolean', superType: valueType);

final numberType = HierarchicalType('number', superType: valueType);

final colorType = HierarchicalType('color', superType: valueType);
