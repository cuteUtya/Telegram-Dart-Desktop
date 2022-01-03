import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/tdlib/tdlibUtils.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.message})
      : super(key: key);
  final Message message;
  final Chat chat;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    switch (message.content.runtimeType) {
      case MessageText:
        return MessageDisplayText(
            sender: (chat.type is ChatTypeSupergroup ||
                        chat.type is ChatTypeBasicGroup) &&
                    !message.isOutgoing!
                ? getSenderName(message.senderId!, client)
                : null,
            senderId: getSenderId(message.senderId!),
            lastReadOutboxMessageId: chat.lastReadOutboxMessageId!,
            message: message);
    }
    return Text("unsupported");
  }
}
