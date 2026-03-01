// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/pets_client.dart';
import 'clients/fallback_client.dart';

/// Pet Store API with Excluded Tags `v1.0.0`
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  PetsClient? _pets;
  FallbackClient? _fallback;

  PetsClient get pets => _pets ??= PetsClient(_gio, baseUrl: _baseUrl);

  FallbackClient get fallback =>
      _fallback ??= FallbackClient(_gio, baseUrl: _baseUrl);
}
