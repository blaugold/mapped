import 'package:collection/collection.dart';

import 'analysis_context.dart';
import 'compilation.dart';
import 'delegate_builder.dart';
import 'expression.dart';

CompiledExpression<C, T> optimizeReduceOperationToConstant<C, T>(
  Operation operation,
  AnalysisContext context,
  ReduceOperationCompilerFn<T> compile,
) {
  final compiledArguments =
      operation.arguments.map(context.compiledExpression<C, T>).toList();

  final constantArguments =
      compiledArguments.whereType<ConstantCompiledExpression<C, T>>().toList();

  // We need at least two const arguments to reduce to a new const argument, to
  // be able to optimize the operation.
  if (constantArguments.length < 2) {
    return compile(compiledArguments);
  }

  // Compute a new constant expression by reducing the constant arguments.
  final constantsReducer = compile(
    constantArguments.map((it) => it.withNullableContext()).toList(),
  );
  final reducedConstants =
      ConstantCompiledExpression<C, T>(constantsReducer(null));

  final dynamicArguments =
      compiledArguments.whereNot(constantArguments.contains);
  if (dynamicArguments.isEmpty) {
    // All arguments where constants and this operation has been reduced to a
    // constant.
    return reducedConstants;
  }

  return compile([...dynamicArguments, reducedConstants]);
}

CompiledExpression<C, R> optimizeMapOperationToConstant<C, T, R>(
  Operation operation,
  AnalysisContext context,
  MapOperationCompilerFn<T, R> compile,
) {
  final compiledArgument =
      context.compiledExpression<C, T>(operation.arguments.first);

  if (compiledArgument is! ConstantCompiledExpression<C, T>) {
    return compile(compiledArgument);
  }

  final constantMapper = compile(compiledArgument.withNullableContext());
  return ConstantCompiledExpression(constantMapper(null));
}
