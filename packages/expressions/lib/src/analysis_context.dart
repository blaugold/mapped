import 'package:collection/collection.dart';

abstract class AnalysisContext {
  factory AnalysisContext() = _AnalysisContextRoot;

  const AnalysisContext._();

  List<Object?> get elements;

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
      return this + other.elements;
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
  _AnalysisContextElement(this.parent, this.element) : super._();

  final AnalysisContext parent;

  final Object? element;

  @override
  late final List<Object?> elements = [...parent.elements, element];
}
