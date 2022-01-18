import 'package:collection/collection.dart';
import 'package:expressions/expressions.dart';

import '../utils/expression.dart';

Expression let(String name, Object? value, Object? out) =>
    testOperation('let', [Literal(name), value, out]);

Expression var_(String name) => Operation('var', [Literal(name)]);

void letVarOperationDelegates(DelegateBuilder builder) {
  builder
    ..operationTypeResolver('let', (operation, context) {
      if (operation.arguments.length < 3) {
        return unknownType;
      }

      final outputExpression = operation.arguments[2];
      return context.expressionType(outputExpression);
    })
    ..operationArgumentContextResolver(
      'let',
      (operation, argument, parentContext) {
        if (operation.arguments.indexOf(argument) != 2) {
          return parentContext;
        }

        final arguments = operation.arguments;
        if (arguments.length < 2) {
          return parentContext;
        }

        final nameExpression = arguments[0];
        if (nameExpression is! Literal) {
          return parentContext;
        }

        final name = nameExpression.value;
        if (name is! String) {
          return parentContext;
        }

        final valueExpression = arguments[1];

        return parentContext + VariableDefinition(name, valueExpression);
      },
    )
    ..operationCompiler(
      'let',
      <R>(operation, context) =>
          context.compiledExpression(operation.arguments[2]),
    )
    ..operationTypeResolver('var', (operation, context) {
      if (operation.arguments.isEmpty) {
        return unknownType;
      }

      final variableNameExpression = operation.arguments[0];
      if (variableNameExpression is! Literal) {
        return unknownType;
      }

      final variableName = variableNameExpression.value;
      if (variableName is! String) {
        return unknownType;
      }

      final variableDefinition = context
          .allOfType<VariableDefinition>()
          .firstWhereOrNull((definition) => definition.name == variableName);
      if (variableDefinition == null) {
        return unknownType;
      }

      return context.expressionType(variableDefinition.value);
    })
    ..operationCompiler(
      'var',
      <R>(operation, context) {
        final variableName =
            (operation.arguments[0] as Literal).value! as String;
        final variableDefinition = context
            .allOfType<VariableDefinition>()
            .firstWhere((definition) => definition.name == variableName);
        return context.compiledExpression(variableDefinition.value);
      },
    );
}

class VariableDefinition {
  VariableDefinition(this.name, this.value);

  final String name;
  final Expression value;
}
