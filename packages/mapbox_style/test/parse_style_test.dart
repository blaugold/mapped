import 'dart:convert';
import 'dart:io';

import 'package:mapbox_style/mapbox_style.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('parse basic style', () async {
    final styleString = await loadBasicStyle();
    final styleJson = jsonDecode(styleString) as Object?;
    final context = DataContext.root(value: styleJson);
    Style.fromJson(context);

    expect(context.exceptions, [
      isA<DataException>().having(
        (it) => it.toString(),
        'toString()',
        // ignore: lines_longer_than_80_chars
        'DataException: at *: Unexpected properties: (created, modified, id, owner, visibility, protected, draft)',
      )
    ]);
  });

  test('parse and serialize as identical', () async {
    final styleString = await loadBasicStyle();
    final styleJson = jsonDecode(styleString) as Map<String, Object?>;
    final context = DataContext.root(value: styleJson);
    final style = Style.fromJson(context)!;

    // Remove properties that are not part of the spec.
    ['created', 'modified', 'id', 'owner', 'visibility', 'protected', 'draft']
        .forEach(styleJson.remove);

    expect(style.toJson(), styleJson);
  });
}

Future<String> loadBasicStyle() =>
    File('test/fixtures/basic-style.json').readAsString();
