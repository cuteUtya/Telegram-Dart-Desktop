import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class FileImageDisplay extends StatefulWidget {
  const FileImageDisplay(
      {Key? key,
      required this.id,
      required this.client,
      this.borderRadius,
      this.containerShape = BoxShape.rectangle,
      this.height,
      this.width,
      this.priority = 5,
      this.emptyReplacer = const Center()})
      : super(key: key);
  final BoxShape containerShape;
  final int id;
  final int priority;
  final double? width;
  final double? height;
  final Widget emptyReplacer;
  final TelegramClient client;
  final BorderRadius? borderRadius;

  @override
  State<StatefulWidget> createState() => FileImageDisplayState();
}

class FileImageDisplayState extends State<FileImageDisplay> {
  String? path; //late Widget toDisplay = widget.emptyReplacer;
  int? downloadedId;

  void changeFile(File file) {
    downloadedId = downloadedId;
    if (mounted) {
      setState(() => path = file.local!.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (downloadedId == null) {
      widget.client.send(GetFile(fileId: widget.id)).then((fileInfo) {
        fileInfo as File;
        if ((fileInfo.local?.path ?? "").isEmpty) {
          widget.client
              .send(DownloadFile(fileId: widget.id, priority: 4))
              .then((downloadedFile) {
            changeFile(downloadedFile as File);
          });
        } else {
          changeFile(fileInfo);
        }
      });
    }

    if ((path ?? "").isNotEmpty) {
      return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              shape: widget.containerShape,
              image: DecorationImage(
                  fit: BoxFit.cover, image: FileImage(io.File(path!)))));
    }
    return widget.emptyReplacer;
  }
}
