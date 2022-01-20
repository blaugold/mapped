import 'package:expressions/expressions.dart';

import 'conversion.dart';
import 'delegate_builder.dart';
import 'types.dart';
import 'utils.dart';

void stringOperations(StyleExpressionDelegateBuilder builder) => builder
  ..concatOperation()
  ..mapOperation<String, String>(
    'downcase',
    stringType,
    stringType,
    (value) => value.toLowerCase(),
  )
  // TODO: is-supported-script: https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/#is-supported-script
  // TODO: resolved-locale: https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/#resolved-locale
  ..mapOperation<String, String>(
    'upcase',
    stringType,
    stringType,
    (value) => value.toUpperCase(),
  );

extension _ConcatOperation<C> on DelegateBuilder<C> {
  void concatOperation() {
    const name = 'concat';
    final argumentsType = nullableValueType;
    const argumentsCount = Range(2);
    final type = stringType;

    operationArgumentChecker(
      name,
      (_) => [
        OperationArgumentChecker(
          checkExpressionType(argumentsType),
          repeats: argumentsCount,
        )
      ],
      argumentsCount,
    );
    staticOperationTypeResolver(name, type);

    // ignore: avoid_shadowing_type_parameters
    CompiledExpression<C, String> compile<C>(
      List<CompiledExpression<C, Object?>> arguments,
    ) =>
        CompiledExpression<C, String>((_) {
          final stringBuffer = StringBuffer();
          for (final arg in arguments) {
            stringBuffer.write(convertValueToString(arg(_)));
          }
          return stringBuffer.toString();
        });

    Iterable<CompiledExpression<C, Object?>>
        preConcatConstantArgumentsOptimization(
      Iterable<CompiledExpression<C, Object?>> arguments,
    ) sync* {
      final argumentGroups = arguments
          .groupWhile((argument) => argument is ConstantCompiledExpression);

      for (final group in argumentGroups) {
        if (group.length == 1) {
          yield group.single;
        } else {
          final constantArguments = group
              .cast<ConstantCompiledExpression<C, Object?>>()
              .map((argument) => argument.withNullableContext())
              .toList();

          yield ConstantCompiledExpression<C, String>(
            compile(constantArguments)(null),
          );
        }
      }
    }

    operationCompiler(
      name,
      <R>(operation, context) {
        final arguments = operation.arguments
            .map(context.compiledExpression<C, Object?>)
            .toList();

        // We optimize by concatenating continuous groups of constant arguments
        // at compile time.
        final optimizedArguments =
            preConcatConstantArgumentsOptimization(arguments).toList();

        if (optimizedArguments.length == 1) {
          // All arguments are constants and have been concatenated into a
          // single string.
          return assertRequiredType(optimizedArguments.single);
        }

        return assertRequiredType(compile(optimizedArguments));
      },
    );
  }
}
