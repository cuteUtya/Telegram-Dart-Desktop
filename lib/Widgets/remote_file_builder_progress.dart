import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class RemoteFileBuilderProgress extends StatefulWidget {
  const RemoteFileBuilderProgress({
    Key? key,
    required this.client,
    required this.fileId,
    required this.builder,
    this.downloadPriority = 1,
    this.downloadStep = 0,
  }) : super(key: key);

  final TelegramClient client;
  final int fileId;
  final Widget Function(BuildContext context, double progress, String? path) builder;
  final int downloadPriority;
  final int downloadStep;
  @override
  State<StatefulWidget> createState() => _RemoteFileBuilderProgressState();
}

class _RemoteFileBuilderProgressState extends StateWithStreamsSubscriptions<RemoteFileBuilderProgress> {
  double progress = 0;
  String? path;

  void downloadFile() async {
    void processFile(File file) {
      if (mounted && !havePath) {
        setState(() {
          progress = file.local!.downloadedPrefixSize! / file.expectedSize!;
          path = file.local!.path!.isEmpty ? null : file.local!.path!;
        });
      }
    }

    var data = await widget.client.send(GetFile(
      fileId: widget.fileId,
    )) as File;

    processFile(data);
    if (!data.local!.isDownloadingActive! && !data.local!.isDownloadingCompleted!) {
      widget.client.send(DownloadFile(
        fileId: widget.fileId,
        priority: widget.downloadPriority,
        synchronous: false,
        limit: widget.downloadStep,
      ));
    }

    streamSubscriptions.add(widget.client.fileUpdates(widget.fileId).listen((event) {
      if (event is! TdError) {
        processFile(event);
        widget.client.send(
          DownloadFile(
            fileId: widget.fileId,
            priority: widget.downloadPriority,
            synchronous: false,
            limit: event.local!.downloadedSize! + widget.downloadStep,
          ),
        );
      }
    }));
  }

  @override
  void initState() {
    downloadFile();
    super.initState();
  }

  bool havePath = false;

  @override
  Widget build(BuildContext context) {
    var syncFileInfo = widget.client.getFileSync(widget.fileId);
    if (syncFileInfo != null) {
      havePath = true;
      path = syncFileInfo.local!.path!;
      progress = 1;
    }
    return widget.builder(
      context,
      progress,
      path,
    );
  }
}
