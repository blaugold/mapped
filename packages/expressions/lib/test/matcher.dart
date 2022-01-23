// ignore_for_file: depend_on_referenced_packages

import 'package:test/test.dart';

import '../expressions.dart';

// === Expression ==============================================================

Matcher coerceToExpressionMatcher(Object? value) {
  if (value is Matcher) {
    return value;
  } else {
    return literal(value);
  }
}

Matcher literal([Object? value]) =>
    isA<Literal>().having((it) => it.value, 'value', value ?? anything);

Matcher operation([String? name, Iterable<Object?>? arguments]) =>
    isA<Operation>().having((it) => it.name, 'name', name ?? anything).having(
          (it) => it.arguments,
          'arguments',
          arguments?.map(coerceToExpressionMatcher) ?? anything,
        );

Matcher expressionsObject([Map<String, Object?>? fields]) =>
    isA<ExpressionsObject>().having(
      (it) => it.fields,
      'fields',
      fields?.map(
            (key, value) => MapEntry(key, coerceToExpressionMatcher(value)),
          ) ??
          anything,
    );

// === AnalysisError ===========================================================

final isAnalysisError = isA<AnalysisError>();

Matcher analysisErrorMessage(String message) =>
    isAnalysisError.having((it) => it.message, 'message', message);

Matcher analysisErrorMessages(Iterable<String> messages) =>
    containsAll(messages.map<Matcher>(analysisErrorMessage));

TypeMatcher<AnalysisError> analysisErrorDescriptor(Object? matcher) =>
    isAnalysisError.having((it) => it.descriptor, 'descriptor', matcher);

final isIncompatibleExpressionType = isA<IncompatibleExpressionType>();

final isUnexpectedArgument = isA<UnexpectedArgument>();

TypeMatcher<TooFewArguments> isTooFewArguments({int? exact, int? minimum}) =>
    isA<TooFewArguments>()
        .having((it) => it.exactly, 'exact', exact ?? anything)
        .having((it) => it.minimum, 'minimum', minimum ?? anything);
