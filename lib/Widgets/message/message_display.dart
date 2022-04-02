import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Chat/message_list.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/InlineKeyboard/inline_keyboard_display.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/message_bubble.dart';
import 'package:myapp/Widgets/message/message_display_animated_emoji.dart';
import 'package:myapp/Widgets/message/message_display_audio.dart';
import 'package:myapp/Widgets/message/message_display_media.dart';
import 'package:myapp/Widgets/message/message_display_photo.dart';
import 'package:myapp/Widgets/message/message_display_poll.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/message/message_display_video.dart';
import 'package:myapp/Widgets/message/message_display_gif.dart';
import 'package:myapp/Widgets/message/message_display_text_emojis.dart';
import 'package:myapp/Widgets/message/message_sticker.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/Widgets/message/replies_display.dart';
import 'package:myapp/Widgets/message/service_message.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/Widgets/widget_hider.dart';
import 'package:myapp/Widgets/widget_opacity_contoller.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:myapp/utils.dart';
import 'package:path/path.dart';

/// UI representation of [Message] object
/// * [message] message object
/// * [chat] chat from wich was sended message, may be null
class MessageDisplay extends StatelessWidget {
  const MessageDisplay(
      {Key? key,
      this.chat,
      required this.client,
      required this.message,
      required this.bubbleRelativePosition,
      this.onMessageDelete,
      this.isReplie = false,
      this.replieOn,
      this.adminTitle,
      this.isServiceMessage = false})
      : super(key: key);

  final BubbleRelativePosition bubbleRelativePosition;
  final Message message;
  final ReplieLoadingResult? replieOn;
  final Chat? chat;
  final bool isReplie;
  final String? adminTitle;
  final TelegramClient client;
  final bool isServiceMessage;
  final Function? onMessageDelete;

  Widget _buildInfoWidget(bool inline) => MessageInfoBubbleCheckMarkTime(
        customInfo:
            message.editDate == 0 ? null : client.getTranslation("lng_edited"),
        useBackground: !inline,
        isOutgoing: message.isOutgoing!,
        time: getHHMM(unixToDateTime(message.date!)),
        checkMarkValue: message.isOutgoing!
            ? message.id! <= (chat?.lastReadOutboxMessageId ?? 0)
            : null,
      );

  Widget? _buildReplieWidget(bool inline) => isReplie
      ? ReplieDisplay(
          isOutgoing: message.isOutgoing!,
          message: replieOn is! ReplieLoadingResultSucces
              ? Message(
                  content: MessageText(
                  text: FormattedText(
                    text: client.getTranslation(
                        replieOn is ReplieLoadingResultDeleted
                            ? "lng_deleted_message"
                            : "lng_profile_loading"),
                    entities: [],
                  ),
                ))
              : (replieOn as ReplieLoadingResultSucces).replieOn,
          client: client,
          inlineStyle: inline,
          showAuthor: replieOn != null,
        )
      : null;

  @override
  Widget build(BuildContext context) {
    client.deleteMessageEvent(message.chatId!, message.id!, () {
      //TODO show nice deletetion animation
      onMessageDelete?.call();
    });

    var bubblePadding = MacMessageBubble.padding;
    var bubbleBorderRadius = MacMessageBubble.calculateBorderRadius(
        bubbleRelativePosition, message.isOutgoing! ? Side.right : Side.left);

    return StreamBuilder(
      stream: client.senderName(message.senderId!),
      initialData: client.getSenderNameSync(message.senderId!),
      builder: (_, senderData) {
        var author = senderData.data.toString();
        Widget contentWidget;
        bool isChannel = chat?.type is ChatTypeSupergroup
            ? (chat!.type as ChatTypeSupergroup).isChannel!
            : false;
        bool showMessageSender = false;
        if (bubbleRelativePosition == BubbleRelativePosition.top ||
            bubbleRelativePosition == BubbleRelativePosition.single) {
          if ((chat?.type is ChatTypeSupergroup ||
                  chat?.type is ChatTypeBasicGroup) &&
              !isChannel) {
            if (!message.isOutgoing! ||
                (message.isOutgoing! &&
                    message.senderId is MessageSenderChat)) {
              showMessageSender = true;
            }
          }
        }

        bool wrapInBubble = false;
        bool overrideBubblePadding = false;

        bool haveText = false;
        try {
          haveText =
              ((message.content as dynamic).caption?.text ?? "").isNotEmpty;
        } catch (_) {}
        switch (message.content.runtimeType) {
          case MessageText:
            var contentText = message.content as MessageText;
            var textUnwhitespaced = contentText.text!.text!.replaceAll(" ", "");
            var emojiTest = emojiRegex.firstMatch(textUnwhitespaced);
            if (emojiTest != null) {
              /*
                  if message contains only emojis and its count not much
                  show its without bubble and with big size, like Tdesktop or TelegramX
                  */
              var totalEmojis = emojiTest.end - emojiTest.start;
              if (totalEmojis >= textUnwhitespaced.length && totalEmojis < 8) {
                contentWidget = MessageDisplayTextEmojis(
                  alignment: message.isOutgoing!
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  emojis: textUnwhitespaced,
                  infoSide: message.isOutgoing! ? Side.left : Side.right,
                  messageInfo: _buildInfoWidget(false),
                  replieWidget: _buildReplieWidget(false),
                );
                break;
              }
            }
            wrapInBubble = true;
            contentWidget = MessageDisplayText(
              client: client,
              message: message,
              infoWidget: _buildInfoWidget(true),
              replieWidget: _buildReplieWidget(true),
              senderName: showMessageSender ? author : null,
              adminTitle: bubbleRelativePosition ==
                          BubbleRelativePosition.top ||
                      bubbleRelativePosition == BubbleRelativePosition.single
                  ? adminTitle
                  : "",
            );
            break;

          case MessageAudio:
            wrapInBubble = true;
            contentWidget = MessageDisplayAudio(
              message: message,
              client: client,
              infoWidget: _buildInfoWidget(true),
              replieWidget: _buildReplieWidget(true),
            );
            break;

          case MessageSticker:
            contentWidget = MessageStickerDisplay(
              client: client,
              message: message,
              replieWidget: _buildReplieWidget(false),
              infoWidget: _buildInfoWidget(false),
            );
            break;

          case MessageAnimatedEmoji:
            contentWidget = MessageDisplayAnimatedEmoji(
              chatId: chat!.id!,
              message: message,
              client: client,
              replieWidget: _buildReplieWidget(false),
              infoWidget: _buildInfoWidget(false),
            );
            break;

          case MessageVideoChatStarted:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_action_group_call_started_group",
                replacing: {
                  "{from}": author,
                },
              ),
            );
            break;

          case MessageVideoChatEnded:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_admin_log_discarded_group_call",
                replacing: {
                  "from": author,
                },
              ),
            );
            break;

          case MessageBasicGroupChatCreate:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_action_created_chat",
                replacing: {
                  "{title}":
                      (message.content as MessageBasicGroupChatCreate).title!,
                  "{from}": author,
                },
              ),
            );
            break;

          case MessageSupergroupChatCreate:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_action_created_channel",
              ),
            );
            break;

          case MessageChatChangePhoto:
            contentWidget = Column(
              children: [
                ServiceMessage(
                    text: client.getTranslation("lng_action_changed_photo",
                        replacing: {"{from}": author})),
                SizedBox(height: p(12)),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(p(12))),
                  child: SizedBox(
                    width: p(140),
                    height: p(140),
                    child: Userpic(
                      shape: BoxShape.rectangle,
                      chatPhoto:
                          (message.content as MessageChatChangePhoto).photo,
                      userId: chat?.id ?? 0,
                      userTitle: author,
                      client: client,
                    ),
                  ),
                ),
              ],
            );
            break;

          case MessageChatDeletePhoto:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_action_removed_photo",
                replacing: {
                  "{from}": author,
                },
              ),
            );
            break;

          case MessageChatSetTheme:
            var emoji = (message.content as MessageChatSetTheme).themeName!;
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                message.isOutgoing!
                    ? "lng_action_you_theme_changed"
                    : "lng_action_theme_changed",
                replacing: {
                  "{from}": author,
                  "{emoji}": emoji,
                },
              ),
            );
            break;

          case MessageChatChangeTitle:
            contentWidget = ServiceMessage(
              text: client.getTranslation(
                "lng_action_changed_title_channel",
                replacing: {
                  "{title}": (message.content as MessageChatChangeTitle).title!,
                },
              ),
            );
            break;

          case MessagePhoto:
            wrapInBubble = true;
            overrideBubblePadding = true;
            contentWidget = MessageDisplayPhoto(
              client: client,
              message: message,
              adminTitle: adminTitle,
              contentPadding: bubblePadding,
              bubbleBorderRadius: bubbleBorderRadius,
              senderName: showMessageSender ? author : null,
              infoWidget: _buildInfoWidget(haveText),
              replieWidget: _buildReplieWidget(true),
            );
            break;

          case MessagePoll:
            wrapInBubble = true;
            contentWidget = MessageDisplayPoll(
              message: message,
              client: client,
              infoWidget: _buildInfoWidget(true),
              replieWidget: _buildReplieWidget(true),
              senderName: showMessageSender ? author : null,
            );
            break;

          ///theare some issues related with it perfomance
          /* case MessageVideo:
                wrapInBubble = haveText;
                overrideBubblePadding = true;
                contentWidget = MessageDisplayVideo(
                  client: client,
                  message: message,
                  contentPadding: bubblePadding,
                  senderName: showMessageSender ? author : null,
                  infoWidget: _buildInfoWidget(haveText),
                  replieWidget: _buildReplieWidget(haveText),
                );
                break;

              case MessageAnimation:
                wrapInBubble = haveText;
                overrideBubblePadding = true;
                contentWidget = MessageDisplayGif(
                  client: client,
                  message: message,
                  infoWidget: _buildInfoWidget(haveText),
                  replieWidget: _buildReplieWidget(haveText),
                  senderName: showMessageSender ? author : null,
                  contentPadding: bubblePadding,
                );
                break;*/

          default:
            wrapInBubble = true;
            contentWidget = MessageDisplayText(
              client: client,
              message: message,
              text: FormattedText(
                  text:
                      "🍆🍆🍆 Unsupported 🍆🍆🍆"), //message.toJson().toString()),
              infoWidget: _buildInfoWidget(true),
              replieWidget: _buildReplieWidget(true),
            );
            break;
        }

        Widget? senderUserpic;
        bool isChat = chat?.type is ChatTypeBasicGroup ||
            (chat?.type is ChatTypeSupergroup
                ? !(chat!.type as ChatTypeSupergroup).isChannel!
                : false);
        bool showUserpic = isChat &&
            !message.isOutgoing! &&
            (bubbleRelativePosition == BubbleRelativePosition.bottom ||
                bubbleRelativePosition == BubbleRelativePosition.single);
        if (showUserpic) {
          switch (message.senderId.runtimeType) {
            case MessageSenderUser:
              var senderUserId =
                  (message.senderId as MessageSenderUser).userId!;
              var senderUser = client.getUser(senderUserId);
              senderUserpic = Userpic(
                profilePhoto: senderUser.profilePhoto,
                userId: senderUserId,
                userTitle: "${senderUser.firstName} ${senderUser.lastName}",
                client: client,
              );
              break;
            case MessageSenderChat:
              var senderChatId = (message.senderId as MessageSenderChat).chatId;
              var senderChat = client.getChat(senderChatId!);
              senderUserpic = Userpic(
                chatPhotoInfo: senderChat.photo,
                userId: senderChatId,
                client: client,
                userTitle: senderChat.title!,
              );
              break;
          }

          senderUserpic = SizedBox(
            width: p(28),
            height: p(28),
            child: senderUserpic,
          );
        }
        if (wrapInBubble) {
          contentWidget = MacMessageBubble(
            overridePadding: overrideBubblePadding,
            content: contentWidget,
            side: message.isOutgoing! ? Side.right : Side.left,
            position: bubbleRelativePosition,
          );
        }

        var senderId = getSenderId(message.senderId);
        if (bubbleRelativePosition == BubbleRelativePosition.middle ||
            bubbleRelativePosition == BubbleRelativePosition.top ||
            !wrapInBubble) {
          contentWidget = Container(
            child: contentWidget,
            margin: EdgeInsets.symmetric(
              horizontal: wrapInBubble ? 0 : MessageBubble.sidePadding,
            ),
          );
        }

        Widget inlineKeyboard = const SizedBox();

        if (message.replyMarkup is ReplyMarkupInlineKeyboard) {
          inlineKeyboard = Container(
            margin: EdgeInsets.only(
              top: p(8),
            ),
            child: InlineKeyboardDisplay(
              client: client,
              keyboard: message.replyMarkup! as ReplyMarkupInlineKeyboard,
            ),
          );
        }

        var result = isServiceMessage
            ? contentWidget
            : Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    senderUserpic ?? SizedBox(width: isChat ? p(28) : 0),
                    if (message.senderId is MessageSenderUser &&
                        senderUserpic != null)
                      StreamBuilder(
                        initialData: client.getUser(senderId!).status,
                        stream: client.statusOf(senderId),
                        builder: (_, data) => OnlineIndicatorDidplay(
                          online: data.data is UserStatusOnline,
                          size: p(12),
                          strokeColor: Colors.transparent,
                        ),
                      ),
                  ]),
                  Expanded(
                    child: contentWidget,
                  )
                ],
              );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            result,
            inlineKeyboard,
          ],
        );
      },
    );
  }
}
