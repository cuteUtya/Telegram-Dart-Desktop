import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/message/mac_message_bubble_painter.dart';

class MacMessageBubble extends StatelessWidget {
  const MacMessageBubble(
      {Key? key,
      required this.content,
      required this.left,
      required this.infoWidget})
      : super(key: key);
  final Widget content;
  final Widget infoWidget;
  final bool left;
  @override
  Widget build(BuildContext context) {
    var bubbleColor = ClientTheme.currentTheme
        .getField(left ? "MessageBubbleOtherColor" : "MessageBubbleMineColor");
    return Stack(
        alignment: left ? Alignment.bottomLeft : Alignment.bottomRight,
        children: [
          CustomPaint(
              painter: MacMessageBubblePainter(color: bubbleColor, left: left),
              child: const SizedBox(
                width: 41,
                height: 35,
              )),
          Container(
              margin: EdgeInsets.only(left: left ? 6 : 0, right: left ? 0 : 6),
              decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(24))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment:
                      left ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    content,
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [infoWidget],
                    ),
                  ],
                ),
              )),
        ]);
  }
}
