import 'package:openapi_gen/src/config/config_processor.dart';
import 'package:openapi_gen/src/config/swp_config.dart';
import 'package:openapi_gen/src/generator/generator/generator.dart';
import 'package:openapi_gen/src/generator/model/generated_file.dart';
import 'package:openapi_gen/src/generator/model/generation_statistic.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';

/// Handles whole cycle of generation.
/// Can be provided with arguments
/// to specify custom path to yaml config.
class GenProcessor {
  /// Applies parameters directly from constructor
  /// and sets them to default if not found
  const GenProcessor(this.config);

  /// Config
  final SWPConfig config;

  /// Generates files based on OpenApi definition file
  Future<(OpenApiInfo, GenerationStatistic)> generateFiles() async {
    resetUniqueNameCounters();

    const configProcessor = ConfigProcessor();
    final (fileContent, isJson) = await configProcessor.fileContent(config);
    final parserConfig = config.toParserConfig(
      fileContent: fileContent,
      isJson: isJson,
    );

    final parser = OpenApiParser(parserConfig);
    final generatorConfig = config.toGeneratorConfig();
    final info = parser.openApiInfo;
    final restClients = parser.parseRestClients();
    final dataClasses = parser.parseDataClasses();
    final generator = Generator(
      generatorConfig,
      info: info,
      dataClasses: dataClasses,
      restClients: restClients,
    );

    return generator.generateFiles();
  }

  /// Generates content of files based on OpenApi definition file
  /// and return list of [GeneratedFile]
  Future<List<GeneratedFile>> generateContent(
    ({String fileContent, bool isJson}) configParameters,
  ) async {
    resetUniqueNameCounters();

    final parserConfig = config.toParserConfig(
      fileContent: configParameters.fileContent,
      isJson: configParameters.isJson,
    );
    final parser = OpenApiParser(parserConfig);

    final generatorConfig = config.toGeneratorConfig();
    final info = parser.openApiInfo;
    final restClients = parser.parseRestClients();
    final dataClasses = parser.parseDataClasses();
    final generator = Generator(
      generatorConfig,
      info: info,
      dataClasses: dataClasses,
      restClients: restClients,
    );
    return generator.generateContent();
  }
}
