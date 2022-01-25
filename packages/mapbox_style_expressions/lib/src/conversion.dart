bool convertValueToBoolean(Object? value) {
  if (value == null ||
      value == false ||
      value == '' ||
      value == 0 ||
      value == double.nan) {
    return false;
  }

  return true;
}

double? convertValueToNumber(Object? value) {
  if (value is double) {
    return value;
  }

  if (value is int) {
    return value.toDouble();
  }

  if (value == null || value == false) {
    return 0;
  }

  if (value == true) {
    return 1;
  }

  if (value is String) {
    return num.tryParse(value)?.toDouble();
  }
}

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
