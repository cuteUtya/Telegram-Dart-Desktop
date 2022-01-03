import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, required this.chatId, required this.client})
      : super(key: key);
  final int chatId;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Messages? messages;
  @override
  Widget build(BuildContext context) {
    widget.client
        .send(GetChatHistory(chatId: widget.chatId, limit: 100))
        .then((mess) {
      setState(() => messages = mess as Messages);
    });
    return ListView.builder(
        reverse: true,
        itemCount: messages?.totalCount ?? 0,
        itemBuilder: (context, index) {
          if (messages!.messages![index].content is MessageText) {
            return Container(
                margin: const EdgeInsets.only(top: 16),
                child: MessageDisplayText(message: messages!.messages![index]));
          }
          return const SizedBox.shrink();
        });
  }
}
