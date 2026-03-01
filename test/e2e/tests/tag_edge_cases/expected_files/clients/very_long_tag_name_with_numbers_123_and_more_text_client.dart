// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/long_tag_response.dart';

/// VeryLongTagNameWithNumbers123AndMoreTextClient
class VeryLongTagNameWithNumbers123AndMoreTextClient {
  /// Creates a [VeryLongTagNameWithNumbers123AndMoreTextClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  VeryLongTagNameWithNumbers123AndMoreTextClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Operation with very long tag
  Future<LongTagResponse> getLongTagData() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/very/long/path',
    );
    return LongTagResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
