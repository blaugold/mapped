import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';

import 'type_system.dart';

Expression add(Object? a, Object? b) => coercingOperation('+', [a, b]);

void addOperation<C>(DelegateBuilder<C> builder) =>
    builder.binaryReduceOperation<double, double>(
      '+',
      floatType,
      floatType,
      (a, b) => a + b,
    );
