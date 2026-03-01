# openapi_gen

[![pub version](https://img.shields.io/pub/v/openapi_gen?logo=dart)](https://pub.dev/packages/openapi_gen)
[![style: lints](https://img.shields.io/badge/style-lints-brightgreen?logo=dart)](https://pub.dev/packages/lints)

Dart package that generates REST clients and data classes from OpenAPI definition files or URLs.

> This project is a fork of [swagger_parser](https://github.com/Carapacik/swagger_parser) by [@Carapacik](https://github.com/Carapacik). Many thanks to the original author for the excellent work.

## Features

- Supports OpenAPI v2, v3.0 and v3.1
- Supports JSON and YAML schema formats
- Supports generation from a local file or a remote URL
- Supports multiple schemas in a single config
- Generates REST clients using **[gio](https://pub.dev/packages/gio)** (default) or **[dio](https://pub.dev/packages/dio)** — configurable via `http_client`
- Generates data classes using one of:
  - [json_serializable](https://pub.dev/packages/json_serializable)
  - [freezed](https://pub.dev/packages/freezed)
  - [dart_mappable](https://pub.dev/packages/dart_mappable)

---

## Usage

### Install

```yaml
dependencies:
  gio: ^0.2.2                    # default HTTP client
  # dio: ^5.9.0                  # alternative — set http_client: dio
  json_annotation: ^4.9.0        # for json_serializable (default)
  # freezed_annotation: ^3.1.0  # for freezed
  # dart_mappable: ^4.6.1       # for dart_mappable

dev_dependencies:
  openapi_gen:
  build_runner: ^2.10.4
  json_serializable: ^6.11.2
  # freezed: ^3.2.3
  # dart_mappable_builder: ^4.6.1
```

---

### Configure

Create an `openapi_gen.yaml` in your project root, or add an `openapi_gen:` section to `pubspec.yaml`.

#### Minimal example

```yaml
openapi_gen:
  schema_path: lib/api/openapi.json
  output_directory: lib/api
```

#### Remote schema

```yaml
openapi_gen:
  schema_url: https://petstore.swagger.io/v2/swagger.json
  output_directory: lib/api
```

#### Multiple schemas

```yaml
openapi_gen:
  output_directory: lib/api
  schemes:
    - schema_path: schemas/users.json
      name: users
      json_serializer: freezed
      put_in_folder: true
    - schema_url: https://api.example.com/openapi.yaml
      name: products
      json_serializer: dart_mappable
      http_client: dio
      put_in_folder: true
```

#### Full config reference

```yaml
openapi_gen:
  schema_path: lib/api/openapi.json   # or schema_url:
  output_directory: lib/api
  name: my_api                        # defaults to schema filename
  json_serializer: json_serializable  # json_serializable | freezed | dart_mappable
  http_client: gio                    # gio | dio
  root_client: true
  root_client_name: RestClient
  export_file: true
  put_clients_in_folder: false
  client_postfix: Client
  path_method_name: false
  default_content_type: "application/json"
  enums_to_json: false
  unknown_enum_value: true
  enums_parent_prefix: true
  mark_files_as_generated: true
  merge_clients: false
  replacement_rules:
    - pattern: "[0-9]+"
      replacement: ""
  skipped_parameters:
    - X-Trace-Id
  exclude_paths:         # blacklist — wildcards: * one segment, ** any depth
    - /api/v1/files/**
  include_paths:         # whitelist — takes priority over exclude_paths
    - /api/v1/**
```

---

### Run the generator

```shell
dart run openapi_gen
```

If you named your config file differently, pass it explicitly:

```shell
dart run openapi_gen -f path/to/my_config.yaml
```

Useful CLI overrides (bypass the config file for one-off runs):

```shell
dart run openapi_gen --schema_path lib/api/openapi.json --output_directory lib/api
dart run openapi_gen --schema_url https://petstore.swagger.io/v2/swagger.json
```

---

### Run build_runner (for freezed / json_serializable / dart_mappable)

After generating the client and model files, run `build_runner` to produce the
`.g.dart` / `.freezed.dart` part files:

```shell
dart run build_runner build -d
```

For `freezed` with `json_serializable`, create a `build.yaml` in your project root:

```yaml
global_options:
  freezed:
    runs_before:
      - json_serializable
```

---

## Generated code examples

### gio client (default)

```dart
class PetClient {
  PetClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<Pet> getPetById({required int petId}) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/pet/$petId',
    );
    return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }
}
```

### dio client (`http_client: dio`)

```dart
class PetClient {
  PetClient(Dio dio, {String? baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  Future<Pet> getPetById({required int petId}) async {
    final response = await _dio.get(
      '${_baseUrl ?? ''}/pet/$petId',
    );
    return Pet.fromJson(response.data as Map<String, dynamic>);
  }
}
```

---
