import 'package:collection/collection.dart';

import 'analysis_context.dart';
import 'compilation.dart';
import 'delegate_builder.dart';
import 'expression.dart';

CompiledExpression<C, R> optimizeReduceOperationToConstant<C, T, R extends T>(
  Operation operation,
  AnalysisContext context,
  CombineOperationCompilerFn<T, R> compile,
) {
  final arguments =
      operation.arguments.map(context.compiledExpression<C, T>).toList();

  final constantArguments =
      arguments.whereType<ConstantCompiledExpression<C, T>>().toList();

  // We need at least two const arguments to reduce to a new const argument, to
  // be able to optimize the operation.
  if (constantArguments.length < 2) {
    return compile(arguments, context);
  }

  // Compute a new constant expression by reducing the constant arguments.
  final constantsReducer = compile(
    constantArguments.map((it) => it.withNullableContext()).toList(),
    context,
  );
  final reducedConstants =
      ConstantCompiledExpression<C, R>(constantsReducer(null));

  final dynamicArguments = arguments.whereNot(constantArguments.contains);
  if (dynamicArguments.isEmpty) {
    // All arguments where constants and this operation has been reduced to a
    // constant.
    return reducedConstants;
  }

  return compile([...dynamicArguments, reducedConstants], context);
}

CompiledExpression<C, R> optimizeMapOperationToConstant<C, T, R>(
  Operation operation,
  AnalysisContext context,
  MapOperationCompilerFn<T, R> compile,
) {
  final arguments = context.compiledExpression<C, T>(operation.arguments.first);

  if (arguments is! ConstantCompiledExpression<C, T>) {
    return compile(arguments, context);
  }

  final constantMapper = compile(
    arguments.withNullableContext(),
    context,
  );
  return ConstantCompiledExpression(constantMapper(null));
}

CompiledExpression<C, R> optimizeConcatOperationToConstant<C, T, R extends T>(
  Operation operation,
  AnalysisContext context,
  CombineOperationCompilerFn<T, R> compile,
) {
  final arguments =
      operation.arguments.map(context.compiledExpression<C, T>).toList();

  // We optimize by concatenating continuous groups of constant arguments
  // at compile time.
  final concatenatedArguments =
      _concatContinuousConstantArguments(arguments, compile, context).toList();

  if (concatenatedArguments.length == 1) {
    // All arguments are constants and have been concatenated into a
    // single value.
    return assertRequiredType(concatenatedArguments.single);
  }

  return compile(concatenatedArguments, context);
}

Iterable<CompiledExpression<C, T>> _concatContinuousConstantArguments<C, T>(
  Iterable<CompiledExpression<C, T>> arguments,
  CombineOperationCompilerFn<T, T> compile,
  AnalysisContext context,
) sync* {
  final argumentGroups = arguments
      .splitBefore((argument) => argument is! ConstantCompiledExpression);

  for (final group in argumentGroups) {
    if (group.length == 1) {
      yield group.single;
    } else {
      final constantArguments = group
          .cast<ConstantCompiledExpression<C, T>>()
          .map((argument) => argument.withNullableContext())
          .toList();

      yield ConstantCompiledExpression<C, T>(
        compile(constantArguments, context)(null),
      );
    }
  }
}
