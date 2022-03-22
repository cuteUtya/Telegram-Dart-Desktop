import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Widgets/remote_file_builder_progress.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:dart_vlc/dart_vlc.dart' as vlc;
import 'dart:io' as io;

class MessageDisplayVideoSticker extends StatefulWidget {
  const MessageDisplayVideoSticker({
    Key? key,
    required this.client,
    required this.sticker,
  }) : super(key: key);

  final TelegramClient client;
  final Sticker sticker;
  @override
  State<StatefulWidget> createState() => _MessageDisplayVideoStickerState();
}

class _MessageDisplayVideoStickerState extends State<MessageDisplayVideoSticker> {
  late vlc.Player player;

  @override
  void initState() {
    player = vlc.Player(id: _i++);
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  int _i = 100000;

  @override
  Widget build(BuildContext context) {
    return RemoteFileBuilderProgress(
      client: widget.client,
      fileId: widget.sticker.sticker!.id!,
      builder: (_, progress, path) {
        if (path == null) {
          return RemoteFileBuilder(
              builder: (_, s) => Image(image: FileImage(io.File(s))),
              fileId: widget.sticker.thumbnail!.file!.id!,
              client: widget.client);
        } else {
          Future.delayed(Duration.zero, () {
            void play() => player.open(
                  vlc.Media.file(
                    io.File(path),
                  ),
                  autoStart: true,
                );
            play();
            player.playbackStream.listen((event) {
              play();
            });
          });
          return vlc.Video(
            player: player,
            height: widget.sticker.height!.toDouble(),
            width: widget.sticker.width!.toDouble(),
            playlistLength: 1,
            showControls: false,
          );
        }
      },
    );
  }
}
