// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/user_dto.dart';

/// UserClient
class UserClient {
  /// Creates a [UserClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  UserClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<List<UserDto>> getUsers() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/users',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
