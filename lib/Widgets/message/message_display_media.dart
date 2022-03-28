import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class MessageDisplayMedia extends StatelessWidget {
  const MessageDisplayMedia({
    Key? key,
    required this.client,
    required this.message,
    required this.content,
    this.caption,
    this.border,
    this.senderName,
    this.captionMargin,
    this.adminTitle,
    this.contentWidth,
    this.contentHeight,
    this.infoWidget,
    this.replieWidget,
  }) : super(key: key);

  final TelegramClient client;
  final String? senderName;
  final FormattedText? caption;
  final Widget content;
  final Message message;
  final BorderRadius? border;
  final String? adminTitle;
  final EdgeInsets? captionMargin;
  final double? contentWidth;
  final double? contentHeight;
  final Widget? infoWidget;
  final Widget? replieWidget;

  ///TODO add to settings
  static const bool coverBubbleInInlineMessages = true;

  @override
  Widget build(BuildContext context) {
    bool haveText = (caption?.text ?? "").isNotEmpty;
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    var radius = ClientTheme.currentTheme.getField("BubbleBorderRadiusFree");
    var radiusSmall =
        ClientTheme.currentTheme.getField("MediaWithoutTextBorderRadius");
    BorderRadius border = haveText
        ? (coverBubbleInInlineMessages
            ? (senderName != null
                ? BorderRadius.zero
                : BorderRadius.vertical(top: Radius.circular(radiusSmall)))
            : BorderRadius.vertical(
                top: Radius.circular(
                    replieWidget == null ? radiusSmall : radius),
                bottom: Radius.circular(radiusSmall),
              ))
        : BorderRadius.all(
            Radius.circular(radiusSmall),
          );

    return haveText
        ? LayoutBuilder(
            builder: (_, box) => SizedBox(
              width: min(box.maxWidth, contentWidth ?? box.maxWidth),
              child: MessageDisplayText(
                client: client,
                adminTitle: adminTitle,
                message: message,
                senderName: senderName,
                additionalContent: Container(
                  margin: coverBubbleInInlineMessages
                      ? EdgeInsets.zero
                      : EdgeInsets.all(p(2)),
                  child: _buildImage(border),
                ),
                captionMargin: captionMargin,
                infoWidget: infoWidget,
                replieWidget: replieWidget,
                text: caption,
              ),
            ),
          )
        : Align(
            alignment: message.isOutgoing!
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            child: MouseRegion(
              onEnter: (_) => hiderKey.currentState?.show(),
              onExit: (_) => hiderKey.currentState?.hide(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.isOutgoing! && replieWidget != null)
                    Container(
                      child: replieWidget!,
                      margin: EdgeInsets.only(right: p(6)),
                    ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      _buildImage(border),
                      if (infoWidget != null)
                        WidgetHider(
                          key: hiderKey,
                          hiddenOnInit: !UIManager.isMobile,
                          child: Container(
                            child: infoWidget!,
                            padding: EdgeInsets.all(p(6)),
                          ),
                        ),
                    ],
                  ),
                  if (!message.isOutgoing! && replieWidget != null)
                    Container(
                      child: replieWidget!,
                      margin: EdgeInsets.only(left: p(6)),
                    ),
                ],
              ),
            ),
          );
  }

  Widget _buildImage(BorderRadius border) => SizedBox(
        width: contentWidth,
        height: contentHeight,
        child: ClipRRect(
          borderRadius: border,
          child: content,
        ),
      );
}
