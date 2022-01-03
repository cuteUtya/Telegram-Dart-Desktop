import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/utils.dart';

class MessageDisplayText extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var text = message.content as MessageText;
    var time = DateTime.fromMillisecondsSinceEpoch(message.date! * 1000);
    return MacMessageBubble(
      left: !message.isOutgoing!,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sender != null && senderId != null)
            RichText(
                text: TextSpan(
                    children: TextDisplay.parseEmojiInString(
                        sender!,
                        TextDisplay.create(
                            customTextColor: getPeerColor(senderId!, 'b'),
                            fontWeight: FontWeight.bold,
                            size: 18,
                            textColor: TextColor.HeaderMain,
                            fontFamily: TextDisplay.greaterImportance)))),
          RichText(
            text:
                TextSpan(children: TextDisplay.parseFormattedText(text.text!)),
          )
        ],
      ),
      infoWidget: MessageInfoBubbleCheckMarkTime(
          checkMarkValue: message.isOutgoing!
              ? message.id! <= lastReadOutboxMessageId
              : null,
          time:
              "${validateDataComponent(time.hour.toString())}:${validateDataComponent(time.minute.toString())}"),
    );
  }
}
