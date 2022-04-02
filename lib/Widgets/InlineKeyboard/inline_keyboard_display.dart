import 'package:flutter/material.dart';
import 'package:myapp/Widgets/InlineKeyboard/inline_keyboard_button_display.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class InlineKeyboardDisplay extends StatelessWidget {
  const InlineKeyboardDisplay({
    Key? key,
    required this.client,
    required this.keyboard,
  }) : super(key: key);

  final TelegramClient client;
  final ReplyMarkupInlineKeyboard keyboard;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    for (final column in keyboard.rows!) {
      buttons.add(
        Row(
          children: [
            for (final btn in column)
              Expanded(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(
                  2,
                  0,
                  2,
                  2,
                ),
                child: InlineKeyboardButtonDisplay(
                  onClick: () => print("click"),
                  text: btn.text!,
                ),
              ))
          ],
        ),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: Column(
        children: buttons,
      ),
    );
  }
}
