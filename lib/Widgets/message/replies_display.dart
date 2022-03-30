import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/copyable_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/message_content_preview.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class ReplieDisplay extends StatelessWidget {
  const ReplieDisplay({
    Key? key,
    required this.message,
    required this.client,
    required this.isOutgoing,
    this.inlineStyle = true,
    this.showAuthor = true,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final bool inlineStyle;
  final bool showAuthor;
  final bool isOutgoing;
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: p(32),
          width: p(3),
          margin: EdgeInsets.only(right: p(6)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(p(3))),
            color: ClientTheme.currentTheme.getField(
              inlineStyle
                  ? (isOutgoing
                      ? "ReplieOnMessageInlineVerticalLineColorMine"
                      : "ReplieOnMessageInlineVerticalLineColor")
                  : "ReplieOnMessageBubbleVerticalLineColor",
            ),
          ),
        ),
        Flexible(
          child: MessageContentPreview(
            client: client,
            message: message,
            style: MessageContentPreviewStyle.lineBreakeAfterAuthorName,
            showAuthor: showAuthor,
            maxLines: 2,
            authorColor: ClientTheme.currentTheme.getField(inlineStyle
                ? (isOutgoing
                    ? "ReplieOnMessageInlineSenderColorMine"
                    : "ReplieOnMessageInlineSenderColor")
                : "ReplieOnMessageBubbleTextColor"),
            textColor: color,
            fontSize: font(13),
          ),
        )
      ],
    ); /*Container(
      margin: EdgeInsets.symmetric(vertical: inlineStyle ? p(4) : p(2)),
      padding: EdgeInsets.only(left: p(6)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            
            ),
            width: 3,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (_, box) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ,
          ],
        ),
      ),
    );*/
  }
}
