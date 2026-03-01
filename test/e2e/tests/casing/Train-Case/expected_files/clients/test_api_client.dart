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
        'Is-Not-On-Blocklist': isNotOnBlocklist,
        'Http-Method': httpMethod,
        'Api-Key': apiKey,
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
      '${_baseUrl ?? ''}/api/v2/Http2-Protocol',
      queryParameters: {
        'Oauth2-Token': oauth2Token,
        'Xml-Data': xmlData,
        'Html5-Parser': html5Parser,
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
      '${_baseUrl ?? ''}/api/V1-Api-Endpoint',
      queryParameters: {
        'Xml2json-Converter': xml2jsonConverter,
        'Api-2-V3-Endpoint': api2V3Endpoint,
        'Sql-Db-Connection': sqlDbConnection,
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
      '${_baseUrl ?? ''}/api/Https-Connection',
      queryParameters: {
        'Xml-Http-Request': xmlHttpRequest,
        'Jwt-Auth-Token': jwtAuthToken,
        'Json-Api-Response': jsonApiResponse,
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
      '${_baseUrl ?? ''}/api/Uuid-V4-Generator',
      queryParameters: {
        'A-B-C': aBc,
        'X-Y-Z': xYz,
        'Io-Operation': ioOperation,
        'Ui-Component': uiComponent,
        'Id-Field': idField,
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
      '${_baseUrl ?? ''}/api/Oauth2-Jwt-Token',
      queryParameters: {
        'Css-Html5-Renderer': cssHtml5Renderer,
        'Api-V2-Https-Endpoint': apiV2HttpsEndpoint,
        'Xml2json-V3-Parser': xml2jsonV3Parser,
      },
    );
    return ComplexCasingModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
