import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/Widgets/message/message_display_text_emojis.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_checkMark_time.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/Widgets/message/bubble_utils.dart';
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
      required this.bubbleRelativePosition})
      : super(key: key);
  final BubbleRelativePosition bubbleRelativePosition;
  final Message message;
  final Chat? chat;
  final TelegramClient client;

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    bool showMessageSender = ((chat?.type is ChatTypeSupergroup ||
                chat?.type is ChatTypeBasicGroup) &&
            !message.isOutgoing!) &&
        (bubbleRelativePosition == BubbleRelativePosition.top ||
            bubbleRelativePosition == BubbleRelativePosition.single);
    bool wrapInBubble = false;
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
          if (totalEmojis >= textUnwhitespaced.length && totalEmojis < 40) {
            contentWidget = MessageDisplayTextEmojis(
                alignment: message.isOutgoing!
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                emojis: textUnwhitespaced,
                infoSide: message.isOutgoing! ? Side.left : Side.right,
                messageInfo: MessageInfoBubbleCheckMarkTime(
                  useBackground: true,
                  isOutgoing: message.isOutgoing!,
                  time: getHHMM(unixToDateTime(message.date!)),
                  checkMarkValue: message.isOutgoing!
                      ? message.id! <= (chat?.lastReadOutboxMessageId ?? 0)
                      : null,
                ));
            break;
          }
        }
        wrapInBubble = true;
        contentWidget = MessageDisplayText(
          client: client,
          message: message,
          showSenderName: showMessageSender,
          userPost: message.authorSignature,
          fromChat: chat,
        );

        break;
      default:
        wrapInBubble = true;
        contentWidget = Text(
          "unsupported",
          style: TextDisplay.create(size: 20),
        );
        break;
    }

    Widget senderUserpic = const SizedBox.shrink();
    if (!message.isOutgoing!) {
      if (bubbleRelativePosition == BubbleRelativePosition.bottom ||
          bubbleRelativePosition == BubbleRelativePosition.single) {
        switch (message.senderId.runtimeType) {
          case MessageSenderUser:
            var senderUserId = (message.senderId as MessageSenderUser).userId!;
            var senderUser = client.getUser(senderUserId);
            senderUserpic = Userpic(
              profilePhoto: senderUser.profilePhoto,
              chatId: senderUserId,
              chatTitle: "${senderUser.firstName} ${senderUser.lastName}",
              client: client,
            );
            break;
          case MessageSenderChat:
            var senderChatId = (message.senderId as MessageSenderChat).chatId;
            var senderChat = client.getChat(senderChatId!);
            senderUserpic = Userpic(
              chatPhoto: senderChat.photo,
              chatId: senderChatId,
              client: client,
              chatTitle: senderChat.title!,
            );
            break;
        }
      }
      senderUserpic = SizedBox(
        width: 40,
        height: 40,
        child: senderUserpic,
      );
    }

    if (wrapInBubble) {
      contentWidget = MacMessageBubble(
          content: contentWidget,
          side: message.isOutgoing! ? Side.right : Side.left,
          position: bubbleRelativePosition);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        senderUserpic,
        Expanded(
          child: contentWidget,
        ),
      ],
    );
  }
}
