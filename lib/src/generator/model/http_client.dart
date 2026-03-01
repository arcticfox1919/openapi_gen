/// Enumerates the HTTP client packages supported for REST client code generation.
enum HttpClient {
  /// Generates clients that use the [gio](https://pub.dev/packages/gio) package.
  ///
  /// Methods call `_gio.get(url, ...)` directly.  The response body is
  /// decoded with `dart:convert`'s `jsonDecode`.
  gio,

  /// Generates clients that use the [dio](https://pub.dev/packages/dio) package.
  ///
  /// Methods call `_dio.get(url, ...)` directly.  Dio automatically decodes
  /// JSON responses, so `dart:convert` is not required.
  dio;

  /// Returns [HttpClient] from [value], case-sensitive.
  ///
  /// Throws [ArgumentError] if [value] is not a valid enum name.
  factory HttpClient.fromString(String value) => HttpClient.values.firstWhere(
        (e) => e.name == value,
        orElse: () => throw ArgumentError(
          "'$value' must be one of ${HttpClient.values.map((e) => e.name)}",
        ),
      );
}
