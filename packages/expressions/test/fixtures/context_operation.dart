import 'package:expressions/expressions.dart';

import 'type_system.dart';

class TestContext {
  TestContext({this.float, this.string, this.boolean});

  final double? float;
  final String? string;
  final bool? boolean;
}

Expression contextString() => Operation('context-string');
Expression contextFloat() => Operation('context-float');
Expression contextBoolean() => Operation('context-boolean');

void contextOperation(DelegateBuilder<TestContext> builder) => builder
  ..contextLookupOperation(
    'context-float',
    floatType,
    (context) => context.float!,
  )
  ..contextLookupOperation(
    'context-string',
    stringType,
    (context) => context.string!,
  )
  ..contextLookupOperation(
    'context-boolean',
    booleanType,
    (context) => context.boolean!,
  );
