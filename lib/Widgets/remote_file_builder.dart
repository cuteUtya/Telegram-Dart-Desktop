import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

/// Widget that provide ease interface to use remove image when no need to know current download status about file
/// [builder] invokes only after [file.path] was received
class RemoteFileBuilder extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.send(GetFile(fileId: fileId)),
        builder: (_, initData) {
          if (initData.hasData) {
            var initialFile = initData.data as File;
            if (initialFile.local!.isDownloadingCompleted!) {
              return builder(context, initialFile.local!.path!);
            } else {
              if (!initialFile.local!.isDownloadingActive!) {
                client.send(DownloadFile(fileId: fileId, priority: priority));
              }
              return StreamBuilder(
                  stream: client.fileUpdates(fileId),
                  builder: (_, data) {
                    if (data.hasData) {
                      var file = (data.data as File);
                      if (file.local!.isDownloadingCompleted!) {
                        return builder(context, file.local!.path!);
                      }
                    }
                    return emptyPlaceholder;
                  });
            }
          }
          return emptyPlaceholder;
        });
  }
}

typedef BuilderCallback = Widget Function(BuildContext, String);
