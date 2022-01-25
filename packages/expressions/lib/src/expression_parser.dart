// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:charcode/ascii.dart';

import 'expression.dart';

// The grammar for the textual representation of expressions, which this parser
// implements.
//
// Currently this is only an experiment.
//
// s = [ wsp ] , expr , [ wsp ]
// expr = lit | op
// lit = boolean | number
// op = ident , "(" , expr-list , ")"
// expr-list = [ wsp ] , { expr , [ wsp ] , "," , [ wsp ] , } , [ expr , [ wsp ] , [ "," ] , [ wsp ] ],
// ident = alpha , { alpha | digit }
// boolean = "true" | "false"
// number = integer | float
// integer = digit , { digit }
// float = [ integer ] , "." , integer
// digit = "0" - "9"
// alpha = "A" - "Z" | "a" - "z"
// wsp = " " | "\t" | "\n" | "\r"
class ExpressionParser {
  RuneIterator _it = RuneIterator('');

  Expression parse(String input) {
    _it = RuneIterator(input);

    _whiteSpace();
    final expression = _expression();
    if (expression == null) {
      _fail('Expected expression.');
    }
    _whiteSpace();
    _endOfInput();

    return expression;
  }

  Never _fail(String message) {
    // Move the iterator to the first character that could not be parsed.
    _it.moveNext();

    throw FormatException(
      message,
      _it.string,
      _it.rawIndex,
    );
  }

  void _expect(int rune) {
    if (!_accept(rune)) {
      _fail('Expected character: ${String.fromCharCode(rune)}');
    }
  }

  bool _accept(int rune) {
    if (_it.moveNext()) {
      if (_it.current == rune) {
        return true;
      }

      _it.movePrevious();
    }

    return false;
  }

  bool _acceptString(String string) {
    if (_it.moveNext()) {
      final rawIndex = _it.rawIndex;
      final end = rawIndex + string.length;
      if (end > _it.string.length) {
        _it.movePrevious();
        return false;
      }

      final subString = _it.string.substring(rawIndex, end);
      if (subString != string) {
        _it.movePrevious();
        return false;
      }

      _it.rawIndex = end - 1;
      return true;
    }

    return false;
  }

  void _endOfInput() {
    if (_it.moveNext()) {
      _fail('Unexpected character');
    }
  }

  int? _acceptDigit() {
    if (_it.moveNext()) {
      final current = _it.current;
      if (current >= $0 && current <= $9) {
        return current - $0;
      }

      _it.movePrevious();
    }
  }

  String? _acceptAlpha() {
    if (_it.moveNext()) {
      final current = _it.current;
      if ((current >= $a && current <= $z) ||
          (current >= $A && current <= $Z)) {
        return _it.currentAsString;
      }

      _it.movePrevious();
    }
  }

  String? _acceptAlphaNumeric() => _acceptAlpha() ?? _acceptDigit()?.toString();

  void _whiteSpace() {
    while (_accept($space) || _accept($ht) || _accept($lf) || _accept($cr)) {}
  }

  bool _acceptNull() => _acceptString('null');

  bool? _boolean() {
    if (_acceptString('true')) {
      return true;
    } else if (_acceptString('false')) {
      return false;
    }
  }

  num? _number() {
    var integer = _acceptDigit();
    if (integer != null) {
      while (true) {
        final digit = _acceptDigit();
        if (digit == null) {
          break;
        }
        integer = integer! * 10 + digit;
      }
    }

    if (_accept($dot)) {
      // This is a float.
      var fraction = _acceptDigit();
      if (fraction == null) {
        if (integer != null) {
          // The decimal point was preceded by an integer and should have been
          // followed by at least one digit.
          _fail('Expected digit after decimal point.');
        }

        // We just have a point. This is not a number.
        _it.movePrevious();
        return null;
      }

      var decimalPoints = 1;
      while (true) {
        final digit = _acceptDigit();
        if (digit == null) {
          break;
        }

        fraction = fraction! * 10 + digit;
        decimalPoints++;
      }

      return (integer ?? 0) + (fraction!.toDouble() / pow(10, decimalPoints));
    }

    return integer;
  }

  String? _identifier() {
    var result = _acceptAlpha();
    if (result == null) {
      return null;
    }

    while (true) {
      final character = _acceptAlphaNumeric();
      if (character == null) {
        break;
      }
      result = result! + character;
    }

    return result;
  }

  Expression? _expression() => _literal() ?? _operation();

  Literal? _literal() {
    if (_acceptNull()) {
      return Literal(null);
    }
    final value = _boolean() ?? _number();
    return value == null ? null : Literal(value);
  }

  Operation? _operation() {
    final name = _identifier();
    if (name == null) {
      return null;
    }

    _expect($openParenthesis);
    final arguments = _expressionList();
    _expect($closeParenthesis);

    return Operation(name, arguments);
  }

  List<Expression> _expressionList() {
    _whiteSpace();

    final result = <Expression>[];

    while (true) {
      final expression = _expression();
      if (expression == null) {
        break;
      }
      result.add(expression);

      _whiteSpace();

      if (!_accept($comma)) {
        break;
      }

      _whiteSpace();
    }

    _whiteSpace();

    return result;
  }
}
