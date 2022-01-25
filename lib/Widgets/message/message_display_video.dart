import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'package:libwinmedia/libwinmedia.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class MessageDisplayVideo extends StatelessWidget {
  const MessageDisplayVideo({
    Key? key,
    required this.message,
    required this.client,
    this.senderName,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final String? senderName;

  static int i = 0;
  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageVideo);
    var video = message.content as MessageVideo;

    var player = vlc.Player(
      id: ++i,
      videoDimensions: VideoDimensions(
        video.video!.width!,
        video.video!.height!,
      ),
    );

    client
        .send(DownloadFile(
      fileId: video.video!.video!.id!,
      priority: 1,
      synchronous: true,
    ))
        .then((file) {
      player.open(vlc.Media.file(io.File((file as File).local!.path!)));
    });
    return LayoutBuilder(builder: (_, box) {
      print(box.maxWidth / video.video!.width!);
      return MessageDisplayMedia(
        client: client,
        message: message,
        senderName: senderName,
        caption: video.caption,
        contentSize: Size(
          box.maxWidth,
          video.video!.height! * (box.maxWidth / video.video!.width!),
        ),
        content: vlc.Video(
          player: player,
          width: video.video!.width!.toDouble(),
          height: video.video!.height!.toDouble(),
        ),
      );
    });
  }
}
