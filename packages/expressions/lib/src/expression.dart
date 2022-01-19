class ExpressionKind<T extends Expression> {
  const ExpressionKind(this.name);

  final String name;

  @override
  String toString() => name;
}

abstract class Expression {
  var _hasParent = false;

  Expression? get parent => _parent;
  Expression? _parent;

  set parent(Expression? parent) {
    if (_hasParent) {
      throw StateError('Cannot change the parent of an expression.');
    }

    _hasParent = true;
    _parent = parent;
  }

  ExpressionKind get kind_;
}

class Literal extends Expression {
  Literal(this.value);

  static const kind = ExpressionKind<Literal>('literal');

  @override
  ExpressionKind get kind_ => kind;

  final Object? value;

  @override
  String toString() => 'Literal($value)';
}

class ExpressionsObject extends Expression {
  ExpressionsObject(this.fields) {
    for (final field in fields.values) {
      field.parent = this;
    }
  }

  static const kind = ExpressionKind<ExpressionsObject>('object');

  @override
  ExpressionKind get kind_ => kind;

  final Map<String, Expression> fields;

  @override
  String toString() => 'ExpressionsObject($fields)';
}

class Operation extends Expression {
  Operation(this.name, [this.arguments = const []]) {
    for (final argument in arguments) {
      argument.parent = this;
    }
  }

  static const kind = ExpressionKind<Operation>('operation');

  @override
  ExpressionKind get kind_ => kind;

  final String name;

  final List<Expression> arguments;

  @override
  String toString() => 'Operation($name, $arguments)';
}

enum ExpressionLocationType {
  root,
  operation,
  operationArgument,
  objectField,
}

class ExpressionLocation {
  ExpressionLocation(this.parent, this.type, this.name);

  ExpressionLocation.root() : this(null, ExpressionLocationType.root, 'root');

  factory ExpressionLocation.fromExpressions(Iterable<Expression> expressions) {
    var location = ExpressionLocation.root();

    Expression? parent;
    for (final expression in expressions) {
      if (parent != null) {
        if (parent is Operation) {
          location = location.child(
            ExpressionLocationType.operationArgument,
            parent.arguments.indexOf(expression),
          );
        }

        if (parent is ExpressionsObject) {
          location = location.child(
            ExpressionLocationType.objectField,
            parent.fields.entries
                .firstWhere((entry) => entry.value == expression)
                .key,
          );
        }
      }

      if (expression is Operation) {
        location = location.child(
          ExpressionLocationType.operation,
          expression.name,
        );
      }

      parent = expression;
    }

    return location;
  }

  final ExpressionLocation? parent;

  final ExpressionLocationType type;

  final Object name;

  ExpressionLocation child(ExpressionLocationType type, Object name) =>
      ExpressionLocation(this, type, name);

  @override
  String toString() {
    var result = '_';

    for (var location = this;
        location.parent != null;
        location = location.parent!) {
      switch (location.type) {
        case ExpressionLocationType.root:
          result = 'Expression($result)';
          break;
        case ExpressionLocationType.operation:
          result = '${location.name}($result)';
          break;
        case ExpressionLocationType.operationArgument:
          result = '#${location.name}: $result';
          break;
        case ExpressionLocationType.objectField:
          result = '{${location.name}: $result}';
          break;
      }
    }

    return result;
  }
}
