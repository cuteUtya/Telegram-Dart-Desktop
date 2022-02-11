import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
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
    required this.contentPadding,
    this.senderName,
    this.adminTitle,
    this.infoWidget,
    this.replieWidget,
  }) : super(key: key);

  final TelegramClient client;
  final Message message;
  final EdgeInsets contentPadding;
  final String? senderName;
  final String? adminTitle;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessagePhoto);
    var photo = message.content as MessagePhoto;
    var photoSize = sortPhotoSizes(photo.photo!.sizes!)[0];
    bool haveText = (photo.caption?.text ?? "").isNotEmpty;
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    BorderRadius border = BorderRadius.vertical(
      top: replieWidget == null || !haveText ? const Radius.circular(12) : Radius.zero,
      bottom: haveText ? Radius.zero : const Radius.circular(12),
    );

    return LayoutBuilder(
      builder: (_, box) {
        var width = max(
          200,
          min(
            box.maxWidth,
            photoSize.width!.toDouble(),
          ),
        ).toDouble();
        return MessageDisplayMedia(
          client: client,
          message: message,
          senderName: senderName,
          infoWidget: infoWidget,
          contentWidth: width,
          adminTitle: adminTitle,
          captionMargin: contentPadding,
          caption: photo.caption,
          content: RemoteFileBuilderProgress(
            client: client,
            fileId: photoSize.photo!.id!,
            builder: (_, progress, path) {
              if (path == null) {
                ///TODO implement better loading animation
                return Text(
                  progress.toString(),
                );
              }
              return Align(
                alignment: message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: border,
                  child: Image.file(
                    io.File(path),
                    cacheHeight: (photoSize.height! ~/ (photoSize.width! / width)),
                    cacheWidth: width.toInt(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
