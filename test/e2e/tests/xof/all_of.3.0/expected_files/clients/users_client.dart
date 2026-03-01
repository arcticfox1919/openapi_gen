// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/get_users_response.dart';
import '../models/user_dto.dart';

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

  /// Get all users.
  ///
  /// [limit] - The number of items to return.
  ///
  /// [after] - The cursor to start the pagination from.
  ///
  /// [before] - The cursor to end the pagination to.
  Future<GetUsersResponse> getUsers({
    required num limit,
    String? after,
    String? before,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/users',
      queryParameters: {
        'limit': limit,
        if (after != null) 'after': after,
        if (before != null) 'before': before,
      },
    );
    return GetUsersResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Get a user by its id.
  ///
  /// [id] - The id of the user.
  Future<UserDto> getUserById({
    required String id,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/users/${id}',
    );
    return UserDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
