// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/family1.dart';
import '../models/family2.dart';

/// FamilyClient
class FamilyClient {
  /// Creates a [FamilyClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  FamilyClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get family 1 (with discriminator)
  Future<Family1> getFamily1() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/family1',
    );
    return Family1.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Get family 2 (without discriminator)
  Future<Family2> getFamily2() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/family2',
    );
    return Family2.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
