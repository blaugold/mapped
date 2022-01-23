import 'dart:math';

import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';

import 'type_system.dart';

Expression cosExpr(Object? value) => coercingOperation('cos', [value]);

void cosOperation<C>(DelegateBuilder<C> builder) =>
    builder.mapOperation('cos', floatType, floatType, cos);
