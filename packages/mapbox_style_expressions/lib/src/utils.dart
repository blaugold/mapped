Never unreachable() {
  throw StateError('This code should not be reached.');
}

extension IterableExt<T> on Iterable<T> {
  Iterable<List<T>> groupWhile(bool Function(T e) test) sync* {
    List<T>? group;
    for (final element in this) {
      if (test(element)) {
        group ??= [];
        group.add(element);
      } else {
        if (group != null) {
          yield group;
          group = null;
        }
        yield [element];
      }
    }
    if (group != null) {
      yield group;
    }
  }
}
