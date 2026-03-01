import 'package:openapi_gen/src/generator/config/generator_config.dart';
import 'package:openapi_gen/src/generator/generator/fill_controller.dart';
import 'package:openapi_gen/src/parser/openapi_gen_core.dart';
import 'package:test/test.dart';

void main() {
  group('Empty rest client', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'Some',
        imports: {},
        requests: [],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// SomeClient
class SomeClient {
  /// Creates a [SomeClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  SomeClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Empty rest client with put clients in folder', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'Some',
        imports: {},
        requests: [],
      );
      const fillController = FillController(
        config: GeneratorConfig(
          name: '',
          outputDirectory: '',
          putClientsInFolder: true,
        ),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// SomeClient
class SomeClient {
  /// Creates a [SomeClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  SomeClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Client postfix', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [],
      );
      const fillController = FillController(
        config: GeneratorConfig(
          name: '',
          outputDirectory: '',
          clientPostfix: 'Api',
        ),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// ClassNameApi
class ClassNameApi {
  /// Creates a [ClassNameApi] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameApi(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Empty client postfix', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'Some',
        imports: {},
        requests: [],
      );
      const fillController = FillController(
        config: GeneratorConfig(
          name: '',
          outputDirectory: '',
          clientPostfix: '',
        ),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// Some
class Some {
  /// Creates a [Some] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  Some(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Imports', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {
          'camelClass',
          'snake_class',
          'kebab-class',
          'PascalClass',
          'Space class',
        },
        requests: [],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

import '../models/camel_class.dart';
import '../models/snake_class.dart';
import '../models/kebab_class.dart';
import '../models/pascal_class.dart';
import '../models/space_class.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('One empty request', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/',
            returnType: null,
            parameters: [],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> getRequest() async {
    await _gio.get(      '\${_baseUrl ?? ''}/',
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('All possible type of requests', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'postRequest',
            requestType: HttpRequestType.post,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'putRequest',
            requestType: HttpRequestType.put,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'headRequest',
            requestType: HttpRequestType.head,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'deleteRequest',
            requestType: HttpRequestType.delete,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'patchRequest',
            requestType: HttpRequestType.patch,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'connectRequest',
            requestType: HttpRequestType.connect,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'optionsRequest',
            requestType: HttpRequestType.options,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'traceRequest',
            requestType: HttpRequestType.trace,
            route: '/',
            returnType: null,
            parameters: [],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> getRequest() async {
    await _gio.get(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> postRequest() async {
    await _gio.post(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> putRequest() async {
    await _gio.put(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> headRequest() async {
    await _gio.head(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> deleteRequest() async {
    await _gio.delete(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> patchRequest() async {
    await _gio.patch(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> connectRequest() async {
    await _gio.connect(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> optionsRequest() async {
    await _gio.options(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<void> traceRequest() async {
    await _gio.trace(      '\${_baseUrl ?? ''}/',
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Returned type', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/',
            returnType: null,
            parameters: [],
          ),
          UniversalRequest(
            name: 'getStringRequest',
            requestType: HttpRequestType.get,
            route: '/string',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [],
          ),
          UniversalRequest(
            name: 'getBoolRequest',
            requestType: HttpRequestType.get,
            route: '/boolean',
            returnType: UniversalType(type: 'boolean', isRequired: true),
            parameters: [],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> getRequest() async {
    await _gio.get(      '\${_baseUrl ?? ''}/',
    );
  }

  Future<String> getStringRequest() async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/string',
    );
    return jsonDecode(response.body) as String;
  }

  Future<bool> getBoolRequest() async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/boolean',
    );
    return jsonDecode(response.body) as bool;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Array type', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/',
            returnType: null,
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [UniversalCollections.list],
                  name: 'list1',
                  isRequired: true,
                ),
                name: 'list1',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.body,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'list2',
                  isRequired: true,
                ),
              ),
            ],
          ),
          UniversalRequest(
            name: 'listOfList',
            requestType: HttpRequestType.get,
            route: '/list-of-list',
            returnType: UniversalType(
              type: 'string',
              wrappingCollections: [
                UniversalCollections.list,
                UniversalCollections.list,
              ],
              isRequired: true,
            ),
            parameters: [],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> getRequest({
    required List<String> list1,
    required List<List<List<String>>> list2,
  }) async {
    await _gio.get(      '\${_baseUrl ?? ''}/',
      jsonBody: list2,
      queryParameters: {
        'list1': list1,
      },
    );
  }

  Future<List<List<String>>> listOfList() async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/list-of-list',
    );
    return (jsonDecode(response.body) as List) .cast<String>();
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Single parameter', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'alex',
                  isRequired: true,
                ),
                name: 'name',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String> getRequest({
    required String alex,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/',
      queryParameters: {
        'name': alex,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('All request types of parameter except extras type', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/{id}',
            returnType: null,
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.header,
                type: UniversalType(
                  type: 'string',
                  name: 'token',
                  isRequired: true,
                ),
                name: 'Authorization',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'alex',
                  isRequired: true,
                ),
                name: 'name',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.path,
                type: UniversalType(type: 'int', name: 'id', isRequired: true),
                name: 'id',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.body,
                type: UniversalType(
                  type: 'Another',
                  name: 'another',
                  isRequired: true,
                ),
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> getRequest({
    required String token,
    required String alex,
    required int id,
    required Another another,
  }) async {
    await _gio.get(      '\${_baseUrl ?? ''}/\${id}',
      jsonBody: another.toJson(),
      headers: {
        'Authorization': token,
      },
      queryParameters: {
        'name': alex,
      },
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Multipart', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {'AnotherFile'},
        requests: [
          UniversalRequest(
            name: 'sendMultiPart',
            requestType: HttpRequestType.post,
            route: '/send',
            returnType: null,
            contentType: 'multipart/form-data',
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.header,
                type: UniversalType(
                  type: 'string',
                  name: 'token',
                  isRequired: true,
                ),
                name: 'Authorization',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'string',
                  name: 'alex',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'name',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'string',
                  format: 'binary',
                  name: 'file',
                  isRequired: true,
                ),
                name: 'file',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'file',
                  name: 'secondFile',
                  isRequired: true,
                ),
                name: 'file2',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'boolean',
                  name: 'parsed',
                  isRequired: true,
                ),
                name: 'parsed-if',
              ),
            ],
          ),
          UniversalRequest(
            name: 'singleEntity',
            requestType: HttpRequestType.post,
            route: '/single',
            returnType: UniversalType(type: 'boolean', isRequired: true),
            contentType: 'multipart/form-data',
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.body,
                type: UniversalType(
                  type: 'AnotherFile',
                  name: 'file',
                  isRequired: true,
                ),
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'dart:io';

import 'package:gio/gio.dart';

import '../models/another_file.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> sendMultiPart({
    required String token,
    String? alex,
    required File file,
    required File secondFile,
    required bool parsed,
  }) async {
    await _gio.post(      '\${_baseUrl ?? ''}/send',
      headers: {
        'Authorization': token,
      },
    );
  }

  Future<bool> singleEntity({
    required AnotherFile file,
  }) async {
    final response = await _gio.post(      '\${_baseUrl ?? ''}/single',
      jsonBody: file.toJson(),
    );
    return jsonDecode(response.body) as bool;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });

    test('dart with useMultipartFile = true', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {'AnotherFile'},
        requests: [
          UniversalRequest(
            name: 'sendMultiPart',
            requestType: HttpRequestType.post,
            route: '/send',
            returnType: null,
            contentType: 'multipart/form-data',
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.header,
                type: UniversalType(
                  type: 'string',
                  name: 'token',
                  isRequired: true,
                ),
                name: 'Authorization',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'string',
                  name: 'alex',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'name',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'string',
                  format: 'binary',
                  name: 'file',
                  isRequired: true,
                ),
                name: 'file',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'file',
                  name: 'secondFile',
                  isRequired: true,
                ),
                name: 'file2',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                    type: 'file',
                    name: 'aListOfFiles',
                    isRequired: true,
                    wrappingCollections: [UniversalCollections.list]),
                name: 'file2',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.part,
                type: UniversalType(
                  type: 'boolean',
                  name: 'parsed',
                  isRequired: true,
                ),
                name: 'parsed-if',
              ),
            ],
          ),
          UniversalRequest(
            name: 'singleEntity',
            requestType: HttpRequestType.post,
            route: '/single',
            returnType: UniversalType(type: 'boolean', isRequired: true),
            contentType: 'multipart/form-data',
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.body,
                type: UniversalType(
                  type: 'AnotherFile',
                  name: 'file',
                  isRequired: true,
                ),
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(
            name: '', outputDirectory: '', useMultipartFile: true),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/another_file.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> sendMultiPart({
    required String token,
    String? alex,
    required MultipartFile file,
    required MultipartFile secondFile,
    required List<MultipartFile> aListOfFiles,
    required bool parsed,
  }) async {
    await _gio.post(      '\${_baseUrl ?? ''}/send',
      headers: {
        'Authorization': token,
      },
    );
  }

  Future<bool> singleEntity({
    required AnotherFile file,
  }) async {
    final response = await _gio.post(      '\${_baseUrl ?? ''}/single',
      jsonBody: file.toJson(),
    );
    return jsonDecode(response.body) as bool;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('FormUrlEncoded', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {'Lol'},
        requests: [
          UniversalRequest(
            name: 'sendBody',
            requestType: HttpRequestType.post,
            route: '/send',
            returnType: null,
            contentType: 'application/x-www-form-urlencoded',
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.header,
                type: UniversalType(
                  type: 'string',
                  name: 'token',
                  isRequired: true,
                ),
                name: 'Authorization',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.body,
                type: UniversalType(type: 'Lol', name: 'lol', isRequired: true),
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

import '../models/lol.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> sendBody({
    required String token,
    required Lol lol,
  }) async {
    await _gio.post(      '\${_baseUrl ?? ''}/send',
      jsonBody: lol.toJson(),
      headers: {
        'Authorization': token,
      },
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Required parameters', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/{id}',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [UniversalCollections.nullableList],
                  name: 'list',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'list',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.path,
                type: UniversalType(
                  type: 'integer',
                  name: 'id',
                  isRequired: true,
                ),
                name: 'id',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'stringType',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'type',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String> getRequest({
    List<String>? list,
    required int id,
    String? stringType,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/\${id}',
      queryParameters: {
        if (list != null) 'list': list,
        if (stringType != null) 'type': stringType,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Default parameters', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {'Unit', 'Soma'},
        requests: [
          UniversalRequest(
            name: 'sendMessage',
            requestType: HttpRequestType.post,
            route: '/send',
            returnType: null,
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.header,
                type: UniversalType(
                  type: 'string',
                  name: 'token',
                  defaultValue: 'message123',
                  isRequired: true,
                ),
                name: 'Authorization',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'number',
                  format: 'double',
                  name: 'age',
                  defaultValue: '17',
                  isRequired: true,
                ),
                name: 'age',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'boolean',
                  name: 'adult',
                  defaultValue: 'false',
                  isRequired: true,
                ),
                name: 'adult',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'Unit',
                  name: 'unit',
                  defaultValue: 'CELSIUS',
                  enumType: 'string',
                  isRequired: true,
                ),
                name: 'unit',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'Soma',
                  name: 'soma',
                  defaultValue: '1',
                  enumType: 'int',
                  isRequired: true,
                ),
                name: 'soma',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

import '../models/unit.dart';
import '../models/soma.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<void> sendMessage({
    String token,
    double age,
    bool adult,
    Unit unit,
    Soma soma,
  }) async {
    await _gio.post(      '\${_baseUrl ?? ''}/send',
      headers: {
        'Authorization': token,
      },
      queryParameters: {
        'age': age,
        'adult': adult,
        'unit': unit,
        'soma': soma,
      },
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });

    test('Dart nullability of request parameters', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/request',
            returnType: UniversalType(
              type: 'string',
              nullable: true,
              isRequired: false,
            ),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'deepList',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
            ],
          ),
          UniversalRequest(
            name: 'getRequest2',
            requestType: HttpRequestType.get,
            route: '/request2',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.listNullableItem,
                  ],
                  name: 'deepList',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String?> getRequest({
    List<List<List<List<String>>>>? deepList,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request',
      queryParameters: {
        if (deepList != null) 'deepArrayNullable': deepList,
      },
    );
    return jsonDecode(response.body) as String?;
  }

  Future<String> getRequest2({
    List<List<List<List<String?>>>>? deepList,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request2',
      queryParameters: {
        if (deepList != null) 'deepArrayNullable': deepList,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });

    test('dart nullable parameters', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/request',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'list1',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list2',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'notRequiredButNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list3',
                  isRequired: true,
                ),
                name: 'requiredButNotNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list4',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'notRequiredAndNotNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list5',
                  isRequired: true,
                  nullable: true,
                ),
                name: 'RequiredAndNullable',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String> getRequest({
    List<List<List<List<String>>>>? list1,
    String? list2,
    required String list3,
    String? list4,
    required String? list5,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request',
      queryParameters: {
        if (list1 != null) 'deepArrayNullable': list1,
        if (list2 != null) 'notRequiredButNullable': list2,
        'requiredButNotNullable': list3,
        if (list4 != null) 'notRequiredAndNotNullable': list4,
        'RequiredAndNullable': list5,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });

  group('Description', () {
    test('dart', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {'Some'},
        requests: [
          UniversalRequest(
            name: 'some',
            requestType: HttpRequestType.get,
            route: '/some',
            description: 'Some description',
            returnType: null,
            parameters: [],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'package:gio/gio.dart';

import '../models/some.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// Some description
  Future<void> some() async {
    await _gio.get(      '\${_baseUrl ?? ''}/some',
    );
  }
}
''';
      expect(filledContent.content, expectedContents);
    });

    test('Dart nullability of request parameters', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/request',
            returnType: UniversalType(
              type: 'string',
              nullable: true,
              isRequired: true,
            ),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'deepList',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
            ],
          ),
          UniversalRequest(
            name: 'getRequest2',
            requestType: HttpRequestType.get,
            route: '/request2',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'deepList',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String?> getRequest({
    List<List<List<List<String>>>>? deepList,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request',
      queryParameters: {
        if (deepList != null) 'deepArrayNullable': deepList,
      },
    );
    return jsonDecode(response.body) as String?;
  }

  Future<String> getRequest2({
    List<List<List<List<String>>>>? deepList,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request2',
      queryParameters: {
        if (deepList != null) 'deepArrayNullable': deepList,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });

    test('dart nullable parameters', () async {
      const restClient = UniversalRestClient(
        name: 'ClassName',
        imports: {},
        requests: [
          UniversalRequest(
            name: 'getRequest',
            requestType: HttpRequestType.get,
            route: '/request',
            returnType: UniversalType(type: 'string', isRequired: true),
            parameters: [
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  wrappingCollections: [
                    UniversalCollections.nullableList,
                    UniversalCollections.list,
                    UniversalCollections.list,
                    UniversalCollections.list,
                  ],
                  name: 'list1',
                  isRequired: false,
                ),
                name: 'deepArrayNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list2',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'notRequiredButNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list3',
                  isRequired: true,
                ),
                name: 'requiredButNotNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list4',
                  isRequired: false,
                  nullable: true,
                ),
                name: 'notRequiredAndNotNullable',
              ),
              UniversalRequestType(
                parameterType: HttpParameterType.query,
                type: UniversalType(
                  type: 'string',
                  name: 'list5',
                  isRequired: true,
                  nullable: true,
                ),
                name: 'RequiredAndNullable',
              ),
            ],
          ),
        ],
      );
      const fillController = FillController(
        config: GeneratorConfig(name: '', outputDirectory: ''),
      );
      final filledContent = fillController.fillRestClientContent(restClient);
      const expectedContents = '''
import 'dart:convert';

import 'package:gio/gio.dart';

/// ClassNameClient
class ClassNameClient {
  /// Creates a [ClassNameClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ClassNameClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  Future<String> getRequest({
    List<List<List<List<String>>>>? list1,
    String? list2,
    required String list3,
    String? list4,
    required String? list5,
  }) async {
    final response = await _gio.get(      '\${_baseUrl ?? ''}/request',
      queryParameters: {
        if (list1 != null) 'deepArrayNullable': list1,
        if (list2 != null) 'notRequiredButNullable': list2,
        'requiredButNotNullable': list3,
        if (list4 != null) 'notRequiredAndNotNullable': list4,
        'RequiredAndNullable': list5,
      },
    );
    return jsonDecode(response.body) as String;
  }
}
''';
      expect(filledContent.content, expectedContents);
    });
  });
}
