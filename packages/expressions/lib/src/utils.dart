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
