import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';

class MessageInfoBubbleCheckMarkTime extends StatelessWidget {
  const MessageInfoBubbleCheckMarkTime(
      {Key? key,
      this.checkMarkValue,
      required this.time,
      this.isOutgoing = false})
      : super(key: key);
  final bool? checkMarkValue;
  final String time;
  final bool isOutgoing;
  @override
  Widget build(BuildContext context) {
    var color = ClientTheme.currentTheme
        .getField(isOutgoing ? "CheckMarkMineColor" : "CheckMarkNotMineColor");
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(
        time,
        style: TextDisplay.create(size: 16, customTextColor: color),
      ),
      if (checkMarkValue != null) const SizedBox(width: 4),
      if (checkMarkValue != null)
        CheckMark(isReaded: checkMarkValue!, color: color, size: 20)
    ]);
  }
}
