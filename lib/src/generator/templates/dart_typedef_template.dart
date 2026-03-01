import 'package:collection/collection.dart';
import 'package:openapi_gen/src/generator/model/programming_language.dart';
import 'package:openapi_gen/src/parser/model/normalized_identifier.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';
import 'package:openapi_gen/src/utils/base_utils.dart';
import 'package:openapi_gen/src/utils/type_utils.dart';

/// Provides template for generating dart typedefs using JSON serializable
String dartTypeDefTemplate(UniversalComponentClass dataClass,
    {required bool useMultipartFile}) {
  final className = dataClass.name.toPascal;
  final type = dataClass.parameters.firstOrNull;
  final import = dataClass.imports.firstOrNull;
  if (type == null) {
    return '';
  }

  // Check if the typedef uses MultipartFile
  final typeString = type.toSuitableType(
    ProgrammingLanguage.dart,
    useMultipartFile: useMultipartFile,
  );

  final needsMultipartImport =
      useMultipartFile && typeString.contains('MultipartFile');

  final needsFileImport =
      typeString.contains('File') && !typeString.contains('MultipartFile');

  final imports = StringBuffer();

  if (import != null) {
    imports
      ..write("import '${import.toSnake}.dart';\n")
      ..write("export '${import.toSnake}.dart';\n\n");
  }

  if (needsFileImport) {
    imports.write("import 'dart:io';\n\n");
  }

  if (needsMultipartImport) {
    imports.write("import 'package:dio/dio.dart';\n\n");
  }

  return '$imports'
      '${descriptionComment(dataClass.description)}'
      'typedef $className = $typeString;\n';
}
