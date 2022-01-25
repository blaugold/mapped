import 'package:expressions/expressions.dart';

import 'conversion.dart';
import 'delegate_builder.dart';
import 'type_system.dart';

void stringOperations(StyleExpressionDelegateBuilder builder) => builder
  ..concatOperation<Object?, String>(
    'concat',
    nullableValueType,
    const Range(2),
    stringType,
    <C>(arguments, __) => CompiledExpression((_) {
      final stringBuffer = StringBuffer();
      for (final arg in arguments) {
        stringBuffer.write(convertValueToString(arg(_)));
      }
      return stringBuffer.toString();
    }),
  )
  ..mapOperation<String, String>(
    'downcase',
    stringType,
    stringType,
    (value) => value.toLowerCase(),
  )
  // TODO: is-supported-script: https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/#is-supported-script
  // TODO: resolved-locale: https://docs.mapbox.com/mapbox-gl-js/style-spec/expressions/#resolved-locale
  ..mapOperation<String, String>(
    'upcase',
    stringType,
    stringType,
    (value) => value.toUpperCase(),
  );
