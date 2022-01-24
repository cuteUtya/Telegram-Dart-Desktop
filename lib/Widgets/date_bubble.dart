import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/tdlib/client.dart';

class DateBubble extends StatelessWidget {
  const DateBubble({
    Key? key,
    required this.client,
    required this.date,
  }) : super(key: key);

  final TelegramClient client;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return MessageInfoBubbleBase.forBig(Text(
      client.getTranslation(
        (date.year != DateTime.now().year) ? "lng_month_day_year" : "lng_month_day",
        replacing: {
          "{month}": client.getTranslation("lng_month${date.month}"),
          "{day}": date.day.toString(),
          "{year}": date.year.toString()
        },
      ),
      style: TextDisplay.create(
        fontFamily: TextDisplay.greaterImportance,
        size: 16,
        textColor: ClientTheme.currentTheme.getField(
          "ServiceMessageTextColor",
        ),
      ),
    ));
  }
}
