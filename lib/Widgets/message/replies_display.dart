import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/message_content_preview.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class ReplieDisplay extends StatelessWidget {
  const ReplieDisplay(
      {Key? key,
      required this.message,
      required this.client,
      this.inlineStyle = true})
      : super(key: key);
  final Message message;
  final TelegramClient client;
  final bool inlineStyle;
  @override
  Widget build(BuildContext context) {
    if (!inlineStyle) {
      return MessageInfoBubbleBase.forBig(_build());
    }
    return _build();
  }

  Widget _build() {
    var color = inlineStyle
        ? null
        : ClientTheme.currentTheme.getField("ReplieOnMessageBubbleTextColor");
    return LayoutBuilder(
        builder: (_, box) => Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 2,
                height: 40,
                margin: const EdgeInsets.only(right: 8),
                color: ClientTheme.currentTheme.getField(inlineStyle
                    ? "ReplieOnMessageInlineVerticalLineColor"
                    : "ReplieOnMessageBubbleVerticalLineColor"),
              ),
              LimitedBox(
                  maxWidth: inlineStyle ? box.maxWidth : 120,
                  child: MessageContentPreview(
                    client: client,
                    message: message,
                    style: MessageContentPreviewStyle.lineBreakeAfterAuthorName,
                    showAuthor: true,
                    textColor: color,
                    authorColor: color,
                  ))
            ]));
  }
}
