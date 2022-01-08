import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class FileImageDisplay extends StatelessWidget {
  const FileImageDisplay(
      {Key? key,
      required this.id,
      required this.client,
      this.borderRadius,
      this.containerShape = BoxShape.rectangle,
      this.height,
      this.width,
      this.isTGV = false,
      this.tgvColor,
      this.priority = 5,
      this.emptyReplacer = const Center()})
      : super(key: key);
  final BoxShape containerShape;
  final int id;
  final int priority;
  final double? width;
  final double? height;
  final bool isTGV;
  final Color? tgvColor;
  final Widget emptyReplacer;
  final TelegramClient client;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return RemoteFileBuilder(
        emptyPlaceholder: emptyReplacer,
        builder: (_, path) {
          var file = io.File(path);
          return isTGV
              ? SvgPicture.memory(
                  Uint8List.fromList(
                      io.gzip.decode(file.readAsBytesSync().toList())),
                  height: height,
                  width: width,
                  color: tgvColor,
                  fit: BoxFit.cover)
              : Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      shape: containerShape,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: FileImage(file))));
        },
        fileId: id,
        client: client);
  }
}
