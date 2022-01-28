import 'package:dart_vlc/dart_vlc.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'dart:io' as io;
import 'package:myapp/utils.dart';

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
      player.open(vlc.Media.file(io.File((file as File).local!.path!)), autoStart: false);
      player.setRate(0);
      player.pause();
    });

    var timeHiderKey = GlobalKey<WidgetHiderState>();
    var duration = 0;
    var position = 0;
    return LayoutBuilder(
      builder: (_, box) {
        return MouseRegion(
          onEnter: (_) => timeHiderKey.currentState?.show(),
          onExit: (_) => timeHiderKey.currentState?.hide(),
          child: GestureDetector(
            onTap: () {
              if ((player.position.duration?.inSeconds ?? 0) <= 0) {
                player.play();
                position = 0;
              }
              player.playOrPause();
            },
            child: MessageDisplayMedia(
              client: client,
              message: message,
              senderName: senderName,
              caption: video.caption,
              contentWidth: box.maxWidth,
              contentHeight: video.video!.height! * (box.maxWidth / video.video!.width!),
              replieWidget: replieWidget,
              infoWidget: infoWidget,
              content: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  vlc.Video(
                    key: UniqueKey(),
                    player: player,
                    width: video.video!.width!.toDouble(),
                    height: video.video!.height!.toDouble(),
                    showControls: false,
                  ),
                  WidgetHider(
                    hiddenOnInit: true,
                    key: timeHiderKey,
                    child: StreamBuilder(
                      stream: player.positionStream,
                      builder: (_, posData) {
                        var data = posData.hasData ? posData.data as PositionState : null;
                        if (data?.duration?.inSeconds != 0 && duration == 0) {
                          if (data?.duration != null) {
                            duration = data!.duration!.inSeconds;
                          }
                        }
                        if (data?.position?.inSeconds != 0 && data?.position != null) {
                          if (data!.position!.inSeconds != 0) {
                            position = data.position!.inSeconds;
                          }
                        }
                        return Container(
                          child: MessageInfoBubbleBase(
                            content: Text(
                              "${getMMSS(position)}/${getMMSS(duration)}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 4, right: 4),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
