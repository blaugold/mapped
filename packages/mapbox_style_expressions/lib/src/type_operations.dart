import 'package:expressions/expressions.dart';

import 'conversion.dart';
import 'delegate_builder.dart';
import 'exception.dart';
import 'types.dart';
import 'utils.dart';

void typeOperations(StyleExpressionDelegateBuilder builder) => builder
  ..typeAssertion<bool>('boolean', booleanType)
  ..typeAssertion<double>('number', numberType)
  ..typeAssertion<String>('string', stringType)
  ..mapOperation(
    'to-string',
    nullableValueType,
    stringType,
    convertValueToString,
  )
  ..mapOperation(
    'typeof',
    nullableValueType,
    stringType,
    (value) {
      if (value == null) {
        return 'null';
      }
      if (value is bool) {
        return 'boolean';
      }
      if (value is double) {
        return 'number';
      }
      if (value is String) {
        return 'string';
      }

      // TODO: other types

      unreachable();
    },
  );

extension _DelegateBuilder<C> on DelegateBuilder<C> {
  void typeAssertion<T>(String operationName, ExpressionType type) {
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
          CompiledExpression<C, T>((_) {
            for (final arg in arguments) {
              try {
                final value = arg(_);
                if (value is T) {
                  return value;
                }
              } on ExpressionFailedException {
                // ignore: empty_catches
              }
            }

            throw ExpressionFailedException(
              '$operationName type assertion failed.',
            );
          }),
        );
      },
    );
  }
}
