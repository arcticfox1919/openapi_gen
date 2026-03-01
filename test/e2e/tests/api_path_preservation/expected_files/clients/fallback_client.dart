// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/get_api_v1_app_user_point_transactions_response.dart';
import '../models/user_point_balance.dart';

/// FallbackClient
class FallbackClient {
  /// Creates a [FallbackClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  FallbackClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get user point balance.
  ///
  /// This endpoint path should remain as /api/v1/app/user_point_balance (snake_case).
  /// even though the schema name is UserPointBalance (PascalCase).
  Future<UserPointBalance> getUserPointBalance() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/app/user_point_balance',
    );
    return UserPointBalance.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Get user point transactions.
  ///
  /// This endpoint path should remain as /api/v1/app/user_point_transactions (snake_case).
  /// even though the schema includes UserPointTransaction (PascalCase).
  Future<GetApiV1AppUserPointTransactionsResponse> getUserPointTransactions({
    int? limit = 20,
    String? cursor,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/app/user_point_transactions',
      queryParameters: {
        if (limit != null) 'limit': limit,
        if (cursor != null) 'cursor': cursor,
      },
    );
    return GetApiV1AppUserPointTransactionsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
