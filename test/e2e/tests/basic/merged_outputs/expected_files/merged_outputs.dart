// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gio/gio.dart';

part 'merged_outputs.freezed.dart';
part 'merged_outputs.g.dart';

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

@Freezed()
class RegisterUserDto with _$RegisterUserDto {
  const factory RegisterUserDto({
    required String email,
    required String name,
    required String password,
  }) = _RegisterUserDto;

  factory RegisterUserDto.fromJson(Map<String, Object?> json) =>
      _$RegisterUserDtoFromJson(json);
}

@Freezed()
class UserInfoDto with _$UserInfoDto {
  const factory UserInfoDto({
    required String email,
    required String name,
    required String phone,
  }) = _UserInfoDto;

  factory UserInfoDto.fromJson(Map<String, Object?> json) =>
      _$UserInfoDtoFromJson(json);
}

class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '';

  AuthClient? _auth;
  UserClient? _user;

  AuthClient get auth => _auth ??= AuthClient(_gio, baseUrl: _baseUrl);

  UserClient get user => _user ??= UserClient(_gio, baseUrl: _baseUrl);
}
