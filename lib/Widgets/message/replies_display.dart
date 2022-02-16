import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/message_content_preview.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class ReplieDisplay extends StatelessWidget {
  const ReplieDisplay({
    Key? key,
    required this.message,
    required this.client,
    this.inlineStyle = true,
    this.showAuthor = true,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final bool inlineStyle;
  final bool showAuthor;
  @override
  Widget build(BuildContext context) {
    if (!inlineStyle) {
      return MessageInfoBubbleBase.forBig(_build());
    }
    return _build();
  }

  Widget _build() {
    var color = inlineStyle ? null : ClientTheme.currentTheme.getField("ReplieOnMessageBubbleTextColor");
    return Container(
      margin: const EdgeInsets.only(bottom: 4, top: 8),
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: ClientTheme.currentTheme.getField(
              inlineStyle ? "ReplieOnMessageInlineVerticalLineColor" : "ReplieOnMessageBubbleVerticalLineColor",
            ),
            width: 3,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (_, box) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LimitedBox(
              maxWidth: inlineStyle ? box.maxWidth : 120,
              child: DefaultTextStyle(
                style: TextStyle(fontStyle: FontStyle.italic),
                child: MessageContentPreview(
                  client: client,
                  message: message,
                  style: MessageContentPreviewStyle.lineBreakeAfterAuthorName,
                  showAuthor: showAuthor,
                  maxLines: 2,
                  textColor: color,
                  authorColor: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
