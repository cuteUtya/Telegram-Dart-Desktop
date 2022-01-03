import 'package:flutter/material.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';

class MessageInfoBubbleCheckMarkTime extends StatelessWidget {
  const MessageInfoBubbleCheckMarkTime(
      {Key? key, this.checkMarkValue, required this.time})
      : super(key: key);
  final bool? checkMarkValue;
  final String time;
  @override
  Widget build(BuildContext context) {
    return MessageInfoBubbleBase(
        content: Row(children: [
      Text(
        time,
        style: TextDisplay.create(
            size: 18, textColor: TextColor.White, fontWeight: FontWeight.w600),
      ),
      if (checkMarkValue != null) const SizedBox(width: 2),
      if (checkMarkValue != null)
        CheckMark(isReaded: checkMarkValue!, color: Colors.white)
    ]));
  }
}
