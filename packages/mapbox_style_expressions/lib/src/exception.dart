/// An exception that is thrown when evaluation of a style expression fails.
class ExpressionException implements Exception {
  ExpressionException(this.message);

  final String message;

  @override
  String toString() => 'ExpressionException: $message';
}
