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
        'IS-NOT-ON-BLOCKLIST': isNotOnBlocklist,
        'HTTP-METHOD': httpMethod,
        'API-KEY': apiKey,
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
      '${_baseUrl ?? ''}/api/v2/HTTP2-PROTOCOL',
      queryParameters: {
        'OAUTH2-TOKEN': oauth2Token,
        'XML-DATA': xmlData,
        'HTML5-PARSER': html5Parser,
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
      '${_baseUrl ?? ''}/api/V1-API-ENDPOINT',
      queryParameters: {
        'XML2JSON-CONVERTER': xml2jsonConverter,
        'API-2-V3-ENDPOINT': api2V3Endpoint,
        'SQL-DB-CONNECTION': sqlDbConnection,
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
      '${_baseUrl ?? ''}/api/HTTPS-CONNECTION',
      queryParameters: {
        'XML-HTTP-REQUEST': xmlHttpRequest,
        'JWT-AUTH-TOKEN': jwtAuthToken,
        'JSON-API-RESPONSE': jsonApiResponse,
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
      '${_baseUrl ?? ''}/api/UUID-V4-GENERATOR',
      queryParameters: {
        'A-B-C': aBc,
        'X-Y-Z': xYz,
        'IO-OPERATION': ioOperation,
        'UI-COMPONENT': uiComponent,
        'ID-FIELD': idField,
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
      '${_baseUrl ?? ''}/api/OAUTH2-JWT-TOKEN',
      queryParameters: {
        'CSS-HTML5-RENDERER': cssHtml5Renderer,
        'API-V2-HTTPS-ENDPOINT': apiV2HttpsEndpoint,
        'XML2JSON-V3-PARSER': xml2jsonV3Parser,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
