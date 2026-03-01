## 1.1.0

- Fix: `dart_gio_client_template` — URL argument is now written on its own line,
  preventing extra leading whitespace in generated client methods
- Fix: `parseDataClasses` — skip typedef generation when a component schema name
  collides with a Dart built-in type (`String`, `int`, `double`, `num`, `bool`,
  `dynamic`, `Object`), preventing `typedef String = String` from shadowing the
  built-in and breaking downstream compilation

## 1.0.0

Initial stable release.

- OpenAPI v2 / v3.0 / v3.1 — JSON and YAML, local file or remote URL
- HTTP client: **gio** (default) or **dio**
- Data classes: **json_serializable** (default), **freezed**, or **dart_mappable**
- Path filtering via `include_paths` / `exclude_paths` (supports `*` / `**` wildcards)
- Tag filtering, parameter exclusion, enum helpers, name replacement rules
- Optional root aggregator client and export barrel file
