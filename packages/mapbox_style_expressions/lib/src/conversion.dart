String convertValueToString(Object? value) {
  if (value == null || value is bool || value is String || value is double) {
    return value.toString();
  }

  // TODO: https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/#types-to-string
  // color
  // image
  // other types

  throw UnimplementedError(
    'to-string is not implemented for ${value.runtimeType}',
  );
}
