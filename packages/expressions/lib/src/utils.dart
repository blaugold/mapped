import 'dart:math';

Never unreachable() {
  throw StateError('This code should not be reached.');
}

Map<K, V> maxLengthMapFromIterables<K, V>(
  Iterable<K> keys,
  Iterable<V> values,
) {
  final minLength = min(keys.length, values.length);
  return Map.fromIterables(keys.take(minLength), values.take(minLength));
}

class Range {
  const Range(this.start, this.end)
      : assert(start == null || end == null || start <= end);

  const Range.empty() : this(null, null);

  const Range.exact(int value) : this(value, value);

  final int? start;
  final int? end;

  bool get isEmpty => start == null && end == null;

  bool get isExact => start == end;

  bool get isOpen => start == null || end == null;

  bool get isMinimum => start != null && end == null;

  bool get isMaximum => start == null && end != null;

  bool get isPositive => start != null && start! > 0;

  bool get isNegative => end != null && end! < 0;

  Iterable<int> get values sync* {
    if (isEmpty) {
      return;
    }

    final start = this.start;
    final end = this.end;
    if (start != null) {
      var i = start;
      while (end != null && i <= end) {
        yield i++;
      }
    } else {
      var i = end!;
      yield i--;
    }
  }
}
