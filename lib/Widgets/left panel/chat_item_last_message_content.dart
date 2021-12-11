import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chat_item_photo_minithumbnail.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';

class ChatItemLastMessageContent extends StatelessWidget {
  const ChatItemLastMessageContent(
      {Key? key,
      required this.chat,
      required this.client,
      required this.joinInfo,
      required this.lastMessageAuthor})
      : super(key: key);
  final Chat chat;
  final String lastMessageAuthor;
  final UsersJoinedGroupInfo? joinInfo;
  final TelegramClient client;

  contentEntetyesMargin() => const WidgetSpan(child: SizedBox(width: 8));

  @override
  Widget build(BuildContext context) {
    if (chat.lastMessage == null) return const Center();
    var content = chat.lastMessage!.content!;
    bool messageTypeAllowShowFrom = true;
    FormattedText text = FormattedText(text: "");
    List<InlineSpan> externalElements = [];
    switch (content.runtimeType) {
      case MessageText:
        text = (content as MessageText).text!;
        text.text = text.text!.replaceAll("\n", " ");
        text.text = text.text!.replaceAll("\r", " ");
        break;

      case MessageAnimatedEmoji:
        var emoji = (content as MessageAnimatedEmoji).emoji!;
        text = FormattedText(text: emoji);
        break;

      case MessageSticker:
        externalElements.add(
            TextDisplay.emoji((content as MessageSticker).sticker!.emoji!, 18));
        externalElements.add(contentEntetyesMargin());
        externalElements.add(TextSpan(
            text: client.getTranslation("lng_in_dlg_sticker"),
            style: TextDisplay.create(size: 18, textColor: TextColor.Accent)));
        break;

      join:
      case MessageChatAddMembers:
        messageTypeAllowShowFrom = false;
        externalElements.add(WidgetSpan(
            child:
                Icon(joinInfo!.isJoin ? Icons.person_add_alt_1 : Icons.group)));
        externalElements.add(contentEntetyesMargin());
        String names = "";
        joinInfo!.addedUsers
            .forEach((element) => names += "${element.firstName!}, ");
        names = names.substring(0, names.length - 2);
        externalElements.add(TextSpan(
            style: TextDisplay.chatItemAccent,
            text: client.getTranslation(joinInfo!.langKey, replacing: {
              "{user}": names,
              "{users}": names,
              "{from}": lastMessageAuthor
            })));
        break;
      case MessageChatJoinByLink:
        continue join;
      case MessageChatJoinByRequest:
        continue join;

      case MessagePhoto:
        text = (content as MessagePhoto).caption!;
        externalElements.add(WidgetSpan(
            child: ChatItemPhotoMinithumbnail(
                client: client,
                id: sortPhotoSizes(content.photo!.sizes!).last.photo!.id!)));
        externalElements.add(contentEntetyesMargin());
        if ((text.text ?? "").isEmpty) {
          externalElements.add(TextSpan(
              text: client.getTranslation("lng_attach_photo"),
              style: TextDisplay.chatItemAccent));
          externalElements.add(contentEntetyesMargin());
        }
        break;

      case MessageChatChangePhoto:
        messageTypeAllowShowFrom = false;
        externalElements.add(WidgetSpan(
            child: ChatItemPhotoMinithumbnail(
                client: client,
                id: sortPhotoSizes(
                        (content as MessageChatChangePhoto).photo!.sizes!)
                    .last
                    .photo!
                    .id!)));
        externalElements.add(contentEntetyesMargin());
        externalElements.add(TextSpan(
            text: client.getTranslation(
                isChannel
                    ? "lng_action_changed_photo_channel"
                    : "lng_action_changed_photo",
                replacing: {"{from}": lastMessageAuthor}),
            style: TextDisplay.chatItemAccent));
        break;

      default:
        text = FormattedText(text: content.runtimeType.toString());
        break;
    }

    return RichText(
        maxLines: 2,
        text: TextSpan(
            text: (!messageTypeAllowShowFrom ? false : showAuthor)
                ? "$lastMessageSenderName: "
                : "",
            children: <InlineSpan>[
                  WidgetSpan(
                      child: chat.lastMessage!.forwardInfo != null
                          ? Container(
                              child: Icon(
                                Icons.reply,
                                color: inlineIconsColor,
                              ),
                              margin: const EdgeInsets.only(left: 2, right: 2))
                          : const SizedBox.shrink()),
                ] +
                externalElements +
                TextDisplay.parseFormattedText(text),
            style: TextDisplay.create(size: 18, textColor: TextColor.Accent)));
  }

  String get lastMessageSenderName {
    if (chat.lastMessage!.sender! is MessageSenderUser) {
      if ((chat.lastMessage!.sender! as MessageSenderUser).userId ==
          client.me) {
        return client.getTranslation("lng_from_you");
      }
    }
    return lastMessageAuthor;
  }

  Color get inlineIconsColor =>
      ClientTheme.currentTheme.getField("TextInlineIconsColor");

  bool get isChannel {
    if (chat.type is ChatTypeSupergroup) {
      if ((chat.type as ChatTypeSupergroup).isChannel!) {
        return true;
      }
    }
    return false;
  }

  bool get showAuthor {
    if (chat.type is ChatTypeSupergroup) {
      if (!isChannel) {
        return true;
      }
    }
    if (chat.lastMessage!.sender is MessageSenderUser) {
      if (chat.id == client.me) {
        return false;
      }
      return true;
    }
    return false;
  }
}
