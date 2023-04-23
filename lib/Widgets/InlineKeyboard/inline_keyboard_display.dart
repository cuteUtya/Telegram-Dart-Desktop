import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/Links%20utils/linksOpener.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/InlineKeyboard/inline_keyboard_button_display.dart';
import 'package:myapp/Widgets/blured_widget.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide Animation;

class InlineKeyboardDisplay extends StatelessWidget {
  const InlineKeyboardDisplay({
    Key? key,
    required this.client,
    required this.keyboard,
    required this.chatId,
    required this.messageId,
  }) : super(key: key);

  final TelegramClient client;
  final ReplyMarkupInlineKeyboard keyboard;
  final int messageId;
  final int chatId;
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    for (final column in keyboard.rows!) {
      List<Widget> b = [];
      for (final btn in column) {
        var child = Expanded(
          child: Container(
            margin: const EdgeInsets.all(2),
            child: InlineKeyboardButtonDisplay(
              key: key,
              type: btn.type!,
              onClick: (c) async {
                switch (btn.type.runtimeType) {
                  case InlineKeyboardButtonTypeCallback:
                    var data =
                        (btn.type as InlineKeyboardButtonTypeCallback).data;
                    var answer = await client.send(
                      GetCallbackQueryAnswer(
                        chatId: chatId,
                        messageId: messageId,
                        payload: CallbackQueryPayloadData(
                          data: data,
                        ),
                      ),
                    ) as CallbackQueryAnswer;
                    if (answer.text!.isNotEmpty) {
                      showMessage(c, answer.text!, c);
                    }
                    break;
                  case InlineKeyboardButtonTypeUrl:
                    var url = btn.type as InlineKeyboardButtonTypeUrl;
                    UrlsUtils.openLink(url.url!);
                    break;

                  case InlineKeyboardButtonTypeUser:
                    var usr = btn.type as InlineKeyboardButtonTypeUser;
                    UIEvents.pushChat(usr.userId!, client);
                    break;
                }
              },
              text: btn.text!,
            ),
          ),
        );

        b.add(child);
      }

      buttons.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: b,
        ),
      );
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: buttons,
      ),
    );
  }

  void showMessage(
      BuildContext objectContext, String message, BuildContext context) {
    var box = objectContext.findRenderObject()! as RenderBox;
    var size = box.size;
    var offset = box.globalToLocal(Offset.zero);
    var width = size.width;
    var popupWidth = p(96);
    var entry = OverlayEntry(
      builder: (context) => Positioned(
        left: (-offset.dx) - ((popupWidth - width) / 2),
        top: -offset.dy + size.height + 5.0,
        width: popupWidth,
        child: BackgroundBlur(
          blur: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              vertical: p(4),
              horizontal: p(2),
            ),
            decoration: BoxDecoration(
              color: ClientTheme.currentTheme.getField(
                "InlineKeyboard.answerPopup.backgroundColor",
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Text.rich(
              TextDisplay.parseEmojiInString(
                message,
                TextDisplay.create(
                  textColor: ClientTheme.currentTheme.getField(
                    "InlineKeyboard.answerPopup.textColor",
                  ),
                  size: font(12),
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(entry);
    Future.delayed(
      const Duration(seconds: 2),
      () => entry.remove(),
    );
  }
}
