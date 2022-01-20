import 'package:collection/collection.dart';
import 'package:expressions/expressions.dart';

import '../utils/expression.dart';
import 'type_system.dart';

Expression let(String name, Object? value, Object? out) =>
    coercingOperation('let', [Literal(name), value, out]);

Expression var_(String name) => Operation('var', [Literal(name)]);

final _variableNameChecker = regexLiteralStringChecker(
  RegExp(r'^[a-zA-Z_][a-zA-Z0-9_]+$'),
  valueDescription: 'variable name',
  stringType: stringType,
);

void letVarOperationDelegates(DelegateBuilder builder) => builder
  ..staticOperationArgumentTypeChecker('let', [
    _variableNameChecker,
    checkExpressionType(anyType),
    checkExpressionType(anyType),
  ])
  ..operationTypeResolver(
    'let',
    (operation, context) => operation.argumentType(2, context) ?? unknownType,
  )
  ..operationArgumentContextResolver(
    'let',
    (operation, argument, parentContext) {
      if (operation.arguments.indexOf(argument) != 2) {
        // Only the last argument has the defined variable in its context.
        return parentContext;
      }

      final name = operation.letVariableName;
      final value = operation.letVariableValue;
      if (name == null || value == null) {
        return parentContext;
      }

      return parentContext + _VariableDefinition(name, value);
    },
  )
  ..operationCompiler(
    'let',
    <R>(operation, context) =>
        context.compiledExpression<Object?, R>(operation.arguments[2]),
  )
  ..staticOperationArgumentTypeChecker('var', [
    _variableNameChecker,
  ])
  ..operationTypeResolver('var', (operation, context) {
    final value = operation.variableValue(context);
    return value == null ? unknownType : context.expressionType(value);
  })
  ..operationCompiler(
    'var',
    <R>(operation, context) => context
        .compiledExpression<Object?, R>(operation.variableValue(context)!),
  );

class _VariableDefinition {
  _VariableDefinition(this.name, this.value);

  final String name;
  final Expression value;
}

extension on Operation {
  String? get letVariableName => literalArgumentValue<String>(0);
  Expression? get letVariableValue => argument(1);

  String? get varVariableName => literalArgumentValue<String>(0);

  Expression? variableValue(AnalysisContext context) {
    final variableName = varVariableName;
    if (variableName == null) {
      return null;
    }

    return context
        .allOfType<_VariableDefinition>()
        .firstWhereOrNull((definition) => definition.name == variableName)
        ?.value;
  }
}
