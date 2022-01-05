import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

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
  Size timeBubbleSize = const Size(30, 10);
  GlobalKey _timeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (mounted) {
        setState(() {
          timeBubbleSize = _timeKey.currentContext?.size ?? timeBubbleSize;
        });
      }
    });
    var text = widget.message.content as MessageText;
    var time = DateTime.fromMillisecondsSinceEpoch(widget.message.date! * 1000);
    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(
            text.text!, 20, TextColor.MessageTextColor));
    return MacMessageBubble(
        side: widget.message.isOutgoing! ? Side.right : Side.left,
        content: LayoutBuilder(builder: (context, boxCons) {
          var paragraph = calcLines(context, boxCons, parsedEntetiyes);
          var boxes = paragraph.getBoxesForSelection(TextSelection(
              baseOffset: 0,
              extentOffset: parsedEntetiyes.toPlainText().length));
          final lastBox = boxes.last;
          final fitsLastLine =
              boxCons.maxWidth - lastBox.right > timeBubbleSize.width;
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
                  child: MessageInfoBubbleCheckMarkTime(
                      key: _timeKey,
                      isOutgoing: widget.message.isOutgoing!,
                      checkMarkValue: widget.message.isOutgoing!
                          ? widget.message.id! <= widget.lastReadOutboxMessageId
                          : null,
                      time:
                          "${validateDataComponent(time.hour.toString())}:${validateDataComponent(time.minute.toString())}")),
              Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      child: Text.rich(parsedEntetiyes),
                      margin: EdgeInsets.only(
                          bottom: boxCons.maxWidth - lastBox.right <
                                  timeBubbleSize.width
                              ? 12
                              : 0),
                    ),
                  ]),
              SizedBox(
                width: lastBox.right +
                    (!fitsLastLine ? 0 : timeBubbleSize.width + 12),
              )
            ],
          );
        }));
  }
}
