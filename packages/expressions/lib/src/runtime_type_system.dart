import 'analysis_context.dart';
import 'expression_type.dart';

abstract class RuntimeTypeDelegate {
  const RuntimeTypeDelegate();

  bool canHandleType(ExpressionType type);

  bool canHandleRuntimeValue(Object? value);

  R runtimeTypeOfType<R>(
    ExpressionType type,
    R Function<T>() f,
    RuntimeTypeSystem typeSystem,
  );

  ExpressionType typeOfRuntimeValue(
    Object? value,
    RuntimeTypeSystem typeSystem,
  );
}

class DefiniteRuntimeType<T> extends RuntimeTypeDelegate {
  const DefiniteRuntimeType(this.type);

  final ExpressionType type;

  @override
  bool canHandleType(ExpressionType type) => type == this.type;

  @override
  bool canHandleRuntimeValue(Object? value) => value is T;

  @override
  R runtimeTypeOfType<R>(
    ExpressionType type,
    R Function<T>() f,
    RuntimeTypeSystem typeSystem,
  ) =>
      f<T>();

  @override
  ExpressionType typeOfRuntimeValue(
    Object? value,
    RuntimeTypeSystem typeSystem,
  ) =>
      type;
}

class RuntimeTypeSystem {
  RuntimeTypeSystem(this._delegates);

  final List<RuntimeTypeDelegate> _delegates;

  R runtimeTypeOfType<R>(ExpressionType type, R Function<T>() f) {
    final delegate =
        _delegates.singleWhere((element) => element.canHandleType(type));

    return delegate.runtimeTypeOfType(type, f, this);
  }

  ExpressionType typeOfRuntimeValue(Object? value) {
    final delegate = _delegates
        .singleWhere((element) => element.canHandleRuntimeValue(value));

    return delegate.typeOfRuntimeValue(value, this);
  }
}

extension AnalysisContextRuntimeTypeSystemExt on AnalysisContext {
  RuntimeTypeSystem get runtimeTypeSystem => firstOfType();
}
