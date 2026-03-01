// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/include_client.dart';

/// Tag Filtering Nested Objects API `v1.0.0`.
///
/// Test case for reproducing GitHub issue.
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  IncludeClient? _include;

  IncludeClient get include =>
      _include ??= IncludeClient(_gio, baseUrl: _baseUrl);
}
