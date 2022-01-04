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
      this.sender})
      : super(key: key);
  final String? sender;
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
      timeBubbleSize = _timeKey.currentContext!.size!;
      bubleSize ??= _bubbleKey.globalPaintBounds?.size;
    });
    var text = widget.message.content as MessageText;
    var time = DateTime.fromMillisecondsSinceEpoch(widget.message.date! * 1000);
    var parsedEntetiyes = TextSpan(
        children: TextDisplay.parseFormattedText(
            text.text!, 24, TextColor.MessageTextColor));
    var boxes = calcLines(
        context,
        BoxConstraints(
            maxWidth: bubleSize?.width ?? 100,
            maxHeight: bubleSize?.height ?? 0),
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
        left: !widget.message.isOutgoing!,
        content: Stack(
          children: [
            Container(
              child: Text.rich(parsedEntetiyes),
              margin: EdgeInsets.only(
                  right: !fitsLastLine
                      ? timeBubbleSize.width -
                          ((biggestBox?.right ?? 0) - lastBox.right) +
                          12
                      : 0),
            ),
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
