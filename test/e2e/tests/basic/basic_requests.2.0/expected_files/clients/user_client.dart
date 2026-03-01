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

  /// [tags] - tags to filter by.
  ///
  /// [limit] - maximum number of results to return.
  Future<UserInfoDto> getApiUserInfo({
    List<String>? tags,
    int? limit,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/User/info',
      queryParameters: {
        if (tags != null) 'tags': tags,
        if (limit != null) 'limit': limit,
      },
    );
    return UserInfoDto.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> patchApiUserIdAvatar({
    File? avatar,
    int? id,
  }) async {
    await _gio.patch(
      '${_baseUrl ?? ''}/api/User/${id}/avatar',
    );
  }
}
