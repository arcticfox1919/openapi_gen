// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'dart:io';

import 'package:gio/gio.dart';

import '../models/user_info_dto.dart';

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

  Future<UserInfoDto> getApiUserInfo({
    int? limit,
    List<String>? tags,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/User/info',
      queryParameters: {
        if (limit != null) 'limit': limit,
        if (tags != null) 'tags': tags,
      },
    );
    return UserInfoDto.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> patchApiUserIdAvatar({
    int? id,
    File? avatar,
  }) async {
    await _gio.patch(
      '${_baseUrl ?? ''}/api/User/${id}/avatar',
    );
  }
}
