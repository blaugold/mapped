import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'math.dart';

/// A coordinate in degrees of longitude and latitude in the WSG84 CRS.
@immutable
class LngLat {
  const LngLat(this.lng, this.lat);

  const LngLat.zero()
      : lng = 0,
        lat = 0;

  LngLat.fromList(List<num> list)
      : assert(list.length >= 2),
        lng = list[0].toDouble(),
        lat = list[1].toDouble();

  LngLat.fromMap(Map<String, Object?> map)
      : assert(map.containsKey('lng') || map.containsKey('lon')),
        assert(map.containsKey('lat')),
        lng = ((map['lng'] ?? map['lon'])! as num).toDouble(),
        lat = (map['lat']! as num).toDouble();

  final double lng;

  final double lat;

  LngLat wrap() => LngLat(
        ((lng + 180) % 360) - 180,
        (((lat - 90) % 360) - 180).abs() - 90,
      );

  /// The distance in meters between this coordinate and [other].
  ///
  /// The result is calculated using the Haversine formula using the equatorial
  /// earth radius as defined by WSG84.
  ///
  /// https://en.wikipedia.org/wiki/Haversine_formula#Formulation
  double distance(LngLat other) {
    final aLng = radians(lng);
    final aLat = radians(lat);
    final bLng = radians(other.lng);
    final bLat = radians(other.lat);
    final h = sin2((bLat - aLat) / 2) +
        cos(aLat) * cos(bLat) * sin2((bLng - aLng) / 2);
    assert(h < 1);
    return 2 * earthRadius * asin(sqrt(h));
  }

  List<double> toList() => [lng, lat];

  Map<String, Object?> toMap() => {'lng': lng, 'lat': lat};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LngLat &&
          runtimeType == other.runtimeType &&
          lng == other.lng &&
          lat == other.lat;

  @override
  int get hashCode => lng.hashCode ^ lat.hashCode;

  @override
  String toString() => 'LngLat($lng, $lat)';
}
