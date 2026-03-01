// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/family_client.dart';
import 'clients/devices_client.dart';

/// Family API `v1.0.0`
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  FamilyClient? _family;
  DevicesClient? _devices;

  FamilyClient get family => _family ??= FamilyClient(_gio, baseUrl: _baseUrl);

  DevicesClient get devices =>
      _devices ??= DevicesClient(_gio, baseUrl: _baseUrl);
}
