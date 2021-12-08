import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class FileImageDisplay extends StatelessWidget {
  const FileImageDisplay(
      {Key? key,
      required this.id,
      required this.client,
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, data) {
          if (data.hasData) {
            return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: containerShape,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                            io.File((data.data as File).local!.path!)))));
          }
          return emptyReplacer;
        },
        future: client.send(DownloadFile(fileId: id, priority: priority)));
  }
}
