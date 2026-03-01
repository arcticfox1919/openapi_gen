// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/pet.dart';

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

  /// [offsetRequiredTrueWithDefault] - offsetRequiredTrueWithDefault
  Future<List<Pet>> findPets({
    int offsetRequiredTrueWithDefault,
    required int offsetRequiredTrueWithoutDefault,
    int? offsetRequiredFalseWithDefault = 0,
    int? offsetRequiredFalseWithoutDefault,
    int? offsetNoRequiredWithDefault = 0,
    int? offsetNoRequiredWithoutDefault,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pets',
      queryParameters: {
        'offsetRequiredTrueWithDefault': offsetRequiredTrueWithDefault,
        'offsetRequiredTrueWithoutDefault': offsetRequiredTrueWithoutDefault,
        if (offsetRequiredFalseWithDefault != null)
          'offsetRequiredFalseWithDefault': offsetRequiredFalseWithDefault,
        if (offsetRequiredFalseWithoutDefault != null)
          'offsetRequiredFalseWithoutDefault':
              offsetRequiredFalseWithoutDefault,
        if (offsetNoRequiredWithDefault != null)
          'offsetNoRequiredWithDefault': offsetNoRequiredWithDefault,
        if (offsetNoRequiredWithoutDefault != null)
          'offsetNoRequiredWithoutDefault': offsetNoRequiredWithoutDefault,
      },
    );
    return (jsonDecode(response.body) as List)
        .map((e) => Pet.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
