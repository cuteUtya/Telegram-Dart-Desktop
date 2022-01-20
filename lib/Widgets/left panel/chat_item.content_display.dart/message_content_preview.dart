import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chat_item_photo_minithumbnail.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_icon_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/chat_item_content_photo_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/tdlib/tdlib_utils.dart';

class MessageContentPreview extends StatelessWidget {
  const MessageContentPreview(
      {Key? key,
      required this.client,
      this.message,
      this.draftMessage,
      this.fromChatType,
      this.chatSelected = false,
      this.showAuthor,
      this.style = MessageContentPreviewStyle.noLineBreaks,
      this.authorColor,
      this.textColor})
      : super(key: key);
  final Message? message;
  final DraftMessage? draftMessage;
  final ChatType? fromChatType;
  final TelegramClient client;
  final MessageContentPreviewStyle style;
  final bool chatSelected;
  final bool? showAuthor;
  final Color? authorColor;
  final Color? textColor;

  contentEntetyesMargin() => const WidgetSpan(child: SizedBox(width: 4));

  @override
  Widget build(BuildContext context) {
    assert(message != null || draftMessage != null);
    return StreamBuilder(
        stream: message?.senderId == null
            ? null
            : client.senderName(message!.senderId!),
        builder: (_, senderData) {
          var content = draftMessage == null
              ? message!.content!
              : draftMessage!.inputMessageText;
          bool messageTypeAllowShowFrom = true;
          FormattedText text = FormattedText(text: "");
          List<InlineSpan> displayContent = [];
          TextStyle textStyle = chatSelected
              ? TextDisplay.chatItemAccentSelected.copyWith(color: textColor)
              : TextDisplay.chatItemAccent.copyWith(color: textColor);
          var author = message == null ? "" : senderData.data.toString();
          switch (content.runtimeType) {
            case MessageText:
              text = (content as MessageText).text!;
              text.text = text.text!.replaceAll(RegExp(r"\n"), " ");
              break;

            case MessageAnimatedEmoji:
              displayContent.add(TextDisplay.emoji(
                  (content as MessageAnimatedEmoji).emoji!,
                  TextDisplay.regular18));
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
                      id: sortPhotoSizes(content.photo!.sizes!)
                          .last
                          .photo!
                          .id!),
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
                    TextSpan(
                        text: document.document?.fileName, style: textStyle),
                    contentEntetyesMargin()
                  ]);
              text = document.caption!;
              break;

            case MessageChatChangePhoto:
              messageTypeAllowShowFrom = false;
              displayContent = TextDisplay.parseEmojiInString(
                  "📸 ${client.getTranslation(isChannel ? "lng_action_changed_photo_channel" : "lng_action_changed_photo", replacing: {
                        "{from}": author
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
                displayContent.addAll(
                    TextDisplay.parseEmojiInString("🖼 GIF", textStyle));
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
                        "{title}": author
                      })}",
                  textStyle);
              break;

            case MessageSupergroupChatCreate:
              displayContent = ChatItemContentIconText.build(Icons.create,
                  client.getTranslation("lng_action_created_channel"));
              break;

            case InputMessageText:
              text = (content as InputMessageText).text!;
              break;

            case MessageAudio:
              var audio = message!.content as MessageAudio;
              displayContent = TextDisplay.parseEmojiInString(
                  "🎵 ${audio.audio!.performer} - ${audio.audio!.title}, ",
                  textStyle);
              text = audio.caption!;
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
                            ? (_showAuthor
                                ? (style ==
                                        MessageContentPreviewStyle.noLineBreaks
                                    ? "${lastMessageSenderName ?? author}: "
                                    : "${lastMessageSenderName ?? author}\n")
                                : "")
                            : "",
                        draftMessage != null
                            ? TextDisplay.draftText
                            : textStyle) +
                    [
                      WidgetSpan(
                          child: message?.forwardInfo != null
                              ? Container(
                                  child: Icon(
                                    Icons.reply,
                                    color: ChatItemContentIconText.iconClr,
                                  ),
                                  margin:
                                      const EdgeInsets.only(left: 2, right: 2))
                              : const SizedBox.shrink()),
                    ] +
                    displayContent +
                    TextDisplay.parseFormattedText(
                        text,
                        18,
                        textColor ??
                            (chatSelected
                                ? Colors.white
                                : ClientTheme.currentTheme
                                    .getField("RegularText"))),
              ));
        });
  }

  int get lastMessageSenderId {
    if (message?.senderId is MessageSenderUser) {
      return (message?.senderId as MessageSenderUser).userId!;
    }
    if (message?.senderId is MessageSenderChat) {
      return (message?.senderId as MessageSenderChat).chatId!;
    }
    return 0;
  }

  String? get lastMessageSenderName {
    if (draftMessage != null) {
      return client.getTranslation("lng_from_draft");
    }
    if (message?.senderId is MessageSenderUser) {
      if (lastMessageSenderId ==
          client.getOptionValue<OptionValueInteger>("my_id")?.value) {
        return client.getTranslation("lng_from_you");
      }
    }
  }

  bool get isChannel {
    if (fromChatType is ChatTypeSupergroup) {
      if ((fromChatType as ChatTypeSupergroup).isChannel!) {
        return true;
      }
    }
    return false;
  }

  bool get _showAuthor {
    var me = client.getOptionValue<OptionValueInteger>("my_id")?.value ?? 0;
    return (draftMessage != null
        ? true
        : !(((fromChatType is ChatTypeSupergroup && isChannel)) ||
                ((fromChatType is ChatTypePrivate ||
                        fromChatType is ChatTypeSecret) &&
                    lastMessageSenderId != me)) ||
            (showAuthor ?? false));
  }
}

enum MessageContentPreviewStyle { lineBreakeAfterAuthorName, noLineBreaks }
