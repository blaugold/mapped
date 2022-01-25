import 'dart:math';

import 'package:expressions/expressions.dart';

import 'type_system.dart';

Expression piExpr() => Operation('pi');

void piOperation<C>(DelegateBuilder<C> builder) =>
    builder.constantOperation('pi', floatType, pi);
