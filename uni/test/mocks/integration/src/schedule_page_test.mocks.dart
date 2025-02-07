// Mocks generated by Mockito 5.4.3-wip from annotations
// in uni/test/integration/src/schedule_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:convert' as _i5;
import 'dart:typed_data' as _i6;
import 'dart:ui' as _i11;

import 'package:flutter/material.dart' as _i10;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:uni/model/entities/profile.dart' as _i9;
import 'package:uni/model/entities/session.dart' as _i3;
import 'package:uni/model/providers/startup/session_provider.dart' as _i7;
import 'package:uni/model/request_status.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_1 extends _i1.SmartFake
    implements _i2.StreamedResponse {
  _FakeStreamedResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSession_2 extends _i1.SmartFake implements _i3.Session {
  _FakeSession_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i2.Client {
  @override
  _i4.Future<_i2.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i5.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<String>.value(''),
        returnValueForMissingStub: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<_i6.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i6.Uint8List>.value(_i6.Uint8List(0)),
        returnValueForMissingStub:
            _i4.Future<_i6.Uint8List>.value(_i6.Uint8List(0)),
      ) as _i4.Future<_i6.Uint8List>);
  @override
  _i4.Future<_i2.StreamedResponse> send(_i2.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i4.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i4.Future<_i2.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Response].
///
/// See the documentation for Mockito's code generation for more information.
class MockResponse extends _i1.Mock implements _i2.Response {
  @override
  _i6.Uint8List get bodyBytes => (super.noSuchMethod(
        Invocation.getter(#bodyBytes),
        returnValue: _i6.Uint8List(0),
        returnValueForMissingStub: _i6.Uint8List(0),
      ) as _i6.Uint8List);
  @override
  String get body => (super.noSuchMethod(
        Invocation.getter(#body),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  int get statusCode => (super.noSuchMethod(
        Invocation.getter(#statusCode),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  Map<String, String> get headers => (super.noSuchMethod(
        Invocation.getter(#headers),
        returnValue: <String, String>{},
        returnValueForMissingStub: <String, String>{},
      ) as Map<String, String>);
  @override
  bool get isRedirect => (super.noSuchMethod(
        Invocation.getter(#isRedirect),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get persistentConnection => (super.noSuchMethod(
        Invocation.getter(#persistentConnection),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [SessionProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockSessionProvider extends _i1.Mock implements _i7.SessionProvider {
  @override
  _i3.Session get session => (super.noSuchMethod(
        Invocation.getter(#session),
        returnValue: _FakeSession_2(
          this,
          Invocation.getter(#session),
        ),
        returnValueForMissingStub: _FakeSession_2(
          this,
          Invocation.getter(#session),
        ),
      ) as _i3.Session);
  @override
  bool get dependsOnSession => (super.noSuchMethod(
        Invocation.getter(#dependsOnSession),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set dependsOnSession(bool? _dependsOnSession) => super.noSuchMethod(
        Invocation.setter(
          #dependsOnSession,
          _dependsOnSession,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set cacheDuration(Duration? _cacheDuration) => super.noSuchMethod(
        Invocation.setter(
          #cacheDuration,
          _cacheDuration,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i8.RequestStatus get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i8.RequestStatus.none,
        returnValueForMissingStub: _i8.RequestStatus.none,
      ) as _i8.RequestStatus);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.Future<void> loadFromStorage() => (super.noSuchMethod(
        Invocation.method(
          #loadFromStorage,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> loadFromRemote(
    _i3.Session? session,
    _i9.Profile? profile,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadFromRemote,
          [
            session,
            profile,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void restoreSession(
    String? username,
    String? password,
    List<String>? faculties,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #restoreSession,
          [
            username,
            password,
            faculties,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> postAuthentication(
    _i10.BuildContext? context,
    String? username,
    String? password,
    List<String>? faculties, {
    required bool? persistentSession,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postAuthentication,
          [
            context,
            username,
            password,
            faculties,
          ],
          {#persistentSession: persistentSession},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void markAsNotInitialized() => super.noSuchMethod(
        Invocation.method(
          #markAsNotInitialized,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void updateStatus(_i8.RequestStatus? status) => super.noSuchMethod(
        Invocation.method(
          #updateStatus,
          [status],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> forceRefresh(_i10.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #forceRefresh,
          [context],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> ensureInitialized(_i10.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #ensureInitialized,
          [context],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> ensureInitializedFromRemote(_i10.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #ensureInitializedFromRemote,
          [context],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> ensureInitializedFromStorage() => (super.noSuchMethod(
        Invocation.method(
          #ensureInitializedFromStorage,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
