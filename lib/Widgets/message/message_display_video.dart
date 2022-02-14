import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' as td hide Text;
import 'dart:io' as io;
import 'package:myapp/utils.dart';

class MessageDisplayVideo extends StatefulWidget {
  const MessageDisplayVideo({
    Key? key,
    required this.message,
    required this.client,
    this.overrideVideo,
    this.senderName,
    this.infoWidget,
    this.overrideCaption,
    this.contolls,
    this.autoplay = false,
    this.loop = false,
    this.replieWidget,
  }) : super(key: key);

  final td.Message message;
  final td.Video? overrideVideo;
  final TelegramClient client;
  final td.FormattedText? overrideCaption;
  final Widget? contolls;
  final bool autoplay;
  final bool loop;
  final String? senderName;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  State<MessageDisplayVideo> createState() => _MessageDisplayVideoState();
}

class _MessageDisplayVideoState extends State<MessageDisplayVideo> {
  static int i = 62420;
  vlc.Player? player;
  List<StreamSubscription> _subs = [];

  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is td.MessageVideo || widget.overrideVideo != null);
    var video = widget.overrideVideo ?? (widget.message.content as td.MessageVideo).video!;
    var videoCaption =
        widget.overrideVideo == null ? (widget.message.content as td.MessageVideo).caption! : widget.overrideCaption;
    player = vlc.Player(
      id: ++i,
      videoDimensions: const VideoDimensions(0, 0),
    );

    if (widget.loop) {
      _subs.add(player!.playbackStream.listen((event) {
        if (event.isCompleted) {
          player!.play();
        }
      }));
    }

    var contollsHiderKey = GlobalKey<WidgetHiderState>();
    var duration = 0;
    var position = 0;
    var volume = 1.0;
    bool videoInited = false;

    return LayoutBuilder(builder: (_, box) {
      var contentWidth = min(video.width?.toDouble() ?? box.maxWidth, box.maxWidth);
      var contentHeight = (video.height! * (contentWidth / video.width!)).toDouble();
      return MessageDisplayMedia(
        client: widget.client,
        message: widget.message,
        senderName: widget.senderName,
        infoWidget: widget.infoWidget,
        contentWidth: contentWidth,
        caption: videoCaption,
        content: RemoteFileBuilderProgress(
          downloadStep: 256000,
          client: widget.client,
          fileId: video.video!.id!,
          builder: (context, progres, path) {
            if (progres != 1 && !video.supportsStreaming! || progres == 0) {
              return BlurImagePreview(
                image: MemoryImage(
                  base64.decode(
                    video.minithumbnail!.data!,
                  ),
                ),
                width: contentWidth,
                height: contentHeight,
              );
            }
            if (!videoInited) {
              videoInited = true;
              player!.open(
                vlc.Media.file(io.File(path!)),
                autoStart: widget.autoplay,
              );
            }
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if ((player!.position.duration?.inSeconds ?? 0) <= 0) {
                      player!.play();
                      position = 0;
                    }
                    player!.playOrPause();
                  },
                  child: MouseRegion(
                    onEnter: (_) => contollsHiderKey.currentState?.show(),
                    onExit: (_) => contollsHiderKey.currentState?.hide(),
                    child: vlc.Video(
                      key: Key("video?chat=${widget.message.chatId}?message=${widget.message.id}playerId=${player?.id}"),
                      player: player,
                      width: contentWidth,
                      height: contentHeight,
                      showControls: false,
                    ),
                  ),
                ),
                Text(
                  "${(progres * 100).toInt()}%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                WidgetHider(
                  hiddenOnInit: true,
                  key: contollsHiderKey,
                  child: widget.contolls ??
                      StreamBuilder(
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
                )
              ],
            );
          },
        ),
      );
    });
    /* return 
        
        return MouseRegion(
          
          child: MessageDisplayMedia(
            client: widget.client,
            message: widget.message,
            senderName: widget.senderName,
            caption: videoCaption,
            contentWidth: contentWidth,
            contentHeight: contentHeight,
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
                      width: video.width!.toDouble(),
                      height: video.height!.toDouble(),
                      showControls: false,
                    )),
                ,
              ],
            ),
          ),
        );
      },
    );*/
  }

  @override
  void dispose() {
    player?.dispose();
    _subs.forEach((element) => element.cancel());
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
