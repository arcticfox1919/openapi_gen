import 'package:openapi_gen/src/generator/model/programming_language.dart';
import 'package:openapi_gen/src/parser/model/normalized_identifier.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';
import 'package:openapi_gen/src/utils/base_utils.dart';
import 'package:openapi_gen/src/utils/type_utils.dart';
// ignore_for_file: cascade_invocations

/// OpenAPI primitive type names — these map to Dart built-ins that have no
/// `.fromJson()` factory and therefore need a direct cast instead.
const _openApiPrimitives = {
  'integer',
  'number',
  'string',
  'boolean',
  'object',
  'null',
  'file',
};

bool _isPrimitive(String openApiType) =>
    _openApiPrimitives.contains(openApiType.toLowerCase());

/// Generates a Dart dio-style REST client.
///
/// The produced class uses `Dio` method calls directly (no annotation-based code
/// generation).  Constructor accepts a `Dio` instance and an optional base URL
/// so the caller can configure interceptors, auth headers, etc. at the call
/// site.
///
/// Example of generated code:
/// ```dart
/// class AuthClient {
///   AuthClient(Dio dio, {String? baseUrl})
///       : _dio = dio,
///         _baseUrl = baseUrl;
///
///   final Dio _dio;
///   final String? _baseUrl;
///
///   Future<TokenPair> login({required LoginRequest body}) async {
///     final response = await _dio.post(
///       '${_baseUrl ?? ''}/api/v1/auth/login',
///       data: body.toJson(),
///     );
///     return TokenPair.fromJson(response.data as Map<String, dynamic>);
///   }
/// }
/// ```
String dartDioClientTemplate({
  required UniversalRestClient restClient,
  required String name,
  required String defaultContentType,
  required bool useMultipartFile,
  required bool generateUrlsConstants,
  String? fileName,
}) {
  final parameterTypes = restClient.requests
      .expand((r) => r.parameters.map((p) => p.type))
      .toSet();

  final sb = StringBuffer();

  // dart:io / MultipartFile import when File parameters are present.
  final ioImp = ioImport(parameterTypes, useMultipartFile: useMultipartFile);
  if (ioImp.isNotEmpty) {
    sb.write(ioImp);
  }

  sb.writeln("import 'package:dio/dio.dart';");

  final modelImports =
      dartImports(imports: restClient.imports, pathPrefix: '../models/');
  if (modelImports.isNotEmpty) {
    sb.write(modelImports);
  }

  sb.write('''

/// $name
class $name {
  /// Creates a [$name] using the provided [dio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Dio] instance for this client only.
  $name(Dio dio, {String? baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;
''');

  for (final request in restClient.requests) {
    sb.writeln();
    sb.write(_buildMethod(request, useMultipartFile: useMultipartFile));
  }

  sb.writeln('}');

  if (generateUrlsConstants) {
    final constants = restClient.requests
        .map((r) =>
            "  /// `${r.route}`\n  static const ${r.name.toCamel} = '${r.route}';")
        .join('\n');
    sb.write('''

/// URL constants for [$name].
abstract class ${name}Urls {
$constants
}
''');
  }

  return sb.toString();
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

/// Builds a single async method for [request].
String _buildMethod(
  UniversalRequest request, {
  required bool useMultipartFile,
}) {
  final sb = StringBuffer();

  // Description comment (indented).
  if (request.description != null && request.description!.isNotEmpty) {
    sb.write(descriptionComment(request.description, tab: '  '));
  }

  if (request.isDeprecated) {
    sb.writeln("  @Deprecated('This method is marked as deprecated.')");
  }

  // Classify parameters.
  final pathParams = request.parameters
      .where((p) => p.parameterType == HttpParameterType.path)
      .toList();
  final queryParams = request.parameters
      .where((p) => p.parameterType == HttpParameterType.query)
      .toList();
  final headerParams = request.parameters
      .where((p) => p.parameterType == HttpParameterType.header)
      .toList();
  final bodyParams =
      request.parameters.where((p) => p.parameterType.isBody).toList();

  // Return type.
  final returnDart = request.returnType == null
      ? 'void'
      : request.returnType!.toSuitableType(
          ProgrammingLanguage.dart,
          useMultipartFile: useMultipartFile,
        );
  final returnsVoid = returnDart == 'void';

  // Method signature.
  final params = request.parameters;
  if (params.isEmpty) {
    sb.writeln('  Future<$returnDart> ${request.name}() async {');
  } else {
    final paramStr = params
        .map((p) => _paramDeclaration(p, useMultipartFile: useMultipartFile))
        .join();
    sb.writeln(
        '  Future<$returnDart> ${request.name}({$paramStr\n  }) async {');
  }

  // URL with path parameter substitution.
  var route = request.route;
  for (final pp in pathParams) {
    route = route.replaceAll('{${pp.name}}', '\${${_dartName(pp)}}');
  }

  final method = request.requestType.name.toLowerCase();
  final callPrefix = returnsVoid
      ? '    await _dio.$method('
      : '    final response = await _dio.$method(';
  sb.writeln("$callPrefix      '\${_baseUrl ?? ''}$route',");

  // Body.
  if (bodyParams.isNotEmpty) {
    final b = bodyParams.first;
    final bDart = b.type.toSuitableType(
      ProgrammingLanguage.dart,
      useMultipartFile: useMultipartFile,
    );
    final bVarName = _dartName(b);
    final isPrim = _isPrimitive(b.type.type) || bDart.startsWith('Map<');
    sb.writeln(
        isPrim ? '      data: $bVarName,' : '      data: $bVarName.toJson(),');
  }

  // Query parameters.
  if (queryParams.isNotEmpty) {
    final entries = queryParams.map((q) {
      final varName = _dartName(q);
      return q.type.isRequired
          ? "        '${q.name}': $varName,"
          : "        if ($varName != null) '${q.name}': $varName,";
    }).join('\n');
    sb.write('      queryParameters: {\n$entries\n      },\n');
  }

  // Headers via Options.
  if (headerParams.isNotEmpty) {
    final entries = headerParams.map((h) {
      final varName = _dartName(h);
      return h.type.isRequired
          ? "          '${h.name}': $varName,"
          : "          if ($varName != null) '${h.name}': $varName!,";
    }).join('\n');
    sb.write(
        '      options: Options(\n        headers: {\n$entries\n        },\n      ),\n');
  }

  sb.writeln('    );');

  // Return / decode.
  if (!returnsVoid) {
    sb.writeln(
      '    return ${_decodeResponse(request.returnType!, returnDart)};',
    );
  }

  sb.writeln('  }');
  return sb.toString();
}

/// Builds a single named parameter declaration, e.g. `\n    required String id,`
String _paramDeclaration(
  UniversalRequestType p, {
  required bool useMultipartFile,
}) {
  final dartType = p.type.toSuitableType(
    ProgrammingLanguage.dart,
    useMultipartFile: useMultipartFile,
  );
  final varName = _dartName(p);
  final isRequired = p.type.isRequired && p.type.defaultValue == null;
  final requiredKeyword = isRequired ? 'required ' : '';
  final defaultVal = !p.type.isRequired && p.type.defaultValue != null
      ? ' = ${p.type.defaultValue}'
      : '';
  final deprecatedNote = p.deprecated
      ? '\n    // ignore: deprecated_member_use_from_same_package\n'
      : '';
  return '$deprecatedNote\n    $requiredKeyword$dartType $varName$defaultVal,';
}

/// Derives a safe Dart camelCase identifier from the parameter name,
/// falling back to `body` for anonymous body params.
String _dartName(UniversalRequestType parameter) =>
    (parameter.type.name ?? 'body').toCamel;

/// Generates the expression that decodes `response.data` into [dartType].
/// Dio automatically decodes JSON, so no `jsonDecode` call is needed.
String _decodeResponse(UniversalType returnType, String dartType) {
  final isList = returnType.wrappingCollections.any(
    (c) =>
        c == UniversalCollections.list ||
        c == UniversalCollections.listNullableItem ||
        c == UniversalCollections.nullableList ||
        c == UniversalCollections.nullableListNullableItem,
  );

  final isMap = returnType.wrappingCollections.any(
    (c) =>
        c == UniversalCollections.map ||
        c == UniversalCollections.mapNullableValue ||
        c == UniversalCollections.nullableMap ||
        c == UniversalCollections.nullableMapNullableValue,
  );

  final prim = _isPrimitive(returnType.type);

  if (isList) {
    if (prim) {
      return '(response.data as List).cast<${_singleItemDartType(returnType)}>()';
    } else {
      final cls = returnType.type.toPascal;
      return '(response.data as List)\n'
          '        .map((e) => $cls.fromJson(e as Map<String, dynamic>))\n'
          '        .toList()';
    }
  }

  if (isMap) {
    return 'response.data as Map<String, dynamic>';
  }

  if (prim) {
    return 'response.data as $dartType';
  }

  // Custom class.
  final cls = returnType.type.toPascal;
  return '$cls.fromJson(response.data as Map<String, dynamic>)';
}

/// Returns the Dart type for a single list item (strips List wrapper).
String _singleItemDartType(UniversalType t) {
  final raw = UniversalType(
    type: t.type,
    isRequired: t.isRequired,
    name: t.name,
    format: t.format,
    nullable: t.nullable,
    enumType: t.enumType,
  );
  return raw
      .toSuitableType(ProgrammingLanguage.dart, useMultipartFile: false)
      .replaceAll('?', '');
}
