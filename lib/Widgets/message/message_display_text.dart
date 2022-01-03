import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText;

class MessageDisplayText extends StatelessWidget {
  const MessageDisplayText({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    var text = message.content as MessageText;
    var time = DateTime.fromMillisecondsSinceEpoch(message.date! * 1000);
    return MacMessageBubble(
      left: !message.isOutgoing!,
      content: RichText(
        text: TextSpan(children: TextDisplay.parseFormattedText(text.text!)),
      ),
      infoWidget: MessageInfoBubbleCheckMarkTime(
          checkMarkValue: false, time: "${time.hour}:${time.minute}"),
    );
  }
}
