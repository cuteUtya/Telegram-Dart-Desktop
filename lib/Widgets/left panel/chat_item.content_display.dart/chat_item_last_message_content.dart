import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chat_item_photo_minithumbnail.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_icon_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_photo_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
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

  contentEntetyesMargin() => const WidgetSpan(child: SizedBox(width: 4));

  @override
  Widget build(BuildContext context) {
    if (chat.lastMessage == null) return const Center();

    var content = draft
        ? chat.draftMessage!.inputMessageText
        : chat.lastMessage!.content!;
    bool messageTypeAllowShowFrom = true;
    FormattedText text = FormattedText(text: "");
    List<InlineSpan> displayContent = [];
    switch (content.runtimeType) {
      case MessageText:
        text = (content as MessageText).text!;
        text.text = text.text!.replaceAll(RegExp(r"\n"), " ");
        break;

      case MessageAnimatedEmoji:
        displayContent.add(
            TextDisplay.emoji((content as MessageAnimatedEmoji).emoji!, 18));
        break;

      case MessageSticker:
        //TODO in future just pass emoji before "Sticker" text ("${emoji} Sticker")
        displayContent.addAll([
          TextDisplay.emoji((content as MessageSticker).sticker!.emoji!, 18),
          contentEntetyesMargin(),
          TextSpan(
              text: client.getTranslation("lng_in_dlg_sticker"),
              style: TextDisplay.create(size: 18, textColor: TextColor.Accent))
        ]);
        break;

      case MessageChatDeletePhoto:
        messageTypeAllowShowFrom = false;
        displayContent.addAll(ChatItemContentIconText.build(
            Icons.delete,
            client.getTranslation("lng_action_removed_photo",
                replacing: {"{from}": lastMessageAuthor})));
        break;

      join:
      case MessageChatAddMembers:
        messageTypeAllowShowFrom = false;
        String names = "";
        joinInfo?.addedUsers
            .forEach((element) => names += "${element.firstName!}, ");
        if (names.isNotEmpty) names = names.substring(0, names.length - 2);
        displayContent = ChatItemContentIconText.build(
            (joinInfo?.isJoin ?? true) ? Icons.person_add_alt_1 : Icons.group,
            client.getTranslation(joinInfo?.langKey ?? "lng_profile_loading",
                replacing: {
                  "{user}": names,
                  "{users}": names,
                  "{from}": lastMessageAuthor
                }));
        break;
      case MessageChatJoinByLink:
        continue join;
      case MessageChatJoinByRequest:
        continue join;

      case MessagePhoto:
        text = (content as MessagePhoto).caption!;
        displayContent = ChatItemContentPhotoText.build(
            ChatItemPhotoMinithumbnail(
                client: client,
                id: sortPhotoSizes(content.photo!.sizes!).last.photo!.id!),
            (text.text ?? "").isNotEmpty
                ? ""
                : client.getTranslation("lng_attach_photo"));
        break;

      case MessageDocument:
        var document = (content as MessageDocument);
        displayContent.addAll(ChatItemContentIconText.build(Icons.description,
                "${bytesToSize(document.document!.document!.size!)} —") +
            [
              contentEntetyesMargin(),
              TextSpan(
                  text: document.document?.fileName,
                  style: TextDisplay.chatItemAccent),
              contentEntetyesMargin()
            ]);
        text = document.caption!;
        break;

      case MessageChatChangePhoto:
        messageTypeAllowShowFrom = false;
        displayContent = ChatItemContentIconText.build(
            Icons.brush,
            client.getTranslation(
                isChannel
                    ? "lng_action_changed_photo_channel"
                    : "lng_action_changed_photo",
                replacing: {"{from}": lastMessageAuthor}));
        break;

      case MessageExpiredPhoto:
        displayContent = ChatItemContentIconText.build(
            Icons.local_fire_department,
            client.getTranslation("lng_attach_photo"),
            iconColor: ClientTheme.currentTheme
                .getField("ExpiredPhotoChatListIconColor"));
        break;

      case MessageAnimation:
        var fileId =
            (content as MessageAnimation).animation?.thumbnail?.file?.id;
        Widget? mith;
        if (fileId != null) {
          mith = ChatItemPhotoMinithumbnail(client: client, id: fileId);
        }
        displayContent = ChatItemContentPhotoText.build(mith, "GIF");
        break;

      case MessageContactRegistered:
        messageTypeAllowShowFrom = false;
        displayContent = ChatItemContentIconText.build(
            Icons.celebration,
            client.getTranslation("lng_action_user_registered",
                replacing: {"{from}": lastMessageAuthor}));
        break;

      case MessageChatChangeTitle:
        messageTypeAllowShowFrom = false;
        displayContent = ChatItemContentIconText.build(
            Icons.edit,
            client.getTranslation("lng_action_changed_title_channel",
                replacing: {"{title}": chat.title!}));
        break;

      case MessageSupergroupChatCreate:
        displayContent = ChatItemContentIconText.build(
            Icons.create, client.getTranslation("lng_action_created_channel"));
        break;

      case InputMessageText:
        content as InputMessageText;
        text = content.text!;
        break;

      default:
        text = FormattedText(text: content.runtimeType.toString());
        break;
    }

    return RichText(
        maxLines: 2,
        text: TextSpan(
          children: TextDisplay.parseEmojiInString(
                  messageTypeAllowShowFrom
                      ? (showAuthor ? "$lastMessageSenderName: " : "")
                      : "",
                  TextDisplay.create(
                      size: 18,
                      textColor: draft ? TextColor.Draft : TextColor.Accent)) +
              [
                WidgetSpan(
                    child: chat.lastMessage!.forwardInfo != null
                        ? Container(
                            child: Icon(
                              Icons.reply,
                              color: ChatItemContentIconText.iconClr,
                            ),
                            margin: const EdgeInsets.only(left: 2, right: 2))
                        : const SizedBox.shrink()),
              ] +
              displayContent +
              TextDisplay.parseFormattedText(text),
        ));
  }

  int get lastMessageSenderId {
    if (chat.lastMessage!.sender! is MessageSenderUser) {
      return (chat.lastMessage!.sender! as MessageSenderUser).userId!;
    }
    if (chat.lastMessage!.sender! is MessageSenderChat) {
      return (chat.lastMessage!.sender! as MessageSenderChat).chatId!;
    }
    return 0;
  }

  String get lastMessageSenderName {
    if (draft) {
      return client.getTranslation("lng_from_draft");
    }
    if (chat.lastMessage!.sender! is MessageSenderUser) {
      if (lastMessageSenderId == client.me) {
        return client.getTranslation("lng_from_you");
      }
    }
    return lastMessageAuthor;
  }

  bool get isChannel {
    if (chat.type is ChatTypeSupergroup) {
      if ((chat.type as ChatTypeSupergroup).isChannel!) {
        return true;
      }
    }
    return false;
  }

  bool get showAuthor => draft
      ? true
      : !((chat.id == client.me ||
              (chat.type is ChatTypeSupergroup && isChannel)) ||
          ((chat.type is ChatTypePrivate || chat.type is ChatTypeSecret) &&
              lastMessageSenderId != client.me));

  bool get draft => chat.draftMessage != null;
}
