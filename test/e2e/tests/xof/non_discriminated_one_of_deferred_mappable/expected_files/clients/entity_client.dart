// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/cat_dog_human.dart';

/// EntityClient
class EntityClient {
  /// Creates a [EntityClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  EntityClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get an entity (returns top-level oneOf)
  Future<CatDogHuman> getEntity() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/entity',
    );
    return CatDogHuman.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
