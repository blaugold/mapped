import 'package:collection/collection.dart';

import 'analysis.dart';
import 'analysis_context.dart';
import 'expression.dart';
import 'expression_type.dart';

class AnalysisErrors {
  List<AnalysisError> get errors => UnmodifiableListView(_errors);
  final List<AnalysisError> _errors = [];

  void add(AnalysisError error) {
    assert(!_errors.contains(error));
    _errors.add(error);
  }
}

class AnalysisError {
  AnalysisError(this.descriptor, this.context);

  final AnalysisErrorDescriptor descriptor;

  final AnalysisContext context;

  @override
  String toString() =>
      'AnalysisError at ${context.location}: ${descriptor.message(context)}';
}

abstract class AnalysisErrorDescriptor {
  AnalysisErrorDescriptor(this.id);

  final String id;

  String message(AnalysisContext context);
}

class TooFewArguments extends AnalysisErrorDescriptor {
  TooFewArguments({this.minimum, this.exactly})
      : assert(minimum != null || exactly != null),
        super('too_few_arguments');

  final int? minimum;

  final int? exactly;

  @override
  String message(AnalysisContext context) => [
        'Too few arguments. Expected ',
        if (exactly != null) 'exactly $exactly ',
        if (minimum != null) 'at least $minimum ',
        'but got ${(context.expression.parent! as Operation).arguments.length}.'
      ].join(' ');
}

class UnexpectedArgument extends AnalysisErrorDescriptor {
  UnexpectedArgument() : super('unexpected_argument');

  @override
  String message(AnalysisContext context) => 'Unexpected argument.';
}

class IncompatibleArgumentType extends AnalysisErrorDescriptor {
  IncompatibleArgumentType(this.parameterType)
      : super('incompatible_argument_type');

  final ExpressionType parameterType;

  @override
  String message(AnalysisContext context) =>
      'The argument type ${context.expressionType(context.expression)} is '
      'incompatible with the parameter type $parameterType.';
}

extension AnalysisContextErrorExt on AnalysisContext {
  AnalysisErrors get analysisErrors => firstOfType();

  void addError(AnalysisErrorDescriptor descriptor) {
    analysisErrors.add(AnalysisError(descriptor, this));
  }

  void expectExactArgumentCount(int count) {
    final operation = expression as Operation;

    if (operation.arguments.length < count) {
      addError(TooFewArguments(exactly: count));
    }
    operation.arguments.sublist(count).forEach(unexpectedArgument);
  }

  void unexpectedArgument(Expression argument) {
    addError(UnexpectedArgument());
  }

  void expectArgumentType(Expression argument, ExpressionType parameterType) {
    final argumentType = expressionType(argument);
    if (!argumentType.isAssignableTo(parameterType)) {
      expressionContext(argument)
          .addError(IncompatibleArgumentType(parameterType));
    }
  }
}
