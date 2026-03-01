// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/debug_schema.dart';

/// IncludeClient
class IncludeClient {
  /// Creates a [IncludeClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  IncludeClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<DebugSchema> getDebug() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/debug',
    );
    return DebugSchema.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
