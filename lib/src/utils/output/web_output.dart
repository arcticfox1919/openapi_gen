// ignore_for_file: avoid_print
import 'package:args/args.dart';
import 'package:openapi_gen/src/generator/model/generation_statistic.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';
import 'package:openapi_gen/src/utils/base_utils.dart';

void introMessage() {
  print(r'''

┃  ____ ___  ____ __ _ ____ ___  _      ____ ____ __ _
┃  |  | |__] |___ | \| |__| |__] |      | __ |___ | \|
┃  |__| |    |___ |  | |  | |    |_ ___ |__] |___ |  |
┃
''');
}

void printHelpMessage(ArgParser parser) {}

void generateMessage() {
  print('Generate...');
}

void successMessage({
  required int successSchemasCount,
  required int schemesCount,
}) {
  if (successSchemasCount == 0) {
    print(
      'The generation was completed with errors.\n'
      'No schemes were generated.',
    );
  } else if (successSchemasCount != schemesCount) {
    print(
      'The generation was completed with errors.\n'
      '${schemesCount - successSchemasCount} schemes were not generated.',
    );
  } else {
    print(
      'The generation was completed successfully. '
      'You can run the generation using build_runner.',
    );
  }
}

void successExtractMessage() {
  print('The extraction was completed successfully.');
}

void schemaStatisticsMessage({
  required OpenApiInfo openApi,
  required GenerationStatistic statistics,
  String? name,
}) {
  final version = openApi.apiVersion != null ? 'v${openApi.apiVersion}' : '';

  var title = name ?? '';
  if (title.length > 80) {
    title = '${title.substring(0, 80)}...';
  }

  print(
    '> $title $version: \n'
    '    ${formatNumber(statistics.totalRestClients)} rest clients, '
    '${formatNumber(statistics.totalRequests)} requests, '
    '${formatNumber(statistics.totalDataClasses)} data classes.\n'
    '    ${formatNumber(statistics.totalFiles)} files with ${formatNumber(statistics.totalLines)} lines of code.\n'
    '    Success (${statistics.timeElapsed.inMilliseconds / 1000} seconds)\n',
  );
}

void summaryStatisticsMessage({
  required int successCount,
  required int schemesCount,
  required GenerationStatistic statistics,
}) {
  print(
    'Summary (${statistics.timeElapsed.inMilliseconds / 1000} seconds):\n'
    '${successCount != schemesCount ? '$successCount/$schemesCount' : '$schemesCount'} schemes, '
    '${formatNumber(statistics.totalRestClients)} clients, '
    '${formatNumber(statistics.totalRequests)} requests, '
    '${formatNumber(statistics.totalDataClasses)} data classes.\n'
    '${formatNumber(statistics.totalFiles)} files with ${formatNumber(statistics.totalLines)} lines of code.\n',
  );
}

void schemaFailedMessage(Object error, StackTrace stack, {String? name}) {
  var title = name ?? '';
  if (title.length > 80) {
    title = '${title.substring(0, 80)}...';
  }

  print(
    '> $title: \n'
    '    Failed to generate files.\n'
    '    $error\n'
    '    ${stack.toString().replaceAll('\n', '\n    ')}\n',
  );
}

void exitWithError(String message) {
  print('ERROR: $message');
}
