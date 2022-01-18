// ignore_for_file: cascade_invocations

import 'dart:core' as core;
import 'dart:core';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

import 'type.dart';

class CodeGenContext {
  CodeGenContext(this._objects);

  void use(StringBuffer writeBuffer, void Function() fn) {
    assert(_writeBuffer == null);
    assert(_current == null);
    _writeBuffer = writeBuffer;
    _current = this;
    fn();
    _current = null;
    _writeBuffer = null;
  }

  static CodeGenContext? _current;

  StringBuffer? _writeBuffer;

  final List<Object> _objects;

  final _oneOfTypeCache = <core.Type, Object>{};
  final _allOfOfTypeCache = <core.Type, List<Object>>{};

  T getOneOfType<T extends Object>() =>
      _oneOfTypeCache.putIfAbsent(T, () => _objects.whereType<T>().single) as T;

  List<T> getAllOfType<T extends Object>() => _allOfOfTypeCache.putIfAbsent(
        T,
        () => _objects.whereType<T>().toList(),
      ) as List<T>;
}

typedef WriteCodeCallback = void Function();

enum FunctionBodyType {
  block,
  expression,
}

abstract class CodeGenerator {
  CodeGenContext get context => CodeGenContext._current!;

  StringBuffer get writeBuffer => context._writeBuffer!;

  @protected
  void write(Object? object) {
    writeBuffer.write(object);
  }

  @protected
  void writeln([Object? object = '']) {
    writeBuffer.writeln(object);
  }

  @protected
  void writeDartType(Type type, {bool nullable = false}) {
    write(context.dartTypeProvider(nullable ? NullableType.from(type) : type));
  }

  @protected
  void writePartOf(String libraryName) {
    write("part of '");
    write(libraryName);
    writeln("';");
  }

  @protected
  void writeDocComment(String doc) {
    writeDocCommentLines(doc.split('\n'));
  }

  @protected
  void writeDocCommentLines(Iterable<String> lines) {
    for (final line in lines) {
      write('/// ');
      writeln(line);
    }
  }

  @protected
  void writeOverrideAnnotation() => writeln('@override');

  @protected
  void startClass({
    required Type type,
    bool abstract = false,
    Map<TypeParameter, Type?>? typeArguments,
    Type? extends_,
    List<Type>? with_,
  }) {
    if (abstract) {
      write('abstract ');
    }

    write('class ');
    writeDartType(type);

    if (typeArguments != null && typeArguments.isNotEmpty) {
      write('<');
      typeArguments.entries.toList().forEachIndexed((index, entry) {
        if (index > 0) {
          write(', ');
        }
        writeDartType(entry.key);
        if (entry.value != null) {
          write(' extends ');
          writeDartType(entry.value!);
        }
      });
      write('>');
    }

    if (extends_ != null) {
      write(' extends ');
      writeDartType(extends_);
    }

    if (with_ != null && with_.isNotEmpty) {
      write(' with ');
      with_.forEachIndexed((index, element) {
        if (index > 0) {
          write(', ');
        }
        writeDartType(element);
      });
    }

    writeln(' {');
  }

  @protected
  void writeConstructor({
    required Type type,
    String? name,
    ParameterList parameters = const ParameterList(),
    Map<String, String?>? initializers,
    bool super_ = false,
    String? superName,
    ArgumentList? superArguments,
    WriteCodeCallback? body,
  }) {
    final hasInitializers = initializers?.isNotEmpty ?? false;

    writeDartType(type);

    if (name != null) {
      write('.');
      write(name);
    }

    writeParameterList(parameters);

    if (hasInitializers || super_) {
      writeln(' : ');
    }

    initializers?.entries.toList().forEachIndexed((index, element) {
      write(element.key);
      write(' = ');
      writeln(element.value);

      if (index < initializers.length - 1) {
        writeln(', ');
      }
    });

    if (hasInitializers && super_) {
      writeln(', ');
    }

    if (super_) {
      write('super');
      if (superName != null) {
        write('.');
        write(superName);
      }
      writeArgumentList(superArguments ?? const ArgumentList());
    }

    if (body != null) {
      writeFunctionBody(body: body);
    } else {
      writeln(';');
    }
  }

  @protected
  void finishClass() {
    writeln('}');
  }

  @protected
  void writeField({
    required String name,
    required Type type,
    String? initializer,
    bool late_ = false,
    bool final_ = false,
  }) {
    if (late_) {
      write('late ');
    }
    if (final_) {
      write('final ');
    }

    writeDartType(type);
    write(' ');

    write(name);

    if (initializer != null) {
      write(' = ');
      write(initializer);
    }

    writeln(';');
  }

  @protected
  void writeGetter({
    required String name,
    required Type type,
    required WriteCodeCallback body,
    FunctionBodyType bodyType = FunctionBodyType.block,
  }) {
    writeDartType(type);
    write(' get ');
    write(name);
    writeFunctionBody(body: body, bodyType: bodyType);
  }

  @protected
  void writeSetter({
    required String name,
    required Type type,
    required WriteCodeCallback body,
    FunctionBodyType bodyType = FunctionBodyType.block,
  }) {
    write('set ');
    write(name);
    writeParameterList(
      ParameterList(
        parameters: [Parameter(name: 'value', type: type)],
        trailingComma: false,
      ),
    );
    writeFunctionBody(body: body, bodyType: bodyType);
  }

  @protected
  void writeFunction({
    bool static = false,
    bool operator = false,
    required String name,
    required Type returnType,
    ParameterList parameters = const ParameterList(),
    WriteCodeCallback? body,
    FunctionBodyType bodyType = FunctionBodyType.block,
  }) {
    if (static) {
      write('static ');
    }

    writeDartType(returnType);
    if (operator) {
      write(' operator');
    }

    write(' ');
    write(name);

    writeParameterList(parameters);

    if (body != null) {
      writeFunctionBody(body: body, bodyType: bodyType);
    } else {
      // Abstract functions don't have a body.
      writeln(';');
    }
  }

  @protected
  void writeParameterList(ParameterList parameterList) {
    write('(');

    parameterList.parameters.forEachIndexed((index, parameter) {
      if (index > 0) {
        write(', ');
      }
      if (parameter.propertyInitializer) {
        write('this.');
      } else {
        writeDartType(parameter.type!);
        write(' ');
      }
      write(parameter.name);
    });

    if (parameterList.parameters.isNotEmpty &&
        (parameterList.optionalParameters.isNotEmpty ||
            parameterList.trailingComma)) {
      write(', ');
    }

    if (parameterList.optionalParameters.isNotEmpty) {
      write(parameterList.namedOptionalParameters ? '{' : '[');
      parameterList.optionalParameters.forEachIndexed((index, parameter) {
        if (index > 0) {
          write(', ');
        }
        if (parameter.required) {
          write('required ');
        }
        if (parameter.propertyInitializer) {
          write('this.');
        } else {
          writeDartType(parameter.type!);
          write(' ');
        }
        write(parameter.name);
      });
      if (parameterList.trailingComma) {
        write(', ');
      }
      write(parameterList.namedOptionalParameters ? '}' : ']');
    }

    write(')');
  }

  @protected
  void writeArgumentList(ArgumentList argumentList) {
    write('(');

    argumentList.arguments.forEachIndexed((index, element) {
      if (index > 0) {
        write(', ');
      }
      write(element);
    });

    if (argumentList.arguments.isNotEmpty &&
        (argumentList.namedArguments.isNotEmpty ||
            argumentList.trailingComma)) {
      write(', ');
    }

    if (argumentList.namedArguments.isNotEmpty) {
      argumentList.namedArguments.entries.forEachIndexed((index, argument) {
        if (index > 0) {
          write(', ');
        }
        write(argument.key);
        write(': ');
        write(argument.value);
      });

      if (argumentList.trailingComma) {
        write(', ');
      }
    }

    write(')');
  }

  @protected
  void writeFunctionBody({
    required WriteCodeCallback body,
    FunctionBodyType bodyType = FunctionBodyType.block,
  }) {
    switch (bodyType) {
      case FunctionBodyType.block:
        writeln(' {');
        body();
        writeln('}');
        break;
      case FunctionBodyType.expression:
        write(' => ');
        body();
        writeln(';');
        break;
    }
  }

  @protected
  void writeLiteral(Object? value) {
    if (value == null) {
      write('null');
    } else if (value is String) {
      write("'");
      write(value.replaceAll("'", r"\'").replaceAll(r'$', r'\$'));
      write("'");
    } else if (value is num) {
      write(value);
    } else {
      throw UnimplementedError(
        'Unimplemented literal value: $value',
      );
    }
  }
}

class ParameterList {
  const ParameterList({
    this.parameters = const [],
    this.optionalParameters = const [],
    this.namedOptionalParameters = false,
    this.trailingComma = true,
  });

  final List<Parameter> parameters;
  final List<Parameter> optionalParameters;
  final bool namedOptionalParameters;
  final bool trailingComma;
}

class Parameter {
  Parameter({
    required this.name,
    required this.type,
    this.required = false,
    this.propertyInitializer = false,
  });

  final String name;
  final Type? type;
  final bool required;
  final bool propertyInitializer;
}

class ArgumentList {
  const ArgumentList({
    this.arguments = const [],
    this.namedArguments = const {},
    this.trailingComma = true,
  });

  final List<String> arguments;
  final Map<String, String> namedArguments;
  final bool trailingComma;
}

class DartFileGenerator extends CodeGenerator {
  DartFileGenerator({
    this.ignoredLints = const [],
    this.partOf,
    required this.generateTopLevelDeclarations,
  });

  static Future<void> generateFile({
    required CodeGenContext context,
    required DartFileGenerator generator,
    required String filePath,
  }) async {
    final writeBuffer = StringBuffer();
    context.use(writeBuffer, generator.generate);
    await File(filePath).writeAsString(writeBuffer.toString());
    await _formatDartFile(filePath);
  }

  final List<String> ignoredLints;
  final String? partOf;
  final Iterable<void> Function(
    CodeGenContext context,
    StringBuffer writeBuffer,
  ) generateTopLevelDeclarations;

  void generate() {
    writeln('// DO NOT EDIT - This is a generated file.');

    if (ignoredLints.isNotEmpty) {
      writeln();
      for (final lint in ignoredLints) {
        write('// ignore_for_file: ');
        writeln(lint);
      }
    }

    if (partOf != null) {
      writeln();
      write("part of '");
      write(partOf);
      writeln("';");
    }

    writeln();

    final it = generateTopLevelDeclarations(context, writeBuffer).iterator;
    while (it.moveNext()) {
      writeln();
    }
  }
}

Future<void> _formatDartFile(String filePath) async {
  final result = await Process.run('dart', ['format', filePath]);
  if (result.exitCode != 0) {
    throw StateError(
      'Failed to format file "$filePath":\n'
      '${result.stdout}\n'
      '${result.stderr}',
    );
  }
}

abstract class DartTypeProvider {
  String call(Type type);
}

extension DartTypeProviderContextExt on CodeGenContext {
  DartTypeProvider get dartTypeProvider => getOneOfType();
}

typedef DartTypeResolver = String? Function(
  Type type,
  DartTypeProvider getDartType,
);

class DartTypeResolverProvider implements DartTypeProvider {
  DartTypeResolverProvider(this.resolvers);

  final List<DartTypeResolver> resolvers;

  @override
  String call(Type type) {
    for (final resolver in resolvers) {
      final result = resolver(type, this);
      if (result != null) {
        return result;
      }
    }
    throw ArgumentError('Unable to resolve type $type');
  }
}

String? defaultDartTypeResolver(Type type, DartTypeProvider getDartType) {
  if (type == voidType) {
    return 'void';
  }
  if (type is NullableType) {
    return '${getDartType(type.type)}?';
  }
  if (type is TypeParameter) {
    return type.name;
  }
  if (type is ParameterizedType) {
    final buffer = StringBuffer();
    buffer.write(getDartType(type.type));
    buffer.write('<');
    type.typeArguments.forEachIndexed((index, typeArgument) {
      if (index > 0) {
        buffer.write(', ');
      }
      buffer.write(getDartType(typeArgument));
    });
    buffer.write('>');
    return buffer.toString();
  }
}
