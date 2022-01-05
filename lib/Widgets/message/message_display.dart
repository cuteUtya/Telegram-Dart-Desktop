import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Userpic/chat_photo_display.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/tdlib/tdlibUtils.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay(
      {Key? key,
      required this.chat,
      required this.client,
      required this.message})
      : super(key: key);
  final Message message;
  final Chat chat;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    switch (message.content.runtimeType) {
      case MessageText:
        contentWidget = MessageDisplayText(
          userPost: message.authorSignature,
          senderName: (chat.type is ChatTypeSupergroup ||
                      chat.type is ChatTypeBasicGroup) &&
                  !message.isOutgoing!
              ? getSenderName(message.senderId!, client, true)
              : null,
          senderId: getSenderId(message.senderId!),
          lastReadOutboxMessageId: chat.lastReadOutboxMessageId!,
          message: message,
        );
        break;
      default:
        contentWidget = MacMessageBubble(
          content: Text(
            "unsupported",
            style: TextDisplay.create(size: 20),
          ),
          side: message.isOutgoing! ? Side.right : Side.left,
        );
        break;
    }

    if (message.isOutgoing!) {
      return contentWidget;
    }

    Widget senderUserpic = const SizedBox.shrink();
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
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: senderUserpic,
        ),
        Expanded(
          child: contentWidget,
        ),
      ],
    );
  }
}
