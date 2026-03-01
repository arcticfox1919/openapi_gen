// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/pet_client.dart';

/// OpenAPI Petstore `v1.0.0`.
///
/// This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  PetClient? _pet;

  PetClient get pet => _pet ??= PetClient(_gio, baseUrl: _baseUrl);
}
