import 'package:expressions/expressions.dart';

import 'context.dart';
import 'decision_operations.dart';
import 'literal_expression.dart';
import 'math_operations.dart';
import 'string_operations.dart';
import 'type_operations.dart';
import 'type_system.dart';

ExpressionCompiler<StyleExpressionContext> createStyleExpressionCompiler() =>
    ExpressionCompiler.fromDelegateBuilder(
      DelegateBuilder([
        literalExpression,
        typeOperations,
        decisionOperations,
        stringOperations,
        mathOperations,
      ]),
      context: [
        styleExpressionRuntimeTypeSystem,
      ],
    );
