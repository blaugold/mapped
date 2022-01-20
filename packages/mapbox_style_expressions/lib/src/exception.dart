class ExpressionFailedException implements Exception {
  ExpressionFailedException(this.message);

  final String message;

  @override
  String toString() => 'ExpressionFailedException: $message';
}
