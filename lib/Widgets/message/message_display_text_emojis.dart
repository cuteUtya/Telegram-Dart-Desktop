import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/messageDisplayTextEmojis_example.jpg)
/// UI representation of MessageText entetiy what contains only emojis.
/// Displays message with big emojis and without bubble.
/// Shows [messageInfo] on mouse hover event.
/// * [emojis] string with emojis
/// * [infoSide] side with wich [messageInfo] will displayed, most often relative on [message.isOutgoing]
/// * [messageInfo] widget what will be displayed on hover
/// * [alignment] horizontal alignment of message
class MessageDisplayTextEmojis extends StatelessWidget {
  const MessageDisplayTextEmojis(
      {Key? key,
      required this.emojis,
      required this.infoSide,
      required this.messageInfo,
      required this.alignment})
      : super(key: key);
  final String emojis;
  final Side infoSide;
  final Widget messageInfo;
  final MainAxisAlignment alignment;
  @override
  Widget build(BuildContext context) {
    return ClickabeObject(
        builder: (hover) => Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: alignment,
              children: [
                if (infoSide == Side.left && hover) messageInfo,
                Text.rich(
                  TextDisplay.emoji(emojis, const TextStyle(fontSize: 32)),
                ),
                if (infoSide == Side.right && hover) messageInfo,
              ],
            ));
  }
}
