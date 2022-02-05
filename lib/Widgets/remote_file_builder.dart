import 'dart:async';

import 'package:flutter/material.dart';
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

class _RemoteFileBuilderState extends State<RemoteFileBuilder> {
  late Widget _widget = widget.emptyPlaceholder;
  StreamSubscription? _subscription;

  void downloadFile() async {
    var initialFile = await widget.client.send(GetFile(fileId: widget.fileId)) as File;
    if (initialFile.local!.isDownloadingCompleted!) {
      setState(() {
        _widget = widget.builder(
          context,
          initialFile.local!.path!,
        );
      });
    } else {
      if (!initialFile.local!.isDownloadingActive!) {
        widget.client.send(
          DownloadFile(
            fileId: widget.fileId,
            priority: widget.priority,
          ),
        );
      }
      _subscription = widget.client.fileUpdates(widget.fileId).listen((file) {
        if (file.local!.isDownloadingCompleted!) {
          setState(() {
            _widget = widget.builder(
              context,
              file.local!.path!,
            );
          });
        }
      });
    }
  }

  @override
  void initState() {
    downloadFile();
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _widget;
}

typedef BuilderCallback = Widget Function(BuildContext, String);
