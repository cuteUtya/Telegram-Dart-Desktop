import 'package:flutter/material.dart';
import 'package:myapp/Widgets/file_image_display.dart';
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
    FormattedText text;
    List<InlineSpan> externalElements = [];
    switch (content.runtimeType) {
      case MessageText:
        text = (content as MessageText).text!;
        break;

      case MessageAnimatedEmoji:
        var emoji = (content as MessageAnimatedEmoji).emoji!;
        text = FormattedText(text: emoji);
        break;

      case MessagePhoto:
        text = (content as MessagePhoto).caption!;
        var sizes = content.photo!.sizes!;
        sizes.sort((a, b) =>
            a.width! > b.width! ? -1 : (a.width! == b.width! ? 0 : 1));
        externalElements.add(WidgetSpan(
            child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: FileImageDisplay(
                    id: sizes.last.photo!.id!,
                    client: client,
                    width: 20,
                    height: 20))));
        externalElements.add(TextSpan(
            text: client.getTranslation("lng_attach_photo"),
            style: TextDisplay.create(size: 18, textColor: TextColor.Accent)));
        break;

      default:
        text = FormattedText(text: content.runtimeType.toString());
        break;
    }

    return FutureBuilder(
        builder: (context, data) {
          if (data.hasData) {
            bool showFrom = false;

            String author = data.data is Chat
                ? "${(data.data as Chat).title}: "
                : "${(data.data as User).firstName}: ";

            if (chat.type is ChatTypeSupergroup) {
              if (!(chat.type as ChatTypeSupergroup).isChannel!) {
                showFrom = true;
              }
            }

            if (chat.lastMessage!.sender is MessageSenderUser) {
              showFrom = true;
              if ((chat.lastMessage!.sender! as MessageSenderUser).userId ==
                  client.me) {
                author = "${client.getTranslation("lng_from_you")}: ";
              }
              if (chat.id == client.me) {
                showFrom = false;
              }
            }
            //TODO if forwardInfo != null show original message author

            return RichText(
                maxLines: 2,
                text: TextSpan(
                    text: showFrom ? author : "",
                    children: <InlineSpan>[
                          WidgetSpan(
                              child: chat.lastMessage!.forwardInfo != null
                                  ? Container(
                                      child: const Icon(Icons.reply),
                                      margin: const EdgeInsets.only(
                                          left: 2, right: 2))
                                  : const SizedBox.shrink()),
                        ] +
                        externalElements +
                        TextDisplay.parseFormattedText(text),
                    style: TextDisplay.create(
                        size: 18, textColor: TextColor.Accent)));
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
