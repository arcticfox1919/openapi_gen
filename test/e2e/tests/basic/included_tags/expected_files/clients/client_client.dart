// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/api_v1_tagged_as_include_should_be_included_request_body.dart';
import '../models/get_api_v1_tagged_as_include_should_be_included_response.dart';

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

  Future<GetApiV1TaggedAsIncludeShouldBeIncludedResponse> apiV1CategoryList({
    required ApiV1TaggedAsIncludeShouldBeIncludedRequestBody body,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/tagged-as-include-should-be-included/',
      jsonBody: body.toJson(),
    );
    return GetApiV1TaggedAsIncludeShouldBeIncludedResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
