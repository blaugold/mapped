import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';
import 'package:test/test.dart';

void main() {
  // TODO: test error handling
  // TODO: test with operation de/encoders

  group('decode', () {
    final decoder = JsonExpressionDecoder();

    test('literal at root', () {
      expect(decoder.convert('a'), literal('a'));
    });

    test('operation at root', () {
      expect(decoder.convert(['a']), operation('a'));
    });

    test('expressions object at root', () {
      expect(
        decoder.convert({'a': 'b'}),
        expressionsObject({'a': literal('b')}),
      );
    });

    test('literal as operation argument', () {
      expect(decoder.convert(['a', 'b']), operation('a', [literal('b')]));
    });

    test('operation as operation argument', () {
      expect(
        decoder.convert([
          'a',
          ['b']
        ]),
        operation('a', [operation('b')]),
      );
    });

    test('expressions object as operation argument', () {
      expect(
        decoder.convert([
          'a',
          {'b': 'c'}
        ]),
        operation('a', [
          expressionsObject({'b': literal('c')})
        ]),
      );
    });

    group('encode', () {
      final encoder = JsonExpressionEncoder();

      test('literal at root', () {
        expect(encoder.convert(Literal('a')), 'a');
      });

      test('operation at root', () {
        expect(encoder.convert(Operation('a')), ['a']);
      });

      test('expressions object at root', () {
        expect(
          encoder.convert(ExpressionsObject({'a': Literal('b')})),
          {'a': 'b'},
        );
      });

      test('literal as operation argument', () {
        expect(encoder.convert(Operation('a', [Literal('b')])), ['a', 'b']);
      });

      test('operation as operation argument', () {
        expect(
          encoder.convert(Operation('a', [Operation('b')])),
          [
            'a',
            ['b']
          ],
        );
      });

      test('expressions object as operation argument', () {
        expect(
          encoder.convert(
            Operation('a', [
              ExpressionsObject({'b': Literal('c')})
            ]),
          ),
          [
            'a',
            {'b': 'c'}
          ],
        );
      });
    });
  });
}
