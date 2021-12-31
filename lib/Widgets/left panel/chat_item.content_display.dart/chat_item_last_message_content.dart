import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chat_item_photo_minithumbnail.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_icon_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_photo_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/tdlib/tdlibUtils.dart';

class ChatItemLastMessageContent extends StatelessWidget {
  const ChatItemLastMessageContent({
    Key? key,
    required this.chatSelected,
    required this.chat,
    required this.client,
  }) : super(key: key);
  final bool chatSelected;
  final Chat chat;
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
    TextStyle textStyle = chatSelected
        ? TextDisplay.chatItemAccentSelected
        : TextDisplay.chatItemAccent;
    var author = getSenderName(chat.lastMessage!.senderId!, client);
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
            textStyle));
        break;

      case MessageChatDeletePhoto:
        messageTypeAllowShowFrom = false;
        displayContent.addAll(TextDisplay.parseEmojiInString(
            "🗑 ${client.getTranslation("lng_action_removed_photo", replacing: {
                  "{from}": author
                })}",
            textStyle));
        break;

      join:
      case MessageChatAddMembers:
        /*TODO messageTypeAllowShowFrom = false;
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
                  "{from}": author
                }));*/
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
                : client.getTranslation("lng_attach_photo"),
            textStyle);
        break;

      case MessageDocument:
        var document = (content as MessageDocument);
        displayContent.addAll(TextDisplay.parseEmojiInString(
                "📁 ${bytesToSize(document.document!.document!.size!)} —",
                textStyle) +
            [
              contentEntetyesMargin(),
              TextSpan(text: document.document?.fileName, style: textStyle),
              contentEntetyesMargin()
            ]);
        text = document.caption!;
        break;

      case MessageChatChangePhoto:
        messageTypeAllowShowFrom = false;
        displayContent = TextDisplay.parseEmojiInString(
            "📸 ${client.getTranslation(isChannel ? "lng_action_changed_photo_channel" : "lng_action_changed_photo", replacing: {
                  "{from}": getSenderName(chat.lastMessage!.senderId!, client)
                })}",
            textStyle);
        break;

      case MessageExpiredPhoto:
        displayContent = TextDisplay.parseEmojiInString(
            "🔥 ${client.getTranslation("lng_attach_photo")}", textStyle);
        break;

      case MessageAnimation:
        var thumb = (content as MessageAnimation).animation?.thumbnail;
        Widget? mith;
        if (thumb == null || thumb.format is ThumbnailFormatMpeg4) {
          displayContent
              .addAll(TextDisplay.parseEmojiInString("🖼 GIF", textStyle));
        } else {
          mith = FileImageDisplay(id: thumb.file!.id!, client: client);
          displayContent +=
              ChatItemContentPhotoText.build(mith, "GIF", textStyle);
        }
        break;

      case MessageContactRegistered:
        messageTypeAllowShowFrom = false;
        displayContent.addAll(TextDisplay.parseEmojiInString(
            "🎉 ${client.getTranslation("lng_action_user_registered", replacing: {
                  "{from}": author
                })}",
            textStyle));
        break;

      case MessageChatChangeTitle:
        messageTypeAllowShowFrom = false;
        displayContent = TextDisplay.parseEmojiInString(
            "📝 ${client.getTranslation("lng_action_changed_title_channel", replacing: {
                  "{title}": chat.title!
                })}",
            textStyle);
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
            "🎵 ${client.getTranslation("lng_media_music_title")}", textStyle);
        break;

      case MessageVoiceNote:
        displayContent = TextDisplay.parseEmojiInString(
            "🎤 ${client.getTranslation("lng_media_audio")}", textStyle);
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
                      ? (showAuthor
                          ? "${lastMessageSenderName ?? author}: "
                          : "")
                      : "",
                  draft ? TextDisplay.draftText : textStyle) +
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
              TextDisplay.parseFormattedText(text, 18,
                  chatSelected ? TextColor.White : TextColor.RegularText),
        ));
  }

  int get lastMessageSenderId {
    if (chat.lastMessage!.senderId! is MessageSenderUser) {
      return (chat.lastMessage!.senderId! as MessageSenderUser).userId!;
    }
    if (chat.lastMessage!.senderId! is MessageSenderChat) {
      return (chat.lastMessage!.senderId! as MessageSenderChat).chatId!;
    }
    return 0;
  }

  String? get lastMessageSenderName {
    if (draft) {
      return client.getTranslation("lng_from_draft");
    }
    if (chat.lastMessage!.senderId! is MessageSenderUser) {
      if (lastMessageSenderId ==
          client.getOptionValue<OptionValueInteger>("my_id")?.value) {
        return client.getTranslation("lng_from_you");
      }
    }
  }

  bool get isChannel {
    if (chat.type is ChatTypeSupergroup) {
      if ((chat.type as ChatTypeSupergroup).isChannel!) {
        return true;
      }
    }
    return false;
  }

  bool get showAuthor {
    var me = client.getOptionValue<OptionValueInteger>("my_id")?.value ?? 0;
    return draft
        ? true
        : !((chat.id == me || (chat.type is ChatTypeSupergroup && isChannel)) ||
            ((chat.type is ChatTypePrivate || chat.type is ChatTypeSecret) &&
                lastMessageSenderId != me));
  }

  bool get draft => chat.draftMessage != null;
}
