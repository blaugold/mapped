import 'package:collection/collection.dart';

abstract class AnalysisContext {
  factory AnalysisContext() = _AnalysisContextRoot;

  const AnalysisContext._();

  Iterable<Object?> get elements;

  T firstOfType<T>() => elements.whereType<T>().first;

  T? firstOfTypeOrNull<T>() => elements.whereType<T>().firstOrNull;

  Iterable<T> allOfType<T>() => elements.whereType();

  AnalysisContext operator +(Object? other) {
    if (other is Iterable) {
      var result = this;
      for (final element in other) {
        result = result + element;
      }
      return result;
    }

    if (other is AnalysisContext) {
      return this + other.elements.toList().reversed;
    }

    return _AnalysisContextElement(this, other);
  }
}

class _AnalysisContextRoot extends AnalysisContext {
  const _AnalysisContextRoot() : super._();

  @override
  List<Object?> get elements => const [];
}

class _AnalysisContextElement extends AnalysisContext {
  _AnalysisContextElement(this._previous, this._element) : super._();

  final AnalysisContext _previous;

  final Object? _element;

  @override
  Iterable<Object?> get elements sync* {
    yield _element;
    yield* _previous.elements;
  }
}
