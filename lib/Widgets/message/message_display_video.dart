import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'package:flutter/material.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/blur_image_preview.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/Widgets/widget_opacity_contoller.dart';
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
    this.contentPadding,
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
  final EdgeInsets? contentPadding;
  final String? senderName;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  State<MessageDisplayVideo> createState() => _MessageDisplayVideoState();
}

class _MessageDisplayVideoState extends StateWithStreamsSubscriptions<MessageDisplayVideo> {
  static int i = 62420;
  vlc.Player? player;

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
      streamSubscriptions.add(player!.playbackStream.listen((event) {
        if (event.isCompleted) {
          player!.play();
        }
      }));
    }

    var contollsOpacityKey = GlobalKey<WidgetOpacityContollerState>();
    var previewHiderKey = GlobalKey<WidgetHiderState>();
    var duration = 0;
    var position = 0;
    var volume = 1.0;
    bool videoInited = false;

    return LayoutBuilder(
      builder: (_, box) {
        var contentWidth = min(video.width?.toDouble() ?? box.maxWidth, box.maxWidth);
        var contentHeight = (video.height! * (contentWidth / video.width!)).toDouble();
        return MessageDisplayMedia(
          client: widget.client,
          message: widget.message,
          senderName: widget.senderName,
          infoWidget: widget.infoWidget,
          contentWidth: contentWidth,
          captionMargin: widget.contentPadding,
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
              return GestureDetector(
                onTap: () {
                  previewHiderKey.currentState?.hide();
                  if ((player!.position.duration?.inSeconds ?? 0) <= 0) {
                    player!.play();
                    position = 0;
                  }
                  player!.playOrPause();
                },
                child: Stack(
                  children: [
                    MouseRegion(
                      onEnter: (_) => contollsOpacityKey.currentState?.animateOpacity(1),
                      onExit: (_) => contollsOpacityKey.currentState?.animateOpacity(0),
                      child: vlc.Video(
                        key: Key("video?chat=${widget.message.chatId}?message=${widget.message.id}playerId=${player?.id}"),
                        player: player,
                        playlistLength: 1,
                        width: contentWidth,
                        height: contentHeight,
                        showControls: false,
                      ),
                    ),
                    WidgetOpacityContoller(
                      opacity: 0,
                      duration: Duration.zero,
                      key: contollsOpacityKey,
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
                              if (position >= duration && duration != 0) {
                                Future.delayed(Duration.zero, () => previewHiderKey.currentState?.show());
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
                    if (video.thumbnail != null && !widget.autoplay)
                      WidgetHider(
                        key: previewHiderKey,
                        child: RemoteFileBuilder(
                          builder: (_, path) => Image(
                            image: FileImage(
                              io.File(
                                path,
                              ),
                            ),
                            width: contentWidth,
                            height: contentHeight,
                            fit: BoxFit.cover,
                          ),
                          fileId: video.thumbnail!.file!.id!,
                          client: widget.client,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
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
