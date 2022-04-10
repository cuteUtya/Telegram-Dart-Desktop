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
    this.forceToTextMessage = false,
    this.caption,
    this.borderRadius = BorderRadius.zero,
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
  final BorderRadius borderRadius;
  final bool forceToTextMessage;
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

    BorderRadius border = BorderRadius.zero;
    var r = const Radius.circular(4);
    if (haveText && coverBubbleInInlineMessages) {
      if (coverBubbleInInlineMessages) {
        if (senderName == null && replieWidget == null) {
          border = BorderRadius.only(
            topLeft: borderRadius.topLeft,
            topRight: borderRadius.topRight,
            bottomLeft: r,
            bottomRight: r,
          );
        }
      }
    } else {
      if (forceToTextMessage && replieWidget != null) {
        border = BorderRadius.only(
          bottomLeft: borderRadius.topLeft,
          bottomRight: borderRadius.topRight,
          topLeft: r,
          topRight: r,
        );
      } else {
        border = borderRadius;
      }
    }

    bool showName = (forceToTextMessage && !haveText && replieWidget == null) ||
        senderName == null;

    return haveText || forceToTextMessage
        ? LayoutBuilder(
            builder: (_, box) => SizedBox(
              width: min(box.maxWidth, contentWidth ?? box.maxWidth),
              child: MessageDisplayText(
                showText: haveText,
                client: client,
                adminTitle: showName ? null : adminTitle,
                message: message,
                senderName: showName ? null : senderName,
                additionalContent: forceToTextMessage && !haveText
                    ? _buildBubbleStyle(border)
                    : Container(
                        margin: coverBubbleInInlineMessages
                            ? EdgeInsets.zero
                            : EdgeInsets.all(p(2)),
                        child: _buildImage(border),
                      ),
                captionMargin: captionMargin,
                infoWidget: forceToTextMessage && !haveText ? null : infoWidget,
                replieWidget: replieWidget,
                text: caption,
              ),
            ),
          )
        : _buildBubbleStyle(border);
  }

  Widget _buildBubbleStyle(BorderRadius border) {
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    return Align(
      alignment:
          message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
      child: MouseRegion(
        onEnter: (_) => hiderKey.currentState?.show(),
        onExit: (_) => hiderKey.currentState?.hide(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.isOutgoing! &&
                replieWidget != null &&
                !forceToTextMessage)
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
            if (!message.isOutgoing! &&
                replieWidget != null &&
                !forceToTextMessage)
              Container(
                child: replieWidget!,
                margin: EdgeInsets.only(left: p(6)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BorderRadius? border) => SizedBox(
        width: contentWidth,
        height: contentHeight,
        child: ClipRRect(
          borderRadius: border,
          child: content,
        ),
      );
}
