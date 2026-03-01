// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

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

  /// Test.
  ///
  /// Test.
  ///
  /// [files] - Sample List of Files.
  ///
  /// [address] - Sample Address.
  /// Name not received and was auto-generated.
  ///
  /// [image] - Sample Image.
  Future<void> testMultipartRequiredTrue({
    required List<File> files,
    Object0? address,
    required String? name,
    File? image,
  }) async {
    await _gio.get(
      '${_baseUrl ?? ''}/test-multipart-required-true',
    );
  }

  /// [address] - Name not received and was auto-generated.
  Future<void> testMultipartRequiredFalse({
    required List<File> files,
    Object1? address,
    required String? name,
    File? image,
  }) async {
    await _gio.get(
      '${_baseUrl ?? ''}/test-multipart-required-false',
    );
  }
}
