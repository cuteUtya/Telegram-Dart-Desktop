import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';

/// Widget, what displays time at which the message was sent and icon with read status
/// * [checkMarkValue] is message was readed? If null, icon with read status will not be displayed
/// * [time] time in wich message was sended
/// * [isOutgoing] it's info about outgoing message? Affect on text and icon color
/// * [useBackground] if true widget will be wrapped in [MessageInfoBubbleBase] use it if this info will be displayed outside bubble
class MessageInfoBubbleCheckMarkTime extends StatelessWidget {
  const MessageInfoBubbleCheckMarkTime(
      {Key? key,
      required this.time,
      this.customInfo,
      this.checkMarkValue,
      this.isOutgoing = false,
      this.useBackground = false})
      : super(key: key);
  final bool? checkMarkValue;
  final String? customInfo;
  final String time;
  final bool isOutgoing;
  final bool useBackground;
  @override
  Widget build(BuildContext context) {
    var color = ClientTheme.currentTheme.getField(useBackground
        ? "CheckMarkInFlowContainer"
        : (isOutgoing ? "CheckMarkMineColor" : "CheckMarkNotMineColor"));
    var textStyle = TextDisplay.create(size: 16, customTextColor: color);
    var content = Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      if (customInfo != null)
        Text(
          customInfo!,
          style: textStyle,
        ),
      if (customInfo != null) const SizedBox(width: 4),
      Text(
        time,
        style: textStyle,
      ),
      if (checkMarkValue != null) const SizedBox(width: 4),
      if (checkMarkValue != null)
        CheckMark(isReaded: checkMarkValue!, color: color, size: 20)
    ]);

    if (useBackground) return MessageInfoBubbleBase(content: content);
    return content;
  }
}
