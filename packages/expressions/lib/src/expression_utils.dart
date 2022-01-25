import 'analysis.dart';
import 'analysis_context.dart';
import 'expression.dart';
import 'expression_type.dart';

extension OperationUtilsExt on Operation {
  T? argument<T extends Expression>(int argumentIndex) {
    if (arguments.length <= argumentIndex) {
      return null;
    }

    final argument = arguments[argumentIndex];
    return argument is T ? argument : null;
  }

  T? literalArgumentValue<T>(int argumentIndex) {
    final value = argument<Literal>(argumentIndex)?.value;
    return value is T ? value : null;
  }

  ExpressionType? argumentType(int argumentIndex, AnalysisContext context) {
    final argument = this.argument(argumentIndex);
    return argument == null ? null : context.expressionType(argument);
  }
}
