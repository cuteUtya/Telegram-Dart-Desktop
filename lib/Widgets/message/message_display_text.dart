import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/utils.dart';
import 'package:myapp/global_key_extenstion.dart';

class MessageDisplayText extends StatefulWidget {
  const MessageDisplayText(
      {Key? key,
      required this.message,
      required this.lastReadOutboxMessageId,
      this.senderId,
      this.senderName,
      this.userPost})
      : super(key: key);
  final String? senderName;
  final String? userPost;
  final int? senderId;
  final Message message;
  final int lastReadOutboxMessageId;

  @override
  State<StatefulWidget> createState() => _MessageDisplayTextState();
}

class _MessageDisplayTextState extends State<MessageDisplayText> {
  Size timeBubbleSize = const Size(60, 20);
  GlobalKey _timeKey = GlobalKey();
  Size? bubleSize;
  GlobalKey _bubbleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (mounted) {
        setState(() {
          timeBubbleSize = _timeKey.currentContext?.size ?? timeBubbleSize;
          bubleSize = _bubbleKey.currentContext?.size;
        });
      }
    });
    var text = widget.message.content as MessageText;
    var time = DateTime.fromMillisecondsSinceEpoch(widget.message.date! * 1000);
    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(
            text.text!, 24, TextColor.MessageTextColor));
    var boxes = calcLines(
        context,
        BoxConstraints(
            //24 and 12 is bubble padding
            maxWidth: (bubleSize?.width ?? 100) - 24,
            maxHeight: (bubleSize?.height ?? 32) - 12),
        parsedEntetiyes);
    TextBox? biggestBox;
    boxes.forEach((element) {
      if (element.right > (biggestBox?.right ?? 0)) {
        biggestBox = element;
      }
    });
    final lastBox = boxes.last;
    final fitsLastLine =
        (biggestBox?.right ?? 0) - lastBox.right > timeBubbleSize.width;
    return MacMessageBubble(
        key: _bubbleKey,
        side: widget.message.isOutgoing! ? Side.right : Side.left,
        content: Stack(
          children: [
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.senderName != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              children: TextDisplay.parseEmojiInString(
                                  widget.senderName!,
                                  TextDisplay.create(
                                      customTextColor:
                                          getPeerColor(widget.senderId!, 'b'),
                                      fontWeight: FontWeight.bold,
                                      size: 18,
                                      textColor: TextColor.HeaderMain,
                                      fontFamily:
                                          TextDisplay.greaterImportance))))
                        ],
                      ),
                    Text.rich(parsedEntetiyes)
                  ]),
              margin: EdgeInsets.only(
                  right: !fitsLastLine ? timeBubbleSize.width + 12 : 0),
            ),
            if (widget.userPost != null)
              Positioned(
                  right: 0,
                  top: 0,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.userPost!,
                        style: TextDisplay.regular16,
                      ))),
            Positioned(
                right: 0,
                bottom: -2,
                child: MessageInfoBubbleCheckMarkTime(
                    key: _timeKey,
                    isOutgoing: widget.message.isOutgoing!,
                    checkMarkValue: widget.message.isOutgoing!
                        ? widget.message.id! <= widget.lastReadOutboxMessageId
                        : null,
                    time:
                        "${validateDataComponent(time.hour.toString())}:${validateDataComponent(time.minute.toString())}")),
          ],
        ));
  }
}
