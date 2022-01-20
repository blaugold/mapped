import 'package:expressions/expressions.dart';

import 'context.dart';
import 'decision_operations.dart';
import 'literal_expression.dart';
import 'math_operations.dart';
import 'string_operations.dart';
import 'type_operations.dart';
import 'types.dart';

typedef StyleExpressionDelegateBuilder
    = DelegateBuilder<StyleExpressionContext>;

StyleExpressionDelegateBuilder createStyleExpressionDelegateBuilder() =>
    DelegateBuilder([
      literalExpression,
      typeOperations,
      decisionOperations,
      stringOperations,
      mathOperations,
    ]);

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
    binaryReduceOperation(operationName, numberType, compute);
  }
}
