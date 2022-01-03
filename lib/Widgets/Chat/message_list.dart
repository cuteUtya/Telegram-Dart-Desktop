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
          var msg = messages!.messages![index];
          var content = msg.content;
          return Row(
            children: [
              if (msg.isOutgoing!) const Spacer(),
              Expanded(
                  flex: 2,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: MessageDisplayText(
                          lastReadOutboxMessageId: widget.client
                              .getChat(widget.chatId)
                              .lastReadOutboxMessageId!,
                          message: content is MessageText
                              ? messages!.messages![index]
                              : Message(
                                  id: 0,
                                  isOutgoing: msg.isOutgoing,
                                  date: 11111111,
                                  content: MessageText(
                                      text: FormattedText(entities: [
                                    TextEntity(
                                        offset: 0,
                                        length: 50,
                                        type: TextEntityTypeItalic())
                                  ], text: "Supported sheme object, but don't impemented yet \n😞😞😞 \n{${content.runtimeType.toString()}}")))))),
              if (!msg.isOutgoing!) const Spacer()
            ],
          );
        });
  }
}
