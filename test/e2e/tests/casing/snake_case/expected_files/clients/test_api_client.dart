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
        'is_not_on_blocklist': isNotOnBlocklist,
        'http_method': httpMethod,
        'api_key': apiKey,
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
      '${_baseUrl ?? ''}/api/v2/http2_protocol',
      queryParameters: {
        'oauth2_token': oauth2Token,
        'xml_data': xmlData,
        'html5_parser': html5Parser,
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
      '${_baseUrl ?? ''}/api/v1_api_endpoint',
      queryParameters: {
        'xml2json_converter': xml2jsonConverter,
        'api_2_v3_endpoint': api2V3Endpoint,
        'sql_db_connection': sqlDbConnection,
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
      '${_baseUrl ?? ''}/api/https_connection',
      queryParameters: {
        'xml_http_request': xmlHttpRequest,
        'jwt_auth_token': jwtAuthToken,
        'json_api_response': jsonApiResponse,
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
      '${_baseUrl ?? ''}/api/uuid_v4_generator',
      queryParameters: {
        'a_b_c': aBc,
        'x_y_z': xYz,
        'io_operation': ioOperation,
        'ui_component': uiComponent,
        'id_field': idField,
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
      '${_baseUrl ?? ''}/api/oauth2_jwt_token',
      queryParameters: {
        'css_html5_renderer': cssHtml5Renderer,
        'api_v2_https_endpoint': apiV2HttpsEndpoint,
        'xml2json_v3_parser': xml2jsonV3Parser,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
