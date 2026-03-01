// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/mobile_device.dart';

/// DevicesClient
class DevicesClient {
  /// Creates a [DevicesClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  DevicesClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get a mobile device
  Future<MobileDevice> getMobileDevice() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/devices',
    );
    return MobileDevice.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
