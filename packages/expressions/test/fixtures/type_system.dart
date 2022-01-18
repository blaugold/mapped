import 'package:expressions/expressions.dart';

final valueType = HierarchicalType('value');

final stringType = HierarchicalType('string', superType: valueType);

final floatType = HierarchicalType('float', superType: valueType);
