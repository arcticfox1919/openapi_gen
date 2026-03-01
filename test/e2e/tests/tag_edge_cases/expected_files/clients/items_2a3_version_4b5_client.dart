// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/item.dart';

/// Items2a3Version4b5Client
class Items2a3Version4b5Client {
  /// Creates a [Items2a3Version4b5Client] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  Items2a3Version4b5Client(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get items with multiple version markers
  Future<List<Item>> getMultiVersionItems() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/items/multi-version',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
