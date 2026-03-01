// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/draft_item.dart';

/// ItemsDraftClient
class ItemsDraftClient {
  /// Creates a [ItemsDraftClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ItemsDraftClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Get draft items
  Future<List<DraftItem>> getDraftItems() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/items/draft',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => DraftItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
