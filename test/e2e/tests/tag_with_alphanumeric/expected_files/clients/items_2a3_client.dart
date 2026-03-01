// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/item.dart';

/// Items2a3Client
class Items2a3Client {
  /// Creates a [Items2a3Client] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  Items2a3Client(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get all items
  Future<List<Item>> getItems() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/items/list',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
