import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

/// Widget that provide ease interface to use remove image when no need to know current download status about file
/// [builder] invokes only after [file.path] was received
class RemoteFileBuilder extends StatefulWidget {
  const RemoteFileBuilder({
    Key? key,
    required this.builder,
    required this.fileId,
    required this.client,
    this.emptyPlaceholder = const SizedBox.shrink(),
    this.priority = 3,
  }) : super(key: key);

  final BuilderCallback builder;
  final int fileId;
  final Widget emptyPlaceholder;
  final int priority;
  final TelegramClient client;

  @override
  State<RemoteFileBuilder> createState() => _RemoteFileBuilderState();
}

class _RemoteFileBuilderState
    extends StateWithStreamsSubscriptions<RemoteFileBuilder> {
  late Widget _widget = widget.emptyPlaceholder;

  void downloadFile() async {
    var initialFile =
        await widget.client.send(GetFile(fileId: widget.fileId)) as File;
    void build(File file) {
      if (mounted && !havePath) {
        setState(() => _widget = widget.builder(context, file.local!.path!));
      }
    }

    if (initialFile.local!.isDownloadingCompleted!) {
      build(initialFile);
    } else {
      if (!initialFile.local!.isDownloadingActive!) {
        widget.client.send(
          DownloadFile(
            fileId: widget.fileId,
            priority: widget.priority,
          ),
        );
      }
      streamSubscriptions.add(
        widget.client.fileUpdates(widget.fileId).listen(
          (file) {
            if (file.local!.isDownloadingCompleted!) {
              build(file);
            }
          },
        ),
      );
    }
  }

  @override
  void initState() {
    downloadFile();
    super.initState();
  }

  bool havePath = false;

  @override
  Widget build(BuildContext context) {
    var syncData = widget.client.getFileSync(widget.fileId);
    if (syncData != null) {
      return widget.builder(context, syncData.local!.path!);
    }
    return _widget;
  }
}

typedef BuilderCallback = Widget Function(BuildContext, String);
