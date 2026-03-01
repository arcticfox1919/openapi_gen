// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/pet.dart';
import '../models/status.dart';

/// PetClient
class PetClient {
  /// Creates a [PetClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  PetClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Add a new pet to the store.
  ///
  /// [body] - Pet object that needs to be added to the store.
  Future<void> addPet({
    required Pet body,
  }) async {
    await _gio.post(
      '${_baseUrl ?? ''}/pet',
      jsonBody: body.toJson(),
    );
  }

  /// Update an existing pet.
  ///
  /// [body] - Pet object that needs to be added to the store.
  Future<void> updatePet({
    required Pet body,
  }) async {
    await _gio.put(
      '${_baseUrl ?? ''}/pet',
      jsonBody: body.toJson(),
    );
  }

  /// Finds Pets by status.
  ///
  /// Multiple status values can be provided with comma separated strings.
  ///
  /// [status] - Status values that need to be considered for filter.
  Future<List<Pet>> findPetsByStatus({
    required List<Status> status,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pet/findByStatus',
      queryParameters: {
        'status': status,
      },
    );
    return (jsonDecode(response.body) as List)
        .map((e) => Pet.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Finds Pets by tags.
  ///
  /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
  ///
  /// [tags] - Tags to filter by.
  @Deprecated('This method is marked as deprecated.')
  Future<List<Pet>> findPetsByTags({
    required List<String> tags,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pet/findByTags',
      queryParameters: {
        'tags': tags,
      },
    );
    return (jsonDecode(response.body) as List)
        .map((e) => Pet.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Find pet by ID.
  ///
  /// Returns a single pet.
  ///
  /// [petId] - ID of pet to return.
  Future<Pet> getPetById({
    required int petId,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pet/${petId}',
    );
    return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Updates a pet in the store with form data.
  ///
  /// [petId] - ID of pet that needs to be updated.
  ///
  /// [name] - Updated name of the pet.
  ///
  /// [status] - Updated status of the pet.
  Future<void> updatePetWithForm({
    required int petId,
    String? name,
    String? status,
  }) async {
    await _gio.post(
      '${_baseUrl ?? ''}/pet/${petId}',
    );
  }

  /// Deletes a pet.
  ///
  /// [petId] - Pet id to delete.
  Future<void> deletePet({
    String? apiKey,
    required int petId,
  }) async {
    await _gio.delete(
      '${_baseUrl ?? ''}/pet/${petId}',
      headers: {
        if (apiKey != null) 'api_key': apiKey!,
      },
    );
  }
}
