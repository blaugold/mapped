import 'package:expressions/expressions.dart';

import '../utils/expression.dart';
import 'type_system.dart';

Expression add(Object? a, Object? b) => coercingOperation('+', [a, b]);

void addOperationDelegates(DelegateBuilder builder) => builder
    .binaryReduceOperation<double, double>('+', floatType, (a, b) => a + b);
