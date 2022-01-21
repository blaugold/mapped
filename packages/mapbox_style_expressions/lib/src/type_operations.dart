import 'package:expressions/expressions.dart';

import 'conversion.dart';
import 'delegate_builder.dart';
import 'exception.dart';
import 'type_system.dart';

void typeOperations(StyleExpressionDelegateBuilder builder) => builder
  ..typeAssertion('boolean', booleanType)
  ..typeAssertion('number', numberType)
  ..typeAssertion('string', stringType)
  ..typeAssertion('object', objectType)
  ..mapOperation(
    'to-boolean',
    nullableValueType,
    booleanType,
    convertValueToBoolean,
  )
  ..conversionWithFallbacks('to-number', numberType, convertValueToNumber)
  ..mapOperation(
    'to-string',
    nullableValueType,
    stringType,
    convertValueToString,
  )
  ..mapOperationWithContext(
    'typeof',
    nullableValueType,
    stringType,
    (value, context) =>
        context.runtimeTypeSystem.typeOfRuntimeValue(value).toString(),
  );

extension _DelegateBuilder<C> on DelegateBuilder<C> {
  void typeAssertion(String operationName, ExpressionType type) {
    const argumentsCount = Range(1);

    operationArgumentChecker(
      operationName,
      (operation) => [
        OperationArgumentChecker(
          checkExpressionType(type),
          repeats: argumentsCount,
        ),
      ],
      argumentsCount,
    );
    staticOperationTypeResolver(operationName, booleanType);
    operationCompiler(
      operationName,
      <R>(operation, context) {
        final arguments = operation.arguments
            .map(context.compiledExpression<C, Object?>)
            .toList(growable: false);

        return assertRequiredType(
          context.runtimeTypeSystem.runtimeTypeOfType(
            type,
            <T>() => CompiledExpression<C, T>((_) {
              for (final arg in arguments) {
                final value = arg(_);
                if (value is T) {
                  return value;
                }
              }

              throw ExpressionException('$type type assertion failed.');
            }),
          ),
        );
      },
    );
  }

  void conversionWithFallbacks<T>(
    String operationName,
    ExpressionType type,
    T? Function(Object? value) convert,
  ) {
    final argumentsType = nullableValueType;
    const argumentsCount = Range(1);

    operationArgumentChecker(
      operationName,
      (operation) => [
        OperationArgumentChecker(
          checkExpressionType(argumentsType),
          repeats: argumentsCount,
        ),
      ],
      argumentsCount,
    );
    staticOperationTypeResolver(operationName, type);
    operationCompiler(
      operationName,
      <R>(operation, context) {
        final arguments = operation.arguments
            .map(context.compiledExpression<C, Object?>)
            .toList(growable: false);

        return assertRequiredType(
          CompiledExpression<C, T>((_) {
            for (final arg in arguments) {
              final value = convert(arg(_));
              if (value != null) {
                return value;
              }
            }

            throw ExpressionException('$type type conversion failed.');
          }),
        );
      },
    );
  }
}
