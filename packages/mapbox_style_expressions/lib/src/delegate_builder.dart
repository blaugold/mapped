import 'package:expressions/expressions.dart';

import 'context.dart';
import 'type_system.dart';

typedef StyleExpressionDelegateBuilder
    = DelegateBuilder<StyleExpressionContext>;

extension StyleExpressionDelegateBuilderExt on StyleExpressionDelegateBuilder {
  void mathConstantOperation(String operationName, double value) {
    constantOperation(operationName, numberType, value);
  }

  void unaryMathOperation(
    String operationName,
    double Function(double value) compute,
  ) {
    mapOperation(operationName, numberType, numberType, compute);
  }

  void binaryMathOperation(
    String operationName,
    double Function(double a, double b) compute,
  ) {
    binaryReduceOperation(operationName, numberType, numberType, compute);
  }
}
