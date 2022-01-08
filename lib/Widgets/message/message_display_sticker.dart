import 'package:flutter/material.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/rlottie/rlottie.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

/// UI representation of [MessageSticker]
class MessageDisplaySticker extends StatelessWidget {
  const MessageDisplaySticker({
    Key? key,
    required this.client,
    required this.message,
    required this.infoWidget,
  }) : super(key: key);
  final Message message;
  final Widget infoWidget;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageSticker);

    var sticker = (message.content as MessageSticker).sticker!;
    var hiderKey = GlobalKey<WidgetHiderState>();
    return MouseRegion(
        onEnter: (_) => hiderKey.currentState?.show(),
        onExit: (_) => hiderKey.currentState?.hide(),
        child: Stack(alignment: Alignment.bottomRight, children: [
          RemoteFileBuilder(
              builder: (_, path) {
                if (sticker.isAnimated!) {
                  return Rlottie.file(
                      width: 256,
                      height: 256,
                      path: path,
                      aligment: message.isOutgoing!
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      behavior: PlayBehavior.loop);
                } else {
                  return const SizedBox.shrink();
                }
              },
              fileId: sticker.sticker!.id!,
              client: client),
          WidgetHider(
            key: hiderKey,
            child: infoWidget,
            hiddenOnInit: true,
          )
        ]));
  }
}
