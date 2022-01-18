import 'dart:collection';

import 'package:csslib/parser.dart' as css;

part 'mapbox_style.g.dart';

mixin DataMixin {
  /// Whether this object has been frozen.
  ///
  /// Objects are frozen by calling [freeze] on them.
  bool get isFrozen => _isFrozen;
  bool _isFrozen = false;

  /// Freezes this object by making it deeply immutable.
  void freeze() {
    if (_isFrozen) {
      return;
    }
    _isFrozen = true;
  }

  void _checkNotFrozen() {
    if (_isFrozen) {
      throw StateError('Cannot modify a frozen object.');
    }
  }

  /// Makes a deep copy of this object.
  ///
  /// The copy will not be frozen, regardless of whether this object is.
  Object copy();

  /// Sets default values for this object's properties, deeply.
  // void applyDefaults();

  /// Returns the JSON representation of this object.
  Map<String, Object?> toJson();
}

class DataContext {
  /// Creates a root context.
  DataContext.root({this.value})
      : parent = null,
        key = null,
        _exceptions = [];

  /// Creates a child context.
  DataContext.child({
    required DataContext parent,
    required Object key,
    this.value,
  })  :
        // ignore: prefer_initializing_formals
        parent = parent,
        // ignore: prefer_initializing_formals
        key = key,
        _exceptions = parent._exceptions;

  /// The parent context.
  ///
  /// The root context has `null` as its parent.
  final DataContext? parent;

  /// The key of this context within the context of its parent.
  ///
  /// The root context has `null` as its key.
  final Object? key;

  /// A value associated with this context.
  final Object? value;

  /// Whether there are any exceptions associated with this context.
  bool get hasLocalExceptions => _hasLocalException;
  bool _hasLocalException = false;

  /// Whether there are any exceptions in the context tree.
  bool get hasExceptions => _exceptions.isNotEmpty;

  /// All the exceptions recorded in the context tree.
  List<DataException> get exceptions => UnmodifiableListView(_exceptions);
  final List<DataException> _exceptions;

  /// Records an exception in the context tree.
  void _recordException(DataException exception) {
    exception._context = this;
    _exceptions.add(exception);
    _hasLocalException = true;
  }

  /// A string representation of the path to this context.
  ///
  /// The root context has `*` as its path.
  String get pathString =>
      parent == null ? '*' : '${parent!.pathString}.${key!}';
}

class DataException implements Exception {
  DataException(this.message);

  final String message;

  DataContext get context => _context;
  late final DataContext _context;

  @override
  String toString() => 'DataException: at ${context.pathString}: $message';
}

typedef DataParser<T> = T? Function(DataContext context);

T? _parseAsType<T>(DataContext context) {
  final value = context.value;
  if (value is T) {
    return value;
  }
  context._recordException(DataException('Expected value of type $T.'));
}

Map<String, T>? _parseStringMap<T>(
  DataContext context,
  DataParser<T> parser,
) {
  final value = context.value;
  if (value is! Map<String, Object?>) {
    context._recordException(
      DataException('Expected value of type Map<String, Object?>.'),
    );
    return null;
  }

  final result = <String, T>{};

  for (final entry in value.entries) {
    final valueContext = DataContext.child(
      parent: context,
      key: entry.key,
      value: entry.value,
    );
    final value = parser(valueContext);
    if (!valueContext.hasLocalExceptions) {
      result[entry.key] = value as T;
    }
  }

  return result;
}

List<T>? _parseArray<T>(
  DataContext context,
  DataParser<T> parser,
) {
  final value = context.value;
  if (value is! List<Object?>) {
    context._recordException(
      DataException('Expected value of type List<Object?>.'),
    );
    return null;
  }

  final result = <T>[];

  var i = 0;
  for (final element in value) {
    final valueContext = DataContext.child(
      parent: context,
      key: i++,
      value: element,
    );
    final value = parser(valueContext);
    if (!valueContext.hasLocalExceptions) {
      result.add(value as T);
    }
  }

  return result;
}

T? _parseDataProperty<T>(
  DataContext context,
  String key,
  Object? value,
  DataParser<T> parser,
) {
  final valueContext = DataContext.child(
    parent: context,
    key: key,
    value: value,
  );
  return parser(valueContext);
}

void _parseDynamicProperties<T>(
  DataContext context,
  Map<String, Object?> map,
  Map<String, T> dynamicProperties,
  DataParser<T> parser,
) {
  for (final entry in map.entries) {
    final valueContext = DataContext.child(
      parent: context,
      key: entry.key,
      value: entry.value,
    );
    final value = parser(valueContext);
    if (!valueContext.hasLocalExceptions) {
      dynamicProperties[entry.key] = value as T;
    }
  }
}

Object? _copyJson(Object? value, {required bool immutable}) {
  if (value is String || value is num || value is bool || value == null) {
    return value;
  }

  if (value is List<Object?>) {
    final it = value.map((element) => _copyJson(element, immutable: immutable));
    return immutable ? List<Object?>.unmodifiable(it) : it.toList();
  }

  if (value is Map<String, Object?>) {
    final map = value.map(
      (key, value) => MapEntry(key, _copyJson(value, immutable: immutable)),
    );
    return immutable ? Map<String, Object?>.unmodifiable(map) : map;
  }

  throw ArgumentError.value(value, 'value', 'is not a JSON value');
}

class Color {
  Color(this.argb) {
    if (argb < 0x0 || argb > 0xffffffff) {
      throw RangeError.range(
        argb,
        0x0,
        0xffffffff,
        'argb',
        'is not a valid color',
      );
    }
  }

  factory Color.parse(String value) {
    try {
      return ParsedColor(css.Color.css(value).argbValue, value);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw FormatException('Invalid color: $value');
    }
  }

  final int argb;

  int get a => (argb >> 24) & 0xff;
  int get r => (argb >> 16) & 0xff;
  int get g => (argb >> 8) & 0xff;
  int get b => (argb >> 0) & 0xff;

  String toHexColor() {
    String _toHexByte(int value) {
      assert(value >= 0 && value <= 255);
      final hex = value.toRadixString(16);
      return hex.length == 1 ? '0$hex' : hex;
    }

    return '#${_toHexByte(r)}${_toHexByte(g)}${_toHexByte(b)}${_toHexByte(a)}';
  }

  @override
  String toString() => toHexColor();

  static Color? fromJson(DataContext context) {
    final value = context.value;
    if (value is! String) {
      context._recordException(
        DataException('Expected value of type String.'),
      );
      return null;
    }

    try {
      return Color.parse(value);
    } on FormatException catch (e) {
      context._recordException(DataException(e.message));
    }
  }
}

class ParsedColor extends Color {
  ParsedColor(int rgba, this.source) : super(rgba);

  final String source;

  @override
  String toString() => source;
}

abstract class Formatted {
  Formatted._();
}

abstract class ResolvedImage {
  ResolvedImage._();
}

class Expression<T> {
  Expression(Object? value) : value = _copyJson(value, immutable: true);

  final Object? value;

  static Expression<T>? fromJson<T>(DataContext context) =>
      Expression(context.value);
}

abstract class PromoteId {
  factory PromoteId(String property) = SinglePropertyPromoteId;

  factory PromoteId.multipleProperties(Map<String, String> properties) =
      MultiPropertyPromoteId;

  PromoteId._();

  String? forLayer(String name);

  Object? toJson();

  static PromoteId? fromJson(DataContext context) {
    final value = context.value;
    if (value is String) {
      return PromoteId(value);
    }
    if (value is Map<String, Object?>) {
      final properties = <String, String>{};
      for (final entry in value.entries) {
        final value = entry.value;
        if (value is String) {
          properties[entry.key] = value;
        } else {
          DataContext.child(
            parent: context,
            key: entry.key,
            value: value,
          )._recordException(DataException('Expected value of type String.'));
        }
      }
      return MultiPropertyPromoteId(properties);
    }

    context._recordException(
      DataException('Expected value of type String or Map<String, Object?>.'),
    );
  }
}

class SinglePropertyPromoteId extends PromoteId {
  SinglePropertyPromoteId(this.property) : super._();

  final String property;

  @override
  String? forLayer(String name) => property;

  @override
  Object? toJson() => property;
}

class MultiPropertyPromoteId extends PromoteId {
  MultiPropertyPromoteId(Map<String, String> properties)
      : properties = UnmodifiableMapView(Map.of(properties)),
        super._();

  final Map<String, String> properties;

  @override
  String? forLayer(String name) => properties[name];

  @override
  Object? toJson() => properties;
}
