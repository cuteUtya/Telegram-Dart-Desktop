import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/tdlib/client.dart';

class StreamBuilderWrapper extends StatefulWidget {
  const StreamBuilderWrapper({
    Key? key,
    required this.stream,
    required this.builder,
    this.cleanupDataAfterBuild = false,
    this.initialData,
  }) : super(key: key);
  final StreamCallback stream;
  final dynamic initialData;
  final TAsyncWidgetBuilder builder;
  final bool cleanupDataAfterBuild;

  static void init(TelegramClient client) {
    _StreamBuilderWrapperState.client = client;
  }

  @override
  State<StatefulWidget> createState() => _StreamBuilderWrapperState();
}

class _StreamBuilderWrapperState
    extends StateWithStreamsSubscriptions<StreamBuilderWrapper> {
  StreamSubscription? streamSubs;
  late dynamic _data = widget.initialData;

  static late TelegramClient client;

  @override
  void initState() {
    var stream = widget.stream();
    if (stream != null) {
      subscribe(stream);
      streamSubscriptions.add(
        client.freeUpdates.listen(
          (event) {
            subscribe(widget.stream()!);
          },
        ),
      );
    }

    super.initState();
  }

  void subscribe(Stream stream) {
    streamSubs?.cancel();
    streamSubs = stream.listen((event) => setState(() => _data = event));
    streamSubscriptions.add(streamSubs!);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cleanupDataAfterBuild) {
      Future.delayed(Duration.zero, () => _data = null);
      return _build(_data);
    }
    return _build(_data);
  }

  Widget _build(dynamic data) =>
      widget.builder(
        context,
        TAsyncSnapshot(
          data: _data,
        ),
      ) ??
      const SizedBox();
}

class TAsyncSnapshot {
  const TAsyncSnapshot({
    required this.data,
  });

  bool get hasData => data != null;
  final dynamic data;
}

typedef TAsyncWidgetBuilder = Widget? Function(BuildContext, TAsyncSnapshot);
typedef StreamCallback = Stream<dynamic>? Function();
