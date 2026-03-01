// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'dart:io';

import 'package:gio/gio.dart';

import '../models/object0.dart';
import '../models/object1.dart';

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

  /// create  item.
  ///
  /// [address] - Name not received and was auto-generated.
  Future<String> postMultipartRequestProps({
    required List<File> images,
    Object0? address,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/multipart/request/props',
    );
    return jsonDecode(response.body) as String;
  }

  /// create  item.
  ///
  /// [address] - Name not received and was auto-generated.
  Future<String> postMultipartRequestRef({
    required List<File> images,
    Object1? address,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/multipart/request/ref',
    );
    return jsonDecode(response.body) as String;
  }
}
