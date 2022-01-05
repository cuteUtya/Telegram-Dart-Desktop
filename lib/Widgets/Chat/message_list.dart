import 'package:flutter/cupertino.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/tdlib/tdlibUtils.dart';

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
  int _renderedChatId = 0;
  @override
  Widget build(BuildContext context) {
    if (_renderedChatId != widget.chatId) {
      widget.client
          .send(GetChatHistory(chatId: widget.chatId, limit: 100))
          .then((mess) {
        setState(() => messages = mess as Messages);
      });
      _renderedChatId = widget.chatId;
    }
    var chat = widget.client.getChat(widget.chatId);
    return ListView.builder(
        reverse: true,
        itemCount: messages?.totalCount ?? 0,
        itemBuilder: (context, index) {
          var msg = messages!.messages![index];
          return Row(
            children: [
              if (msg.isOutgoing!) const Spacer(),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: MessageDisplay(
                        chat: chat,
                        message: msg,
                        client: widget.client,
                      ))),
              if (!msg.isOutgoing!) const Spacer()
            ],
          );
        });
  }
}
