import 'package:expressions/expressions.dart';
import 'package:test/test.dart';

// === Expression ==============================================================

Matcher literal([Object? value]) =>
    isA<Literal>().having((it) => it.value, 'value', value ?? anything);

Matcher operation([Object? name, Iterable<Object?>? arguments]) =>
    isA<Operation>()
        .having((it) => it.name, 'name', name ?? anything)
        .having((it) => it.arguments, 'arguments', arguments ?? anything);

Matcher expressionsObject([Map<String, Object?>? fields]) =>
    isA<ExpressionsObject>()
        .having((it) => it.fields, 'fields', fields ?? anything);

// === AnalysisError ===========================================================

final isAnalysisError = isA<AnalysisError>();

Matcher analysisErrorMessage(String message) =>
    isAnalysisError.having((it) => it.message, 'message', message);

Matcher analysisErrorMessages(Iterable<String> messages) =>
    containsAll(messages.map<Matcher>(analysisErrorMessage));
