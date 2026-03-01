// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/get_api_v1_empty_tags_endpoint_response.dart';
import '../models/get_api_v1_no_tags_endpoint_response.dart';

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

  Future<GetApiV1NoTagsEndpointResponse> apiV1NoTags() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/no-tags-endpoint',
    );
    return GetApiV1NoTagsEndpointResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<GetApiV1EmptyTagsEndpointResponse> apiV1EmptyTags() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/empty-tags-endpoint',
    );
    return GetApiV1EmptyTagsEndpointResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
