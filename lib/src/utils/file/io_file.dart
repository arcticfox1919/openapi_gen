import 'dart:io';

import 'package:gio/gio.dart';
import 'package:openapi_gen/src/generator/model/generated_file.dart';
import 'package:path/path.dart' as p;

/// Checks if config exists at [filePath]
/// Config can be a file provided in arguments,
/// 'openapi_gen.yaml' as default config name
/// or pubspec.yaml containing config inside.
File? getConfigFile({String? filePath}) {
  if (filePath != null) {
    final configFile = File(p.join(_rootDirectoryPath, filePath));
    if (configFile.existsSync()) {
      return configFile;
    }
  }
  final configFile = File(p.join(_rootDirectoryPath, 'openapi_gen.yaml'));
  if (configFile.existsSync()) {
    return configFile;
  }

  final pubspecFile = File(p.join(_rootDirectoryPath, 'pubspec.yaml'));
  return pubspecFile.existsSync() ? pubspecFile : null;
}

/// Checks if schema file provided in config exists
File? schemaFile(String filePath) {
  final file = File(p.join(_rootDirectoryPath, filePath));
  return file.existsSync() ? file : null;
}

/// Fetches OpenAPI schema content from [url] using gio HTTP client.
///
/// Follows redirects automatically and accepts JSON and YAML responses.
/// Throws on non-2xx status codes.
Future<String> schemaFromUrl(String url) async {
  final client = Gio();
  try {
    final response = await client.get(
      url,
      headers: const {'Accept': 'application/json, application/yaml, */*'},
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        'Failed to fetch OpenAPI schema from $url '
        '(HTTP ${response.statusCode})',
      );
    }
    return response.body;
  } finally {
    client.close();
  }
}

///
void writeSchemaToFile(String schemaContent, String filePath) {
  File(p.join(_rootDirectoryPath, filePath)).writeAsStringSync(schemaContent);
}

/// Creates DTO file
Future<void> generateFile(
  String outputDirectory,
  GeneratedFile generatedFile,
) async {
  final file = File(p.join(outputDirectory, generatedFile.name));
  await file.create(recursive: true);
  await file.writeAsString(generatedFile.content);
}

///
String get _rootDirectoryPath => Directory.current.path;
