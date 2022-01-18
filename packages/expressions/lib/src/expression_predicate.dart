import 'expression.dart';

typedef ExpressionPredicate<T extends Expression> = bool Function(T expression);

bool anyExpression<T extends Expression>(T _) => true;

ExpressionPredicate byParent<T extends Expression>(
  ExpressionPredicate<T> parentPredicate,
) =>
    (expression) {
      final parent = expression.parent;
      if (parent is T) {
        return parentPredicate(parent);
      }
      return false;
    };

ExpressionPredicate<Operation> byOperationName(String name) =>
    (operation) => operation.name == name;
