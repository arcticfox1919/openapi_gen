// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/register_user_dto.dart';

/// AuthClient
class AuthClient {
  /// Creates a [AuthClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  AuthClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String> postApiAuthRegister({
    RegisterUserDto? body,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/api/Auth/register',
      jsonBody: body.toJson(),
    );
    return jsonDecode(response.body) as String;
  }
}
