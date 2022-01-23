import 'package:expressions/expressions.dart';

import 'add_operation.dart';
import 'any_operation.dart';
import 'concat_operation.dart';
import 'context_operation.dart';
import 'cos_operation.dart';
import 'let_var_operation.dart';
import 'pi_operation.dart';
import 'typeof_operation.dart';

final allTestOperations = <DelegateBuilderFn<TestContext>>[
  addOperation,
  anyOperation,
  concatOperation,
  contextOperation,
  cosOperation,
  letVarOperation,
  piOperation,
  typeofOperation
];
