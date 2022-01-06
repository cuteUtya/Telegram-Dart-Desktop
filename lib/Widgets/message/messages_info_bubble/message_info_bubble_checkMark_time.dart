import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';

class MessageInfoBubbleCheckMarkTime extends StatelessWidget {
  const MessageInfoBubbleCheckMarkTime(
      {Key? key,
      this.checkMarkValue,
      required this.time,
      this.isOutgoing = false,
      this.hasBackground = false})
      : super(key: key);
  final bool? checkMarkValue;
  final String time;
  final bool isOutgoing;
  final bool hasBackground;
  @override
  Widget build(BuildContext context) {
    var color = ClientTheme.currentTheme.getField(hasBackground
        ? "CheckMarkInFlowContainer"
        : (isOutgoing ? "CheckMarkMineColor" : "CheckMarkNotMineColor"));
    var content = Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        time,
        style: TextDisplay.create(size: 16, customTextColor: color),
      ),
      if (checkMarkValue != null) const SizedBox(width: 4),
      if (checkMarkValue != null)
        CheckMark(isReaded: checkMarkValue!, color: color, size: 20)
    ]);

    if (hasBackground) return MessageInfoBubbleBase(content: content);
    return content;
  }
}
