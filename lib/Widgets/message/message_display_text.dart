import 'package:flutter/material.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:myapp/utils.dart';

/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/messageText_example.jpg).
/// ![](https://raw.githubusercontent.com/Tim-dev-hub/tgclient-doc-resources/main/images/messageText_example_mine.jpg).
/// UI representation of MessageText entetiy
/// * [message] object of message, wich have [message.content] with type MessageText
/// * [lastReadOutboxMessageId] lastReadOutboxMessageId in chat from wich was sended current message
/// * [userPost] custom admin post wich be displayed in top right corner, can be null
/// * [senderId] id of channel or user that send message
/// * [senderName] name wich be displayed in bubble top left corner, can be null
class MessageDisplayText extends StatefulWidget {
  const MessageDisplayText(
      {Key? key,
      required this.client,
      required this.message,
      this.showSenderName = false,
      this.fromChat,
      this.userPost})
      : super(key: key);
  final TelegramClient client;
  final Message message;
  final bool showSenderName;
  final Chat? fromChat;
  final String? userPost;

  @override
  State<StatefulWidget> createState() => _MessageDisplayTextState();
}

class _MessageDisplayTextState extends State<MessageDisplayText> {
  Size? msgInfoBubbleSize;
  final GlobalKey _msgInfoWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessageText);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (mounted && msgInfoBubbleSize == null) {
        setState(() {
          msgInfoBubbleSize = _msgInfoWidgetKey.currentContext?.size;
        });
      }
    });

    var time = getHHMM(unixToDateTime(widget.message.date!));
    var msgInfoWidget = MessageInfoBubbleCheckMarkTime(
        key: _msgInfoWidgetKey,
        customInfo: widget.message.editDate == 0
            ? null
            : widget.client.getTranslation("lng_edited"),
        isOutgoing: widget.message.isOutgoing!,
        checkMarkValue: widget.message.isOutgoing!
            ? widget.message.id! <=
                (widget.fromChat?.lastReadOutboxMessageId ?? 0)
            : null,
        time: time);

    var contentText = widget.message.content as MessageText;

    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(
            contentText.text!, 20, TextColor.MessageTextColor));
    return LayoutBuilder(builder: (context, boxCons) {
      var paragraph = calcLines(context, boxCons, parsedEntetiyes);
      var boxes = paragraph.getBoxesForSelection(TextSelection(
          baseOffset: 0, extentOffset: contentText.text!.text!.length));
      final lastBox = boxes.last;
      final fitsLastLine =
          boxCons.maxWidth - lastBox.right > (msgInfoBubbleSize?.width ?? 30);
      return Stack(
        children: [
          if (widget.userPost != null)
            Positioned(
                right: 0,
                top: 0,
                child: Text(
                  widget.userPost!,
                  style: TextDisplay.regular16,
                )),
          Positioned(
            right: 0,
            bottom: -2,
            child: msgInfoWidget,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.showSenderName)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          children: TextDisplay.parseEmojiInString(
                              getSenderName(
                                  widget.message.senderId!, widget.client),
                              TextDisplay.create(
                                  customTextColor: getPeerColor(
                                      getSenderId(widget.message.senderId!),
                                      'b'),
                                  fontWeight: FontWeight.bold,
                                  size: 18,
                                  textColor: TextColor.HeaderMain,
                                  fontFamily: TextDisplay.greaterImportance))))
                    ],
                  ),
                Container(
                  child: Text.rich(parsedEntetiyes),
                  margin: EdgeInsets.only(
                      bottom: boxCons.maxWidth - lastBox.right <
                              (msgInfoBubbleSize?.width ?? 30)
                          ? 16
                          : 0),
                ),
              ]),
          SizedBox(
            width: lastBox.right +
                (!fitsLastLine ? 0 : (msgInfoBubbleSize?.width ?? 30) + 12),
          )
        ],
      );
    });
  }
}
