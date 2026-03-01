// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/family.dart';

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

  /// Get a family
  Future<Family> getFamily() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/family',
    );
    return Family.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
