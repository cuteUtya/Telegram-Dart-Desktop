import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:collection/collection.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, required this.chatId, required this.client})
      : super(key: key);
  final int chatId;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Messages? messages;
  int _renderedChatId = 0;
  List<ChatAdministrator> admins = [];
  @override
  Widget build(BuildContext context) {
    var chat = widget.client.getChat(widget.chatId);
    if (_renderedChatId != widget.chatId) {
      widget.client
          .send(GetChatHistory(chatId: widget.chatId, limit: 100))
          .then((mess) {
        setState(() => messages = mess as Messages);
      });
      var isChannel = (chat.type is ChatTypeSupergroup
                  ? chat.type as ChatTypeSupergroup
                  : null)
              ?.isChannel ??
          false;
      if (chat.type is ChatTypeBasicGroup ||
          (chat.type is ChatTypeSupergroup && !isChannel)) {
        widget.client
            .send(GetChatAdministrators(chatId: widget.chatId))
            .then((newAdmins) {
          setState(
              () => admins = (newAdmins as ChatAdministrators).administrators!);
        });
      } else {
        admins = [];
      }
      _renderedChatId = widget.chatId;
    }

    return ListView.builder(
        reverse: true,
        itemCount: messages?.totalCount ?? 0,
        itemBuilder: (context, index) {
          var msg = messages!.messages![index];
          var prevSender =
              (index - 1 < 0 ? null : messages!.messages![index - 1])?.senderId;
          var prevSenderId =
              prevSender == null ? null : getSenderId(prevSender);
          var nextSender = (index + 1 >= messages!.messages!.length
                  ? null
                  : messages!.messages![index + 1])
              ?.senderId;
          var nextSenderId =
              nextSender == null ? null : getSenderId(nextSender);
          var currSenderId = getSenderId(msg.senderId!);
          var bubbleRelativePosition =
              currSenderId == nextSenderId && currSenderId == prevSenderId
                  ? BubbleRelativePosition.middle
                  : currSenderId == prevSenderId
                      ? BubbleRelativePosition.top
                      : currSenderId == nextSenderId
                          ? BubbleRelativePosition.bottom
                          : BubbleRelativePosition.single;
          var adminInfo = admins.firstWhereOrNull(
              (element) => element.userId == getSenderId(msg.senderId!));
          return Row(
            children: [
              if (msg.isOutgoing!) const Spacer(),
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(
                          bottom: (bubbleRelativePosition ==
                                      BubbleRelativePosition.bottom ||
                                  bubbleRelativePosition ==
                                      BubbleRelativePosition.single)
                              ? 16
                              : 4),
                      child: MessageDisplay(
                        bubbleRelativePosition: bubbleRelativePosition,
                        chat: chat,
                        message: msg,
                        client: widget.client,
                        adminTitle: adminInfo != null
                            ? (adminInfo.customTitle?.isEmpty ?? true)
                                ? widget.client.getTranslation(
                                    adminInfo.isOwner!
                                        ? "lng_owner_badge"
                                        : "lng_admin_badge")
                                : adminInfo.customTitle!
                            : null,
                      ))),
              if (!msg.isOutgoing!) const Spacer()
            ],
          );
        });
  }
}
