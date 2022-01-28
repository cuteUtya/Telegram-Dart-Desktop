import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'dart:io' as io;

class MessageDisplayVideo extends StatelessWidget {
  const MessageDisplayVideo(
      {Key? key, required this.message, required this.client, this.senderName, this.infoWidget, this.replieWidget})
      : super(key: key);

  final Message message;
  final TelegramClient client;
  final String? senderName;
  final Widget? infoWidget;
  final Widget? replieWidget;

  static int i = 62420;
  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageVideo);
    var video = message.content as MessageVideo;
    var player = vlc.Player(
      id: ++i,
      videoDimensions: const VideoDimensions(0, 0),
    );

    client
        .send(
      DownloadFile(
        fileId: video.video!.video!.id!,
        priority: 1,
        synchronous: true,
      ),
    )
        .then((file) {
      print("open in video player with id ${player.id}");
      player.open(vlc.Media.file(io.File((file as File).local!.path!)), autoStart: false);
    });
    return LayoutBuilder(
      builder: (_, box) {
        print(video.video!.height! * (box.maxWidth / video.video!.width!));
        return GestureDetector(
            onTap: () => player.playOrPause(),
            child: MessageDisplayMedia(
              client: client,
              message: message,
              senderName: senderName,
              caption: video.caption,
              contentWidth: box.maxWidth,
              contentHeight: video.video!.height! * (box.maxWidth / video.video!.width!),
              replieWidget: replieWidget,
              infoWidget: infoWidget,
              content: vlc.Video(
                key: UniqueKey(),
                player: player,
                width: video.video!.width!.toDouble(),
                height: video.video!.height!.toDouble(),
                showControls: false,
              ),
            ));
      },
    );
  }
}
