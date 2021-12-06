import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class ChatPhotoDisplay extends StatefulWidget {
  const ChatPhotoDisplay(
      {Key? key, required this.info, required this.client, this.useBig = false})
      : super(key: key);
  final ChatPhotoInfo info;
  final TelegramClient client;
  final bool useBig;
  @override
  State<ChatPhotoDisplay> createState() => _ChatPhotoDisplayState();
}

class _ChatPhotoDisplayState extends State<ChatPhotoDisplay> {
  late String? path = getPath(widget.info);
  String photoId = "";

  String? getPath(ChatPhotoInfo i) {
    if (widget.useBig) {
      return i.big!.local!.path;
    } else {
      return i.small!.local!.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path!.isEmpty || photoId != getPath(widget.info)) {
      widget.client
          .send(DownloadFile(
              fileId:
                  widget.useBig ? widget.info.big!.id! : widget.info.small!.id!,
              priority: 3))
          .then((value) {
        if (mounted) {
          setState(() => path = (value as File).local!.path!);
        }
      });
      photoId = getPath(widget.info) ?? "";
    }

    return Container(
        decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: path!.isNotEmpty
              ? FileImage(io.File(path!))
              : const AssetImage('Assets/avaLoad.png') as ImageProvider),
    ));
  }
}
