import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:mapped/src/geometry_decoding.dart';
import 'package:vector_tile/raw/raw_vector_tile.dart';

late final VectorTile sampleTile;

Future<VectorTile> readSampleTile() async {
  final file = File('test/fixtures/sample_tile.pbf');
  final bytes = await file.readAsBytes();
  return VectorTile.fromBuffer(bytes);
}

enum PathApi {
  points,
  cursor,
}

class CreatePolygonPath extends BenchmarkBase {
  CreatePolygonPath({required this.api, this.points = 1000})
      : super('CreatePolygonPath(points: $points, api: $api)');

  final PathApi api;
  final int points;

  late final _points = [
    for (var i = 0; i < points; i++)
      Offset(
        cos(2 * pi / points * i),
        sin(2 * pi / points * i),
      ),
  ];

  @override
  void run() {
    if (api == PathApi.points) {
      Path().addPolygon(_points, true);
    }
    if (api == PathApi.cursor) {
      final path = Path()..moveTo(_points[0].dx, _points[0].dy);
      for (var i = 1; i < _points.length; i++) {
        path.lineTo(_points[i].dx, _points[i].dy);
      }
      path.close();
    }
  }
}

class DecodeVectorTilePolygons extends BenchmarkBase {
  DecodeVectorTilePolygons({required this.api})
      : super('DecodeVectorTilePolygons(api: $api)');

  final PathApi api;

  late final List<List<int>> pointsGeometry;
  late final List<List<int>> lineStringsGeometry;
  late final List<List<int>> polygonsGeometry;

  @override
  void setup() {
    List<List<int>> _collectGeometryOfType(VectorTile_GeomType type) =>
        sampleTile.layers
            .expand(
              (layer) => layer.features
                  .where((feature) => feature.type == type)
                  .map((feature) => feature.geometry),
            )
            .toList();

    pointsGeometry = _collectGeometryOfType(VectorTile_GeomType.POINT);
    lineStringsGeometry =
        _collectGeometryOfType(VectorTile_GeomType.LINESTRING);
    polygonsGeometry = _collectGeometryOfType(VectorTile_GeomType.POLYGON);
  }

  @override
  void run() {
    final points = pointsGeometry.expand(decodePoints);
    late final Iterable<Path> lineStrings;
    late final Iterable<Path> polygons;

    switch (api) {
      case PathApi.points:
        lineStrings = lineStringsGeometry.expand(decodeLineStringsWithPoints);
        polygons = polygonsGeometry.expand(decodePolygonsWithPoints);
        break;
      case PathApi.cursor:
        lineStrings = lineStringsGeometry.expand(decodeLineStringsWithCursor);
        polygons = polygonsGeometry.expand(decodePolygonsWithCursor);
        break;
    }

    for (final _ in points) {}
    for (final _ in lineStrings) {}
    for (final _ in polygons) {}
  }
}

Future<void> main() async {
  sampleTile = await readSampleTile();

  final benchmarks = [
    CreatePolygonPath(api: PathApi.cursor),
    CreatePolygonPath(api: PathApi.points),
    DecodeVectorTilePolygons(api: PathApi.cursor),
    DecodeVectorTilePolygons(api: PathApi.points),
  ];

  for (final benchmark in benchmarks) {
    benchmark.report();
  }
}
