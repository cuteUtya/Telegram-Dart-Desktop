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

class MessageDisplayVideo extends StatefulWidget {
  const MessageDisplayVideo(
      {Key? key, required this.message, required this.client, this.senderName, this.infoWidget, this.replieWidget})
      : super(key: key);

  final Message message;
  final TelegramClient client;
  final String? senderName;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  State<MessageDisplayVideo> createState() => _MessageDisplayVideoState();
}

class _MessageDisplayVideoState extends State<MessageDisplayVideo> {
  static int i = 62420;
  vlc.Player? player;
  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessageVideo);
    var video = widget.message.content as MessageVideo;
    player = vlc.Player(
      id: ++i,
      videoDimensions: const VideoDimensions(0, 0),
    );

    widget.client
        .send(
      DownloadFile(
        fileId: video.video!.video!.id!,
        priority: 1,
        synchronous: true,
      ),
    )
        .then((file) {
      player!.open(vlc.Media.file(io.File((file as File).local!.path!)), autoStart: false);
    });

    var timeHiderKey = GlobalKey<WidgetHiderState>();
    var duration = 0;
    var position = 0;
    var volume = 1.0;
    return LayoutBuilder(
      builder: (_, box) {
        return MouseRegion(
          onEnter: (_) => timeHiderKey.currentState?.show(),
          onExit: (_) => timeHiderKey.currentState?.hide(),
          child: MessageDisplayMedia(
            client: widget.client,
            message: widget.message,
            senderName: widget.senderName,
            caption: video.caption,
            contentWidth: box.maxWidth,
            contentHeight: video.video!.height! * (box.maxWidth / video.video!.width!),
            replieWidget: widget.replieWidget,
            infoWidget: widget.infoWidget,
            content: Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                    onTap: () {
                      if ((player!.position.duration?.inSeconds ?? 0) <= 0) {
                        player!.play();
                        position = 0;
                      }
                      player!.playOrPause();
                    },
                    child: vlc.Video(
                      key: Key("video?chat=${widget.message.chatId}?message=${widget.message.id}playerId=${player?.id}"),
                      player: player,
                      width: video.video!.width!.toDouble(),
                      height: video.video!.height!.toDouble(),
                      showControls: false,
                    )),
                WidgetHider(
                  hiddenOnInit: true,
                  key: timeHiderKey,
                  child: StreamBuilder(
                    stream: player!.positionStream,
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
                          content: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _MuteIcon(
                                initValue: volume == 0,
                                onMuteStateChange: (mute) {
                                  volume = mute ? 0 : 1;
                                  player!.setVolume(volume);
                                },
                              ),
                              Text(
                                "${getMMSS(position)}/${getMMSS(duration)}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        margin: const EdgeInsets.only(top: 4, right: 4),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    player?.dispose();
    super.dispose();
  }
}

class _MuteIcon extends StatefulWidget {
  const _MuteIcon({
    Key? key,
    this.initValue = false,
    required this.onMuteStateChange,
  }) : super(key: key);

  final Function(bool) onMuteStateChange;
  final bool initValue;
  @override
  State<StatefulWidget> createState() => _MuteIconState();
}

class _MuteIconState extends State<_MuteIcon> {
  late bool mute = widget.initValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => mute = !mute);
        widget.onMuteStateChange(mute);
      },
      child: Icon(
        mute ? Icons.volume_off : Icons.volume_up,
        color: Colors.white,
      ),
    );
  }
}
