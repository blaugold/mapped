import 'package:expressions/expressions.dart';
import 'package:expressions/test.dart';

import 'type_system.dart';

Expression typeof(Object? value) => coercingOperation('typeof', [value]);

void typeofOperation<C>(DelegateBuilder<C> builder) =>
    builder.mapOperationWithAnalysisContext(
      'typeof',
      nullableType(valueType),
      stringType,
      (value, context) =>
          context.runtimeTypeSystem.typeOfRuntimeValue(value).toString(),
    );
