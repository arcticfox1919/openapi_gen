// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/new_pet_dto.dart';
import '../models/pet_dto.dart';

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

  /// Returns all pets from the system that the user has access to.
  ///
  /// [tags] - tags to filter by.
  ///
  /// [limit] - maximum number of results to return.
  Future<List<PetDto>> findPets({
    List<String>? tags,
    int? limit,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pets',
      queryParameters: {
        if (tags != null) 'tags': tags,
        if (limit != null) 'limit': limit,
      },
    );
    return (jsonDecode(response.body) as List)
        .map((e) => PetDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Creates a new pet in the store.  Duplicates are allowed.
  ///
  /// [pet] - PetDto to add to the store.
  Future<PetDto> addPet({
    required NewPetDto pet,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/pets',
      jsonBody: pet.toJson(),
    );
    return PetDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Returns a user based on a single ID, if the user does not have access to the pet.
  ///
  /// [id] - ID of pet to fetch.
  Future<PetDto> findPetById({
    required int id,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pets/${id}',
    );
    return PetDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// deletes a single pet based on the ID supplied.
  ///
  /// [id] - ID of pet to delete.
  Future<void> deletePet({
    required int id,
  }) async {
    await _gio.delete(
      '${_baseUrl ?? ''}/pets/${id}',
    );
  }
}
