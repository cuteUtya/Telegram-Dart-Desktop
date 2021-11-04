import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:isolate';

import "src/td_json_client.dart" show JsonClient;
import "src/tdapi/tdapi.dart";

/// A controller that handles incoming requests asynchronously and exposes
/// [Observable]s that stream data to their listeners.
class TelegramClient {
  final BehaviorSubject<Update> _updates = BehaviorSubject();

  /// All [Update] objects received by the client are put into a
  /// [BehaviorSubject] whose [Stream] is exposed to other parts of the
  /// application. This way updates can be listened to, filtered, mapped, and
  /// Flutter widgets can rebuild in response to them with a StreamBuilder.
  Stream<Update> get updates => _updates.stream;

  /// A convenience getter that streams [AuthorizationState]s. It does this by
  /// filtering for [updates] that are [UpdateAuthorizationState]s and yields
  /// the new authorization state.
  Stream<AuthorizationState> get authorizationState => updates
      .where((u) => u is UpdateAuthorizationState)
      .map((a) => (a as UpdateAuthorizationState).authorizationState!);

  late TdlibParameters tdlibParams;

  Future<void> init() async {
    Completer completer = Completer<void>();
    _receivePort = await initIsolate();
    //not null, promise
    _receivePort!.listen((message) {
      if (message is String) {
        var tdobject = convertToObject(message);
        if (tdobject is Update) {
          _updates.add(tdobject);
        } else {
          _requestsQueue[0](tdobject);
          _requestsQueue.removeAt(0);
        }
      } else if (message is SendPort) {
        _sendPort = message;
        completer.complete();
      }
    });
    return completer.future;
  }

  ReceivePort? _receivePort;
  SendPort? _sendPort;
  final List<Function(TdObject)> _requestsQueue = [];

  Future<ReceivePort> initIsolate() async {
    Completer completer = Completer<SendPort>();
    ReceivePort isolateToMainStream = ReceivePort();
    Isolate myIsolateInstance =
        await Isolate.spawn(_start, isolateToMainStream.sendPort);
    return isolateToMainStream;
  }

  /// Asynchronously performs any necessary cleanup before [destroy]ing this
  /// client.
  Future<void> close() async {
    //TODO implement close
  }

  Future<TdObject> send(TdFunction function) async {
    if (_sendPort == null) throw Exception("firstly init client using init()");
    _sendPort!.send(json.encode(function));
    final Completer<TdObject> _completer = Completer<TdObject>();
    _requestsQueue.add(_completer.complete);
    return _completer.future;
  }

  /// Defines this client's [tdlibParams] by taking keyword-arguments (some of
  /// which have defaults) that represent the fields of [TdlibParameters].
  void defineTdlibParams({
    required int apiId,
    required String apiHash,
    bool useMessageDatabase = true,
    String databaseDirectory = 'tdb',
    String systemLanguageCode = 'en-US', // TODO: l10n
    required String deviceModel,
    required String systemVersion,
    String applicationVersion = '0.0.1',
    bool enableStorageOptimizer = true,
    bool useSecretChats = true,
    bool useChatInfoDatabase = true,
    bool useFileDatabase = true,
    String filesDirectory = "/tgFiles/",
    bool ignoreFileNames = false,
    bool useTestDc = false,
  }) {
    tdlibParams = TdlibParameters(
      apiId: apiId,
      apiHash: apiHash,
      useMessageDatabase: useMessageDatabase,
      databaseDirectory: databaseDirectory,
      systemLanguageCode: systemLanguageCode,
      deviceModel: deviceModel,
      systemVersion: systemVersion,
      applicationVersion: applicationVersion,
      enableStorageOptimizer: enableStorageOptimizer,
      useSecretChats: useSecretChats,
      useChatInfoDatabase: useChatInfoDatabase,
      useFileDatabase: useFileDatabase,
      useTestDc: useTestDc,
      filesDirectory: filesDirectory,
      ignoreFileNames: ignoreFileNames,
    );
  }
}

void _start(SendPort isolateToMainStream) {
  //create a new port and send it to the main
  ReceivePort mainToIsolateStream = ReceivePort();
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  //listen Stream
  var client = JsonClient.create("Assets/bin/tdlib");
  //About this timeouts: Dart, as a language, has a problem - it is single-threaded,
  //and td_json_client_receive blocks the thread for the timeout period, so I run tdlib in isolate.
  //But these are not all problems, while td_json_client_receive is running I cannot listen for messages from SendPort.
  //Therefore, I wait for updates from tdlib 100ms and wait for messages from SendPort, also 100ms.
  //
  //Who will solve this problem - cool dude.
  client.incomingString(0.1).listen((update) {
    isolateToMainStream.send(update);
  });

  mainToIsolateStream.listen((data) {
    if (data is String) client.send(json.decode(data));
  });
}
