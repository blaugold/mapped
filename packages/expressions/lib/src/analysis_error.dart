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

  String get message => '${context.location}: ${descriptor.message(context)}';

  @override
  String toString() => message;
}

abstract class AnalysisErrorDescriptor {
  AnalysisErrorDescriptor(this.id);

  final String id;

  String message(AnalysisContext context);
}

class InvalidLiteralValue extends AnalysisErrorDescriptor {
  InvalidLiteralValue([this.reason]) : super('invalid_literal_value');

  final String? reason;

  @override
  String message(AnalysisContext context) {
    final literal = context.expression as Literal;
    return [
      'Literal has invalid value',
      if (reason != null) ...[': ', reason],
      ' (Value: ${literal.value})'
    ].join();
  }
}

class IncompatibleExpressionKind extends AnalysisErrorDescriptor {
  IncompatibleExpressionKind(this.kind) : super('incompatible_expression_kind');

  final ExpressionKind kind;

  @override
  String message(AnalysisContext context) =>
      'The actual kind "${context.expression.kind_}" is '
      'incompatible with the required kind "$kind".';
}

class IncompatibleExpressionType extends AnalysisErrorDescriptor {
  IncompatibleExpressionType(this.type) : super('incompatible_expression_type');

  final ExpressionType type;

  @override
  String message(AnalysisContext context) =>
      'The actual type "${context.expressionType(context.expression)}" is '
      'incompatible with the required type "$type".';
}

class UnknownOperation extends AnalysisErrorDescriptor {
  UnknownOperation() : super('unknown_operation');

  @override
  String message(AnalysisContext context) => 'The operation is not known.';
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
        'but got ${(context.expression as Operation).arguments.length}.'
      ].join(' ');
}

class UnexpectedArgument extends AnalysisErrorDescriptor {
  UnexpectedArgument() : super('unexpected_argument');

  @override
  String message(AnalysisContext context) => 'Unexpected argument.';
}

extension AnalysisContextErrorExt on AnalysisContext {
  AnalysisErrors get analysisErrors => firstOfType();

  void addError(AnalysisErrorDescriptor descriptor) {
    analysisErrors.add(AnalysisError(descriptor, this));
  }

  void invalidLiteralValue([String? reason]) {
    assert(expression is Literal);
    addError(InvalidLiteralValue(reason));
  }

  void expectExpressionKind<T extends Expression>(
    Expression expression,
    ExpressionKind<T> kind,
  ) {
    if (expression is! T) {
      addError(IncompatibleExpressionKind(kind));
    }
  }

  void expectExpressionType(Expression expression, ExpressionType type) {
    final expressionType = this.expressionType(expression);
    if (expressionType != unknownType && !expressionType.isAssignableTo(type)) {
      expressionContext(expression).addError(IncompatibleExpressionType(type));
    }
  }

  void unknownOperation() {
    addError(UnknownOperation());
  }

  void expectExactArgumentCount(int count) {
    final operation = expression as Operation;

    if (operation.arguments.length < count) {
      addError(TooFewArguments(exactly: count));
    }
    operation.arguments.sublist(count).forEach(unexpectedArgument);
  }

  void unexpectedArgument(Expression argument) {
    expressionContext(argument).addError(UnexpectedArgument());
  }
}
