// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/client_client.dart';

///  `v0.0.0 (v1)`
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '0.0.0 (v1)';

  ClientClient? _client;

  ClientClient get client => _client ??= ClientClient(_gio, baseUrl: _baseUrl);
}
