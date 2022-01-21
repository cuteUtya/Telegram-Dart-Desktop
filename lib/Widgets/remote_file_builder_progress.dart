import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class RemoteFileBuilderProgress extends StatefulWidget {
  const RemoteFileBuilderProgress(
      {Key? key,
      required this.client,
      required this.fileId,
      required this.builder,
      this.downloadPriority = 1})
      : super(key: key);

  final TelegramClient client;
  final int fileId;
  final Widget Function(BuildContext context, double progress, String? path)
      builder;
  final int downloadPriority;
  @override
  State<StatefulWidget> createState() => _RemoteFileBuilderProgressState();
}

class _RemoteFileBuilderProgressState extends State<RemoteFileBuilderProgress> {
  double progress = 0;
  String? path;

  StreamSubscription? _streamSubscription;

  void downloadFile() async {
    void processFile(File file) {
      if (mounted) {
        setState(() {
          progress = file.local!.downloadedPrefixSize! / file.expectedSize!;
          path = file.local!.isDownloadingCompleted! ? file.local!.path! : null;
        });
      }
    }

    var data = await widget.client.send(GetFile(fileId: widget.fileId)) as File;
    processFile(data);
    if (!data.local!.isDownloadingActive! &&
        !data.local!.isDownloadingCompleted!) {
      widget.client.send(DownloadFile(
          fileId: widget.fileId,
          priority: widget.downloadPriority,
          synchronous: false));
    }

    _streamSubscription =
        widget.client.fileUpdates(widget.fileId).listen((event) {
      processFile(event);
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    downloadFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, progress, path);
  }
}
