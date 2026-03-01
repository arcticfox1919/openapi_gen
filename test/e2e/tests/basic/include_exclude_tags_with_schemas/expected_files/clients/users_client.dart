// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/user.dart';

/// UsersClient
class UsersClient {
  /// Creates a [UsersClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  UsersClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<List<User>> getUsers() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/users',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
