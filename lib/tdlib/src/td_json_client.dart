/// /lib/src/td_json_client.dart
///
/// C- and Dart-side typedefs for each of the functions in
/// td/telegram/td_json_client.h. The C versions are in snake_case and are
/// prefixed by "td_". In some cases the C and Dart typedefs have the same
/// signature; both are kept for the sake of consistency.
///
/// This file also exports a class [JsonClient], which wraps the td_json_client
/// functions in an interface that is safe, easy-to-use, and idiomatically Dart.

import "dart:convert";
import "dart:ffi";

import "package:ffi/ffi.dart";

import "utils.dart";

/// Creates a new instance of TDLib client.
///
/// void *td_json_client_create(void);
typedef Pointer<Void> td_json_client_create();
typedef Pointer<Void> JsonClientCreate();

/// Sends request to the TDLib client.
///
/// void td_json_client_send(void *client, const chat *request);
typedef Void td_json_client_send(Pointer<Void> client, Pointer<Utf8> request);
typedef void JsonClientSend(Pointer<Void> client, Pointer<Utf8> request);

/// Receives incoming updates and request responses from the TDLib client.
///
/// const char *td_json_client_receive(void *client, double timeout)
typedef Pointer<Utf8> td_json_client_receive(
    Pointer<Void> client, Double timeout);
typedef Pointer<Utf8> JsonClientReceive(Pointer<Void> client, double timeout);

/// Synchronously executes TDLib request.
///
/// const char *td_json_client_execute(void *client, const char* request);
typedef Pointer<Utf8> td_json_client_execute(
    Pointer<Void> client, Pointer<Utf8> request);
typedef Pointer<Utf8> JsonClientExecute(
    Pointer<Void> client, Pointer<Utf8> request);

/// Destroys the TDLib client instance.
///
/// void td_json_client_destroy(void *client);
typedef Void td_json_client_destroy(Pointer<Void> client);
typedef void JsonClientDestroy(Pointer<Void> client);

/// Represents a Telegram client that sends and receives JSON data.
class JsonClient {
  late Pointer<Void> _client;

  // If the client is inactive (if [destroy] has been called), further calls
  // to this class' methods will fail
  late bool active;

  // Private pointers to native functions, so they don't have to be looked up
  // for each API call
  late JsonClientCreate _jsonClientCreate;
  late JsonClientSend _jsonClientSend;
  late JsonClientReceive _jsonClientReceive;
  late JsonClientExecute _jsonClientExecute;
  late JsonClientDestroy _jsonClientDestroy;

  JsonClient.create(String dlDir) {
    // Get the path to the td_json_client dynamic library
    final dlPath = platformPath(dlDir);

    final dylib = DynamicLibrary.open(dlPath);

    // Get the td_json_client_create function from the dylib and create a client
    _jsonClientCreate =
        dylib.lookupFunction<td_json_client_create, JsonClientCreate>(
            "td_json_client_create");
    _jsonClientSend = dylib.lookupFunction<td_json_client_send, JsonClientSend>(
        "td_json_client_send");
    _jsonClientReceive =
        dylib.lookupFunction<td_json_client_receive, JsonClientReceive>(
            "td_json_client_receive");
    _jsonClientDestroy =
        dylib.lookupFunction<td_json_client_destroy, JsonClientDestroy>(
            "td_json_client_destroy");
    _jsonClientExecute =
        dylib.lookupFunction<td_json_client_execute, JsonClientExecute>(
            "td_json_client_execute");

    _client = _jsonClientCreate();
    active = true;
  }

  /// If the client is not [active] then this throws an [Exception].
  void _assertActive() {
    if (!active) {
      throw Exception("Telegram JSON client has been closed.");
    }
  }

  /// Send a request to the Telegram API
  /// This is an async version of [execute], which the TDLib docs don't make
  /// immediately clear :p
  void send(Map<String, dynamic> request) {
    _assertActive();
    var reqJson = json.encode(request);

    _jsonClientSend(_client, reqJson.toNativeUtf8());
  }

  /// Receive the API's response
  String? receive([double timeout = 2.0]) {
    _assertActive();
    final response = _jsonClientReceive(_client, timeout);

    //if timeout is riched _jsonClientReceive return NullPointer
    if (response == nullptr) return null;

    return response.toDartString();
  }

  /// Execute a TDLib function synchronously
  /// If you need to execute a function asynchronously (for example, you get an
  /// error along the lines of "Function can't be executed synchronously"), use
  /// [send] instead.
  Map<String, dynamic> execute(Map<String, dynamic> request) {
    _assertActive();
    final result =
        _jsonClientExecute(_client, json.encode(request).toNativeUtf8());

    var resJson = result.toDartString();
    return json.decode(resJson);
  }

  /// Destroy the client
  void destroy() {
    _assertActive();
    _jsonClientDestroy(_client);
    active = false;
  }

  Stream<String> incomingString([double timeout = 2.0]) async* {
    while (true) {
      bool haveUpdates = true;
      while (haveUpdates) {
        var str = await receiveString(timeout);
        if (str == null) {
          haveUpdates = false;
        } else {
          yield str;
        }
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<String?> receiveString([double timeout = 2.0]) async =>
      receive(timeout);
}
