import 'package:flutter/material.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/display_text.dart';

class ChatItemLastMessageContent extends StatelessWidget {
  const ChatItemLastMessageContent(
      {Key? key, required this.chat, required this.client})
      : super(key: key);
  final Chat chat;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    if (chat.lastMessage == null) return const Center();
    var content = chat.lastMessage!.content!;
    TextSpan? text;
    switch (content.runtimeType) {
      case MessageText:
        //TODO: display formatted text, support bold italic links and other
        text = TextSpan(
          text: (content as MessageText).text!.text!,
          style: TextDisplay.create(textColor: TextColor.RegularText, size: 18),
        );
        break;

      case MessageAnimatedEmoji:
        text = TextDisplay.emoji((content as MessageAnimatedEmoji).emoji!, 18)
            as TextSpan;
        break;

      default:
        text = TextSpan(
            text: "{${content.runtimeType.toString()}}",
            style: TextDisplay.create(size: 18, textColor: TextColor.Accent));
        break;
    }

    return FutureBuilder(
        builder: (context, data) {
          if (data.hasData) {
            String t = data.data is Chat
                ? "${(data.data as Chat).title!}: "
                : "${(data.data as User).firstName!} ${(data.data as User).lastName!}: ";

            bool showFrom = true;
            if (chat.type!.getConstructor() == ChatTypeSupergroup.CONSTRUCTOR) {
              if ((chat.type! as ChatTypeSupergroup).isChannel!) {
                showFrom = false;
              }
            } else if (chat.type!.getConstructor() ==
                ChatTypePrivate.CONSTRUCTOR) {
              showFrom = false;
            }

            if (chat.lastMessage!.sender.runtimeType == MessageSenderUser) {
              if ((chat.lastMessage!.sender as MessageSenderUser).userId ==
                      client.me &&
                  chat.id != client.me) {
                t = "${client.getTranslation("lng_from_you")}: ";
                showFrom = true;
              }
            }

            TextSpan content = showFrom
                ? TextSpan(children: [
                    TextSpan(
                        text: t,
                        style: TextDisplay.create(
                            size: 18, textColor: TextColor.Accent)),
                    text!
                  ])
                : TextSpan(children: [text!]);
            return RichText(maxLines: 2, text: content);
          }
          return const Center();
        },
        future: client.send(chat.lastMessage!.sender! is MessageSenderUser
            ? GetUser(
                userId: (chat.lastMessage!.sender! as MessageSenderUser).userId)
            : GetChat(
                chatId:
                    (chat.lastMessage!.sender! as MessageSenderChat).chatId)));
  }
}
