extension StringExtension on String {
  String get capitalized => '${this[0].toUpperCase()}${substring(1)}';

  String get camelCase {
    final parts = split(RegExp('[-_]'));
    return [parts.first, ...parts.sublist(1).map((part) => part.capitalized)]
        .join();
  }
}
