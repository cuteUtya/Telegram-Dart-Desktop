import 'package:flutter/cupertino.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_video.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class MessageDisplayGif extends StatelessWidget {
  const MessageDisplayGif({
    Key? key,
    required this.client,
    required this.message,
    required this.infoWidget,
    required this.replieWidget,
    required this.senderName,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final String? senderName;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    assert(message.content is MessageAnimation);
    var msgAnimation = message.content as MessageAnimation;
    var animation = msgAnimation.animation!;
    var caption = msgAnimation.caption;
    return MessageDisplayVideo(
      message: message,
      client: client,
      infoWidget: infoWidget,
      replieWidget: replieWidget,
      autoplay: true,
      contolls: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: MessageInfoBubbleBase(
            content: Text(
              "GIF",
              style: TextDisplay.create(
                size: 16,
                textColor: ClientTheme.currentTheme.getField(
                  "GifOverlayTextColor",
                ),
              ),
            ),
          ),
        ),
      ),
      loop: true,
      overrideCaption: caption,
      overrideVideo: Video(
        duration: animation.duration,
        width: animation.width,
        height: animation.height,
        thumbnail: animation.thumbnail,
        minithumbnail: animation.minithumbnail,
        mimeType: animation.mimeType,
        hasStickers: animation.hasStickers,
        video: animation.animation,
        supportsStreaming: false,
        fileName: animation.fileName,
      ),
    );
  }
}
