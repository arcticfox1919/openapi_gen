// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

/// ClientClient
class ClientClient {
  /// Creates a [ClientClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClientClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> apiV1CategoryList() async {
    await _gio.get(
      '${_baseUrl ?? ''}/api/v1/tagged-as-client/',
    );
  }
}
