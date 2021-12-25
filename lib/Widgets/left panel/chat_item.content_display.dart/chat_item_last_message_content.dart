import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chat_item_photo_minithumbnail.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_icon_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_photo_text.dart';
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
        displayContent.addAll(TextDisplay.parseEmojiInString(
            "${client.getTranslation("lng_in_dlg_sticker")} ${(content as MessageSticker).sticker!.emoji!} ",
            TextDisplay.chatItemAccent));
        break;

      case MessageChatDeletePhoto:
        messageTypeAllowShowFrom = false;
        displayContent.addAll(TextDisplay.parseEmojiInString(
            "🗑 ${client.getTranslation("lng_action_removed_photo", replacing: {
                  "{from}": lastMessageAuthor
                })}",
            TextDisplay.chatItemAccent));
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
        displayContent.addAll(TextDisplay.parseEmojiInString(
                "📁 ${bytesToSize(document.document!.document!.size!)} —",
                TextDisplay.chatItemAccent) +
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
        displayContent = TextDisplay.parseEmojiInString(
            "📸 ${client.getTranslation(isChannel ? "lng_action_changed_photo_channel" : "lng_action_changed_photo", replacing: {
                  "{from}": lastMessageAuthor
                })}",
            TextDisplay.chatItemAccent);
        break;

      case MessageExpiredPhoto:
        displayContent = TextDisplay.parseEmojiInString(
            "🔥 ${client.getTranslation("lng_attach_photo")}",
            TextDisplay.chatItemAccent);
        break;

      case MessageAnimation:
        var fileId =
            (content as MessageAnimation).animation?.thumbnail?.file?.id;
        Widget? mith;
        if (fileId != null) {
          mith = ChatItemPhotoMinithumbnail(client: client, id: fileId);
          displayContent.addAll(TextDisplay.parseEmojiInString(
              "🖼 GIF", TextDisplay.chatItemAccent));
        } else {
          displayContent += ChatItemContentPhotoText.build(mith, "GIF");
        }
        break;

      case MessageContactRegistered:
        messageTypeAllowShowFrom = false;
        displayContent.addAll(TextDisplay.parseEmojiInString(
            "🎉 ${client.getTranslation("lng_action_user_registered", replacing: {
                  "{from}": lastMessageAuthor
                })}",
            TextDisplay.chatItemAccent));
        break;

      case MessageChatChangeTitle:
        messageTypeAllowShowFrom = false;
        displayContent = TextDisplay.parseEmojiInString(
            "📝 ${client.getTranslation("lng_action_changed_title_channel", replacing: {
                  "{title}": chat.title!
                })}",
            TextDisplay.chatItemAccent);
        break;

      case MessageSupergroupChatCreate:
        displayContent = ChatItemContentIconText.build(
            Icons.create, client.getTranslation("lng_action_created_channel"));
        break;

      case InputMessageText:
        content as InputMessageText;
        text = content.text!;
        break;

      case MessageAudio:
        displayContent = TextDisplay.parseEmojiInString(
            "🎵 ${client.getTranslation("lng_media_music_title")}",
            TextDisplay.chatItemAccent);
        break;

      case MessageVoiceNote:
        displayContent = TextDisplay.parseEmojiInString(
            "🎤 ${client.getTranslation("lng_media_audio")}",
            TextDisplay.chatItemAccent);
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
              TextDisplay.parseFormattedText(text, 18),
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
