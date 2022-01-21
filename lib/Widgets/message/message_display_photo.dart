import 'package:flutter/material.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/utils.dart';
import 'dart:io' as io;
import 'dart:math';

class MessageDisplayPhoto extends StatelessWidget {
  const MessageDisplayPhoto({
    Key? key,
    required this.client,
    required this.message,
  }) : super(key: key);
  final TelegramClient client;
  final Message message;
  @override
  Widget build(BuildContext context) {
    assert(message.content is MessagePhoto);
    var photo = message.content as MessagePhoto;
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];
    return RemoteFileBuilderProgress(
        client: client,
        fileId: photoSize.photo!.id!,
        builder: (_, progress, path) {
          if (path == null) {
            ///TODO implement better loading animation
            return Text(progress.toString());
          }
          return Image.file(
            io.File(path),
            alignment: message.isOutgoing!
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            height: clamp((photoSize.height ?? 600).toDouble(), 40, 600),
          );
        });
  }
}
