import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class MessageDisplayMedia extends StatelessWidget {
  const MessageDisplayMedia({
    Key? key,
    required this.client,
    required this.message,
    required this.senderName,
    required this.caption,
    required this.content,
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
  final double? contentWidth;
  final double? contentHeight;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    bool haveText = (caption?.text ?? "").isNotEmpty;
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    BorderRadius border = const BorderRadius.all(
      Radius.circular(12),
    );

    return haveText
        ? LayoutBuilder(
            builder: (_, box) => SizedBox(
              width: min(box.maxWidth, contentWidth ?? box.maxWidth),
              child: MessageDisplayText(
                client: client,
                message: message,
                senderName: senderName,
                additionalContent: _buildImage(border),
                infoWidget: infoWidget,
                replieWidget: replieWidget,
                text: caption,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.isOutgoing! && replieWidget != null)
                Container(
                  child: replieWidget!,
                  margin: const EdgeInsets.only(right: 8),
                ),
              Expanded(
                child: Align(
                  alignment: message.isOutgoing! ? Alignment.bottomRight : Alignment.bottomLeft,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      MouseRegion(
                          onEnter: (_) => hiderKey.currentState?.show(),
                          onExit: (_) => hiderKey.currentState?.hide(),
                          child: _buildImage(border)),
                      if (infoWidget != null)
                        WidgetHider(
                          key: hiderKey,
                          hiddenOnInit: true,
                          child: Container(
                            child: infoWidget!,
                            margin: const EdgeInsets.all(8),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (!message.isOutgoing! && replieWidget != null)
                Container(
                  child: replieWidget!,
                  margin: const EdgeInsets.only(left: 8),
                ),
            ],
          );
  }

  Widget _buildImage(BorderRadius border) => SizedBox(
      width: contentWidth,
      height: contentHeight,
      child: ClipRRect(
        borderRadius: border,
        child: content,
      ));
}
