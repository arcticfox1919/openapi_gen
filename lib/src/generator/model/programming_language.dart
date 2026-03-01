import 'package:openapi_gen/src/generator/model/field_parser.dart';
import 'package:openapi_gen/src/generator/model/generated_file.dart';
import 'package:openapi_gen/src/generator/model/http_client.dart';
import 'package:openapi_gen/src/generator/model/json_serializer.dart';
import 'package:openapi_gen/src/generator/templates/dart_dart_mappable_dto_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_dio_client_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_enum_dto_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_export_file_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_freezed_dto_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_gio_client_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_json_serializable_dto_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_root_client_template.dart';
import 'package:openapi_gen/src/generator/templates/dart_typedef_template.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';

/// Enumerates supported programming languages to determine templates
enum ProgrammingLanguage {
  /// Dart language
  dart('dart');

  /// Constructor with [fileExtension] for every language
  const ProgrammingLanguage(this.fileExtension);

  /// Returns [ProgrammingLanguage] from string
  factory ProgrammingLanguage.fromString(
    String value,
  ) =>
      ProgrammingLanguage.values.firstWhere(
        (e) => e.name == value,
        orElse: () => throw ArgumentError(
          "'$value' must be contained in ${ProgrammingLanguage.values.map((e) => e.name)}",
        ),
      );

  /// Extension for generated files
  final String fileExtension;

  /// Determines template for generating DTOs by language
  String dtoFileContent(
    UniversalDataClass dataClass, {
    required JsonSerializer jsonSerializer,
    required bool enumsToJson,
    required bool unknownEnumValue,
    required bool markFilesAsGenerated,
    required bool generateValidator,
    required bool useFreezed3,
    required bool useMultipartFile,
    required bool dartMappableConvenientWhen,
    required bool includeIfNull,
    required List<FieldParser> fieldParsers,
    bool useFlutterCompute = false,
    String? fallbackUnion,
  }) {
    switch (this) {
      case dart:
        if (dataClass is UniversalEnumClass) {
          return dartEnumDtoTemplate(
            dataClass,
            jsonSerializer: jsonSerializer,
            enumsToJson: enumsToJson,
            unknownEnumValue: unknownEnumValue,
            markFileAsGenerated: markFilesAsGenerated,
            useFlutterCompute: useFlutterCompute,
          );
        } else if (dataClass is UniversalComponentClass) {
          if (dataClass.typeDef) {
            return dartTypeDefTemplate(dataClass,
                useMultipartFile: useMultipartFile);
          }
          return switch (jsonSerializer) {
            JsonSerializer.freezed => dartFreezedDtoTemplate(
                dataClass,
                generateValidator: generateValidator,
                isV3: useFreezed3,
                useMultipartFile: useMultipartFile,
                includeIfNull: includeIfNull,
                useFlutterCompute: useFlutterCompute,
                fallbackUnion: fallbackUnion,
              ),
            JsonSerializer.jsonSerializable => dartJsonSerializableDtoTemplate(
                dataClass,
                markFileAsGenerated: markFilesAsGenerated,
                useMultipartFile: useMultipartFile,
                fieldParsers: fieldParsers,
                includeIfNull: includeIfNull,
                useFlutterCompute: useFlutterCompute,
                fallbackUnion: fallbackUnion,
              ),
            JsonSerializer.dartMappable => dartDartMappableDtoTemplate(
                dataClass,
                markFileAsGenerated: markFilesAsGenerated,
                useMultipartFile: useMultipartFile,
                fallbackUnion: fallbackUnion,
                dartMappableConvenientWhen: dartMappableConvenientWhen,
                useFlutterCompute: useFlutterCompute,
              ),
          };
        }
    }
    throw ArgumentError('Unknown type exception');
  }

  /// Determines template for generating Rest client by language
  String restClientFileContent(
    UniversalRestClient restClient,
    String name, {
    required String defaultContentType,
    required bool useMultipartFile,
    required bool generateUrlsConstants,
    HttpClient httpClient = HttpClient.gio,
    String? fileName,
  }) =>
      switch (this) {
        dart => switch (httpClient) {
            HttpClient.gio => dartGioClientTemplate(
                restClient: restClient,
                name: name,
                defaultContentType: defaultContentType,
                useMultipartFile: useMultipartFile,
                generateUrlsConstants: generateUrlsConstants,
                fileName: fileName,
              ),
            HttpClient.dio => dartDioClientTemplate(
                restClient: restClient,
                name: name,
                defaultContentType: defaultContentType,
                useMultipartFile: useMultipartFile,
                generateUrlsConstants: generateUrlsConstants,
                fileName: fileName,
              ),
          },
      };

  /// Determines template for generating root client for clients
  String rootClientFileContent(
    Set<String> clientsNames, {
    required OpenApiInfo openApiInfo,
    required String name,
    required String postfix,
    required bool putClientsInFolder,
    required bool markFilesAsGenerated,
    Map<String, String>? clientsNameMap,
  }) =>
      switch (this) {
        dart => dartRootClientTemplate(
            openApiInfo: openApiInfo,
            name: name,
            clientsNames: clientsNames,
            postfix: postfix,
            putClientsInFolder: putClientsInFolder,
            markFileAsGenerated: markFilesAsGenerated,
            clientsNameMap: clientsNameMap,
          ),
      };

  /// Export file by language
  String exportFileContent({
    required List<GeneratedFile> restClients,
    required List<GeneratedFile> dataClasses,
    required GeneratedFile? rootClient,
  }) =>
      switch (this) {
        dart => dartExportFileTemplate(
            restClients: restClients,
            dataClasses: dataClasses,
            rootClient: rootClient,
          ),
      };
}
