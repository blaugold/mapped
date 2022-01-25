export 'src/analysis.dart'
    show
        AnalysisContextAnalysisExt,
        AnalysisDelegate,
        ExpressionCheckerDelegate,
        ExpressionContextResolver,
        ExpressionContextResolverDelegate,
        ExpressionTypeResolver,
        ExpressionTypeResolverDelegate;
export 'src/analysis_context.dart' show AnalysisContext;
export 'src/analysis_error.dart'
    show
        AnalysisContextErrorExt,
        AnalysisError,
        AnalysisErrors,
        AnalysisErrorDescriptor,
        InvalidLiteralValue,
        IncompatibleExpressionType,
        TooFewArguments,
        UnexpectedArgument,
        UnknownOperation;
export 'src/analyzer.dart' show ExpressionAnalyzer;
export 'src/compilation.dart'
    show
        CompiledExpression,
        CompiledExpressionFn,
        CompiledExpressionResolver,
        ConstantCompiledExpression,
        ExpressionCompilerDelegate,
        AnalysisContextCompilationExt,
        assertRequiredType;
export 'src/compiler.dart' show ExpressionCompiler;
export 'src/delegate_builder.dart'
    show
        DelegateBuilder,
        DelegateBuilderFn,
        LiteralCheckerFn,
        LiteralTypeResolverFn,
        MapOperationCompilerFn,
        OperationArgumentContextResolverFn,
        OperationCompilerFn,
        OperationTypeResolverFn,
        CombineOperationCompilerFn;
export 'src/encoding.dart'
    show ExpressionDecoder, ExpressionDecodingException, ExpressionEncoder;
export 'src/expression.dart'
    show
        Expression,
        ExpressionLocation,
        ExpressionLocationType,
        ExpressionsObject,
        Literal,
        Operation;
export 'src/expression_checker.dart'
    show checkExpressionKind, checkExpressionType, regexLiteralStringChecker;
export 'src/expression_predicate.dart'
    show anyExpression, byOperationName, byParent, ExpressionPredicate;
export 'src/expression_type.dart'
    show
        ExpressionType,
        HierarchicalType,
        nullType,
        nullableType,
        UnionType,
        unknownType;
export 'src/expression_utils.dart' show OperationUtilsExt;
export 'src/functional_delegate.dart'
    show
        combineExpressionCheckers,
        FunctionalAnalysisDelegate,
        FunctionalExpressionCheckerDelegate,
        FunctionalExpressionCompilerDelegate,
        FunctionalExpressionContextResolverDelegate,
        FunctionalExpressionTypeResolverDelegate,
        ExpressionCheckerFn,
        ExpressionCompilerFn,
        ExpressionContextResolverFn,
        ExpressionTypeResolverFn;
export 'src/json_encoding.dart'
    show
        JsonExpressionDecoder,
        JsonExpressionDecodingException,
        JsonExpressionEncoder,
        JsonOperationDecoder,
        JsonOperationEncoder;
export 'src/operation_arguments_checker.dart'
    show
        ArgumentCheckerContinuation,
        OperationArgumentChecker,
        OperationArgumentCheckersFactory,
        OperationArgumentsCheckerDelegate;
export 'src/optimization.dart'
    show
        optimizeMapOperationToConstant,
        optimizeConcatOperationToConstant,
        optimizeReduceOperationToConstant;
export 'src/runtime_type_system.dart'
    show
        AnalysisContextRuntimeTypeSystemExt,
        DefiniteRuntimeType,
        RuntimeTypeSystem,
        RuntimeTypeDelegate;
export 'src/utils.dart' show Range;
