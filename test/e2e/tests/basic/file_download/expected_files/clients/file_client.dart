// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

/// FileClient
class FileClient {
  /// Creates a [FileClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  FileClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Download a file
  Future<File> downloadFile({
    required String id,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/files/${id}',
    );
    return jsonDecode(response.body) as File;
  }
}
