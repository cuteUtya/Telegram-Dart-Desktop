import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/copyable_text.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Links utils/linksOpener.dart';
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
class MessageDisplayText extends StatefulWidget {
  const MessageDisplayText({
    Key? key,
    required this.client,
    required this.message,
    required this.infoWidget,
    required this.replieWidget,
    this.additionalContent,
    this.additionalContentPlace = AdditionalContentPlace.top,
    this.text,
    this.senderName,
    this.adminTitle,
  }) : super(key: key);
  final TelegramClient client;
  final Message message;
  final FormattedText? text;
  final String? senderName;
  final String? adminTitle;
  final Widget? additionalContent;
  final AdditionalContentPlace additionalContentPlace;
  final Widget? infoWidget;
  final Widget? replieWidget;

  @override
  State<StatefulWidget> createState() => _MessageDisplayTextState();
}

class _MessageDisplayTextState extends State<MessageDisplayText> {
  Size? msgInfoBubbleSize;
  final GlobalKey _msgInfoWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (mounted && msgInfoBubbleSize == null) {
        setState(() {
          msgInfoBubbleSize = _msgInfoWidgetKey.currentContext?.size;
        });
      }
    });

    var additionalInfo = widget.additionalContent == null
        ? const SizedBox.shrink()
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: widget.additionalContent,
          );

    var contentText = widget.text ?? (widget.message.content as MessageText).text!;

    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(
            contentText, 20, ClientTheme.currentTheme.getField("MessageTextColor"), true, (s) => HttpUrlsUtils.openLink(s)));
    return LayoutBuilder(builder: (context, boxCons) {
      var paragraph = calcLines(context, boxCons, parsedEntetiyes);
      var boxes = paragraph.getBoxesForSelection(TextSelection(baseOffset: 0, extentOffset: contentText.text!.length));
      final lastBox = boxes.lastOrNull ?? TextBox.fromLTRBD(0, 0, 0, 0, TextDirection.ltr);
      final fitsLastLine = boxCons.maxWidth - lastBox.right > (msgInfoBubbleSize?.width ?? 30);
      return Stack(
        children: [
          /// fake text with title and admin titles that stratch message bubble1
          if (widget.adminTitle != null && !widget.message.isOutgoing! && widget.senderName != null)
            Text.rich(TextSpan(children: [
              TextSpan(
                text: widget.senderName!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.transparent,
                ),
              ),
              const WidgetSpan(
                  child: SizedBox(
                width: 12,
              )),
              TextSpan(
                text: widget.adminTitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.transparent,
                ),
              )
            ])),
          if (widget.adminTitle != null && !widget.message.isOutgoing!)
            Positioned(
                right: 0,
                top: 0,
                child: Text(
                  widget.adminTitle!,
                  style: TextDisplay.create(size: 16, textColor: ClientTheme.currentTheme.getField("AdminTitleColor")),
                )),
          Positioned(
            right: 0,
            bottom: -2,
            child: Container(
              child: widget.infoWidget,
              key: _msgInfoWidgetKey,
            ),
          ),
          Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (widget.senderName != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: TextDisplay.parseEmojiInString(
                        widget.senderName!,
                        TextDisplay.create(
                          textColor: getPeerColor(getSenderId(widget.message.senderId!)!, 'b'),
                          fontWeight: FontWeight.bold,
                          size: 18,
                          fontFamily: TextDisplay.greaterImportance,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            if (widget.replieWidget != null) widget.replieWidget!,
            if (widget.additionalContent != null && widget.additionalContentPlace == AdditionalContentPlace.top) additionalInfo,
            if (contentText.text?.isNotEmpty ?? false)
              Container(
                child: CopyableText(parsedEntetiyes),
                margin: EdgeInsets.only(
                  bottom: boxCons.maxWidth - lastBox.right < (msgInfoBubbleSize?.width ?? 30) ? 16 : 0,
                ),
              ),
            if (widget.additionalContent != null && widget.additionalContentPlace == AdditionalContentPlace.bottom)
              additionalInfo,
          ]),
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOutBack,
            width: lastBox.right + (!fitsLastLine ? 0 : (msgInfoBubbleSize?.width ?? 50) + 12),
          ),
        ],
      );
    });
  }
}

enum AdditionalContentPlace { bottom, top }
