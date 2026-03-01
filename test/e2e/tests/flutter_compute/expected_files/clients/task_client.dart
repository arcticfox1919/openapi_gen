// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/task_dto.dart';

/// TaskClient
class TaskClient {
  /// Creates a [TaskClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  TaskClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<List<TaskDto>> getTasks() async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/tasks',
    );
    return (jsonDecode(response.body) as List)
        .map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<TaskDto> createTask({
    TaskDto? body,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/tasks',
      jsonBody: body.toJson(),
    );
    return TaskDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<TaskDto> getTask({
    required int id,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/tasks/${id}',
    );
    return TaskDto.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
