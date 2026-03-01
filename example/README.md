# openapi_gen — Example

This example demonstrates how to use `openapi_gen` to generate Dart REST clients
and data classes from an OpenAPI schema.

## Files

| File | Description |
|---|---|
| `schemes/openapi.json` | Sample OpenAPI 3.0 schema (Petstore) |
| `openapi_gen.yaml` | Generator configuration |
| `build.yaml` | `build_runner` builder ordering configuration |
| `lib/api/` | Generated output (REST clients + models) |

## Quick Start

### 1. Add dependencies

```yaml
# pubspec.yaml
dependencies:
  gio: ^0.2.2             # or dio: ^5.0.0 if using http_client: dio
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.6.0
  json_serializable: ^6.10.0
  openapi_gen: ^1.42.0
```

### 2. Configure the generator

Create `openapi_gen.yaml` in your project root:

```yaml
openapi_gen:
  schema_path: schemes/openapi.json   # local file, or use schema_url:
  output_directory: lib/api
  http_client: gio                    # gio (default) or dio
  json_serializer: json_serializable  # json_serializable | freezed | dart_mappable
```

### 3. Run the generator

```shell
dart run openapi_gen
```

### 4. Run `build_runner` (for json_serializable / freezed / dart_mappable)

```shell
dart run build_runner build --delete-conflicting-outputs
```

Clients and models are now ready to use in `lib/api/`.

---

## Generated output structure

```
lib/api/
├── export.dart             # single-import barrel file
├── rest_client.dart        # root client interface (if root_client: true)
├── fallback/
│   └── fallback_client.dart   # endpoints without tags
└── models/
    ├── pet.dart
    ├── new_pet.dart
    └── error.dart
```

## Usage example

```dart
import 'package:gio/gio.dart';
import 'lib/api/export.dart';

void main() async {
  final gio = Gio.withOption(GioOption(basePath: 'https://petstore.example.com'));
  final client = FallbackClient(gio);

  // GET /pets
  final pets = await client.findPets(tags: ['cat'], limit: 5);

  // POST /pets
  final created = await client.addPet(body: NewPet(name: 'Whiskers'));

  // DELETE /pets/{id}
  await client.deletePet(id: created.id);

  gio.close();
}
```

---

## Path filtering

If your schema contains endpoints you do not need (e.g. file upload/download),
use `exclude_paths` to skip them without modifying the schema:

```yaml
openapi_gen:
  schema_path: schemes/openapi.json
  output_directory: lib/api
  exclude_paths:
    - /files/**
    - /upload/*
```

Or use `include_paths` to allow-list only the paths you care about:

```yaml
openapi_gen:
  schema_path: schemes/openapi.json
  output_directory: lib/api
  include_paths:
    - /pets/**
    - /users/**
```

Both patterns support `*` (one path segment) and `**` (any depth).
