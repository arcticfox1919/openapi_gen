// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/api_request_body_dto.dart';
import '../models/class_name1_dto.dart';
import '../models/class_name2_dto.dart';
import '../models/class_name3_dto.dart';
import '../models/class_name56_dto.dart';
import '../models/class_name5_dto.dart';
import '../models/data1_att_dto.dart';
import '../models/data_att2_dto.dart';
import '../models/data_att4_dto.dart';
import '../models/enum0_dto.dart';
import '../models/object0_dto.dart';
import '../models/private_att_data3_dto.dart';
import '../models/private_class_name4_dto.dart';

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

  /// [p1Class] - Name not received and was auto-generated.
  ///
  /// [p2Enum] - Name not received and was auto-generated.
  Future<String> getApiV1({
    required ClassName1Dto p1,
    ClassName2Dto? p2,
    required ClassName3Dto p3,
    PrivateClassName4Dto? p4,
    required ClassName5Dto p5,
    ClassName56Dto? p6,
    required Data1AttDto v1,
    DataAtt2Dto? v2,
    required PrivateAttData3Dto v3,
    DataAtt4Dto? v4,
    Object0Dto? p1Class,
    Enum0Dto? p2Enum,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/api/v1/',
    );
    return jsonDecode(response.body) as String;
  }

  Future<String> postApiV1({
    ApiRequestBodyDto? body,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/api/v1/',
      jsonBody: body.toJson(),
    );
    return jsonDecode(response.body) as String;
  }
}
