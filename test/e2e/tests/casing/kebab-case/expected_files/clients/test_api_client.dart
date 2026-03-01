// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/complex_casing_model.dart';

/// TestApiClient
class TestApiClient {
  /// Creates a [TestApiClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  TestApiClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<ComplexCasingModel> getUserById123({
    required String userId123,
    required bool isNotOnBlocklist,
    required String httpMethod,
    required String apiKey,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/users/${userId123}',
      queryParameters: {
        'is-not-on-blocklist': isNotOnBlocklist,
        'http-method': httpMethod,
        'api-key': apiKey,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<ComplexCasingModel> postHttp2Protocol({
    required String oauth2Token,
    required String xmlData,
    required String html5Parser,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/api/v2/http2-protocol',
      queryParameters: {
        'oauth2-token': oauth2Token,
        'xml-data': xmlData,
        'html5-parser': html5Parser,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<ComplexCasingModel> updateV1ApiEndpoint({
    required String xml2jsonConverter,
    required String api2V3Endpoint,
    required String sqlDbConnection,
  }) async {
    final response = await _gio.put(
      '${_baseUrl ?? ''}/api/v1-api-endpoint',
      queryParameters: {
        'xml2json-converter': xml2jsonConverter,
        'api-2-v3-endpoint': api2V3Endpoint,
        'sql-db-connection': sqlDbConnection,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> deleteHttpsConnection({
    required String xmlHttpRequest,
    required String jwtAuthToken,
    required String jsonApiResponse,
  }) async {
    await _gio.delete(
      '${_baseUrl ?? ''}/api/https-connection',
      queryParameters: {
        'xml-http-request': xmlHttpRequest,
        'jwt-auth-token': jwtAuthToken,
        'json-api-response': jsonApiResponse,
      },
    );
  }

  Future<ComplexCasingModel> getUuidV4Generator({
    required String aBc,
    required String xYz,
    required String ioOperation,
    required String uiComponent,
    required String idField,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/uuid-v4-generator',
      queryParameters: {
        'a-b-c': aBc,
        'x-y-z': xYz,
        'io-operation': ioOperation,
        'ui-component': uiComponent,
        'id-field': idField,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<ComplexCasingModel> postOauth2JwtToken({
    required String cssHtml5Renderer,
    required String apiV2HttpsEndpoint,
    required String xml2jsonV3Parser,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/api/oauth2-jwt-token',
      queryParameters: {
        'css-html5-renderer': cssHtml5Renderer,
        'api-v2-https-endpoint': apiV2HttpsEndpoint,
        'xml2json-v3-parser': xml2jsonV3Parser,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
