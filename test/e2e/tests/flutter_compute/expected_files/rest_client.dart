// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/task_client.dart';
import 'clients/user_client.dart';

/// Flutter Compute Test API `v1.0.0`
class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  TaskClient? _task;
  UserClient? _user;

  TaskClient get task => _task ??= TaskClient(_gio, baseUrl: _baseUrl);

  UserClient get user => _user ??= UserClient(_gio, baseUrl: _baseUrl);
}
