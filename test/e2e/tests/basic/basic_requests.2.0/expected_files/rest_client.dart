// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:gio/gio.dart';

import 'clients/auth_client.dart';
import 'clients/user_client.dart';

class RestClient {
  RestClient(
    Gio gio, {
    String? baseUrl,
  })  : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  static String get version => '';

  AuthClient? _auth;
  UserClient? _user;

  AuthClient get auth => _auth ??= AuthClient(_gio, baseUrl: _baseUrl);

  UserClient get user => _user ??= UserClient(_gio, baseUrl: _baseUrl);
}
