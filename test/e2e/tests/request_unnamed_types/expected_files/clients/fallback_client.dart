// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/get_test2_response.dart';
import '../models/test1_request_body.dart';
import '../models/test2_request_body.dart';

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

  Future<dynamic> test({
    required Test1RequestBody body,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/test1',
      jsonBody: body.toJson(),
    );
    return jsonDecode(response.body) as dynamic;
  }

  Future<GetTest2Response> test({
    Test2RequestBody? body,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/test2',
      jsonBody: body.toJson(),
    );
    return GetTest2Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
