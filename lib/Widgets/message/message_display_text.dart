import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/copyable_text.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Links utils/linksOpener.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/messageText_example.jpg).
/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/messageText_example_mine.jpg).
/// UI representation of MessageText entetiy
/// * [message] object of message, wich have [message.content] with type MessageText
/// * [adminTitle] custom admin post wich be displayed in top right corner, can be null
/// * [infoWidget] widget what contain info about message
/// * [showSenderName] if true [message.senderId] name (or title if message.senderId is SenderChat) be displayed
/// * [adminTitle] title of admin, can be null
/// * [additionalContent] additional content that displays under sender name, can be null
/// * [text] custom text that can be used instead [message.content]
class MessageDisplayText extends StatelessWidget {
  const MessageDisplayText({
    Key? key,
    required this.client,
    required this.message,
    required this.infoWidget,
    required this.replieWidget,
    this.additionalContent,
    this.additionalContentPlace = AdditionalContentPlace.top,
    this.showText = true,
    this.text,
    this.captionMargin,
    this.senderName,
    this.adminTitle,
  }) : super(key: key);
  final TelegramClient client;
  final Message message;
  final FormattedText? text;
  final EdgeInsets? captionMargin;
  final String? senderName;
  final bool showText;
  final String? adminTitle;
  final Widget? additionalContent;
  final AdditionalContentPlace additionalContentPlace;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  Widget build(BuildContext context) {
    /// TODO complete mechanism of getting size of info widget
    /// but DONT TURN THIS WIDGET TO STATUFULL
    Size msgInfoBubbleSize = const Size(84, 0);
    var contentText = showText
        ? text ?? (message.content as MessageText).text!
        : FormattedText(text: "");
    var additionalInfo = additionalContent == null
        ? const SizedBox.shrink()
        : Container(
            margin: contentText.text!.isEmpty && infoWidget == null
                ? EdgeInsets.zero
                : EdgeInsets.only(
                    bottom: 6, top: senderName != null ? p(4) : 0),
            child: additionalContent,
          );

    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(contentText,
            size: font(14), interactiveEnable: true));

    return LayoutBuilder(builder: (context, boxCons) {
      var paragraph = calcLines(context, boxCons, parsedEntetiyes);
      var boxes = paragraph.getBoxesForSelection(
          TextSelection(baseOffset: 0, extentOffset: contentText.text!.length));
      final lastBox = boxes.lastOrNull ??
          const TextBox.fromLTRBD(0, 0, 0, 0, TextDirection.ltr);
      final fitsLastLine =
          boxCons.maxWidth - lastBox.right > msgInfoBubbleSize.width;
      return Stack(
        children: [
          /// fake text with title and admin titles that stratch message bubble1
          if (senderName != null)
            Container(
              margin: captionMargin,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: senderName,
                      style: TextStyle(
                        fontSize: font(13),
                        color: Colors.transparent,
                      ),
                    ),
                    WidgetSpan(
                        child: SizedBox(
                      width: p(8),
                    )),
                    TextSpan(
                      text: adminTitle,
                      style: TextStyle(
                        fontSize: font(13),
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if (adminTitle != null && !message.isOutgoing!)
            Positioned(
              right: captionMargin?.right ?? 0,
              top: captionMargin?.top ?? 0,
              child: Text(
                adminTitle!,
                style: TextDisplay.create(
                    size: font(13),
                    textColor:
                        ClientTheme.currentTheme.getField("AdminTitleColor")),
              ),
            ),
          if (infoWidget != null)
            Positioned(
              right: captionMargin?.right ?? 0,
              bottom: (captionMargin?.bottom ?? 0) - 2,
              child: infoWidget!,
            ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (senderName != null)
                  Container(
                    margin: EdgeInsets.only(
                      top: captionMargin?.top ?? 0,
                      left: captionMargin?.left ?? 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextDisplay.parseEmojiInString(
                                senderName!,
                                TextDisplay.create(
                                  textColor: message.isOutgoing!
                                      ? ClientTheme.currentTheme.getField(
                                          "OutgoingChannelMessageTitleColor")
                                      : getPeerColor(
                                          getSenderId(message.senderId!)!, 'b'),
                                  fontWeight: FontWeight.w500,
                                  size: font(13),
                                  fontFamily: TextDisplay.greaterImportance,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                if (replieWidget != null)
                  Container(
                    margin: EdgeInsets.only(
                      left: captionMargin?.left ?? 0,
                      right: captionMargin?.right ?? 0,
                      top: senderName == null ? captionMargin?.top ?? 0 : 0,
                    ),
                    child: replieWidget,
                  ),
                if (additionalContent != null &&
                    additionalContentPlace == AdditionalContentPlace.top)
                  additionalInfo,
                if (contentText.text!.isNotEmpty)
                  Container(
                    child: Padding(
                      padding: captionMargin?.add(EdgeInsets.only(
                              top: -(captionMargin?.top ?? 0))) ??
                          EdgeInsets.zero,
                      child: CopyableText(
                        parsedEntetiyes,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: boxCons.maxWidth - lastBox.right <
                              msgInfoBubbleSize.width
                          ? p(12)
                          : 0,
                    ),
                  ),
                if (additionalContent != null &&
                    additionalContentPlace == AdditionalContentPlace.bottom)
                  additionalInfo,
              ]),
          //info widget placeholder
          if (contentText.text!.isNotEmpty)
            SizedBox(
              width: lastBox.right +
                  (!fitsLastLine ? 0 : msgInfoBubbleSize.width + 12),
              height: (lastBox.bottom - lastBox.top),
            ),
        ],
      );
    });
  }
}

enum AdditionalContentPlace { bottom, top }
