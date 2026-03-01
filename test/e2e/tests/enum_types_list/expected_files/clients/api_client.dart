// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import '../models/credential_types.dart';
import '../models/enum_class.dart';
import '../models/enum_class_dynamic.dart';
import '../models/nullable_enum_in_object.dart';

/// ApiClient
class ApiClient {
  /// Creates a [ApiClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ApiClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// [enumClass] - description.
  ///
  /// [enumClassDynamic] - description.
  ///
  /// [credentialTypes] - description.
  Future<void> apiV1CategoryList({
    required List<EnumClass?> enumClass,
    required List<EnumClassDynamic> enumClassDynamic,
    required NullableEnumInObject nullableEnumInObject,
    List<CredentialTypes>? credentialTypes = [apple],
  }) async {
    await _gio.get(
      '${_baseUrl ?? ''}/api/v1/category/',
      queryParameters: {
        'enum_class': enumClass,
        'enum_class_dynamic': enumClassDynamic,
        'nullable_enum_in_object': nullableEnumInObject,
        if (credentialTypes != null) 'credentialTypes': credentialTypes,
      },
    );
  }
}
