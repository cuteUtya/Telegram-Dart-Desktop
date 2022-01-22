import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/date_bubble.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

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
  static const List<Type> serviceMessages = [
    MessageVideoChatStarted,
    MessageVideoChatEnded,
    MessageBasicGroupChatCreate,
    MessageSupergroupChatCreate,
    MessageChatChangeTitle,
    MessageChatChangePhoto,
    MessageChatDeletePhoto
  ];

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
          var previus = (index - 1 < 0 ? null : messages!.messages![index - 1]);
          var next = (index + 1 >= messages!.messages!.length
              ? null
              : messages!.messages![index + 1]);

          var prevDate = previus == null ? null : unixToDateTime(previus.date!);
          var currDate = unixToDateTime(msg.date!);
          var nextDate = next == null ? null : unixToDateTime(next.date!);

          bool showDateBelow = prevDate != null &&
              (prevDate.day != currDate.day ||
                  prevDate.month != currDate.month ||
                  prevDate.year != currDate.year);

          bool showDateAbove = nextDate != null &&
              (nextDate.day != currDate.day ||
                  nextDate.month != currDate.month ||
                  nextDate.year != currDate.year);

          var prevSenderId = getSenderId(previus?.senderId);
          var nextSenderId = getSenderId(next?.senderId);
          var currSenderId = getSenderId(msg.senderId);
          BubbleRelativePosition bubbleRelativePosition =
              BubbleRelativePosition.single;
          if (currSenderId == nextSenderId && currSenderId == prevSenderId) {
            if (showDateAbove && showDateBelow) {
              bubbleRelativePosition = BubbleRelativePosition.single;
            } else if (showDateAbove) {
              bubbleRelativePosition = BubbleRelativePosition.top;
            } else if (showDateBelow) {
              bubbleRelativePosition = BubbleRelativePosition.bottom;
            } else {
              bubbleRelativePosition = BubbleRelativePosition.middle;
            }
          } else if (currSenderId == prevSenderId) {
            bubbleRelativePosition = BubbleRelativePosition.top;
          } else if (currSenderId == nextSenderId) {
            if (showDateAbove) {
              bubbleRelativePosition = BubbleRelativePosition.single;
            } else {
              bubbleRelativePosition = BubbleRelativePosition.bottom;
            }
          }

          var adminInfo = admins.firstWhereOrNull(
              (element) => element.userId == getSenderId(msg.senderId!));
          bool isServiceMessage =
              serviceMessages.contains(msg.content.runtimeType);
          return Column(children: [
            if (nextDate == null)
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: DateBubble(client: widget.client, date: currDate)),
            if (isServiceMessage)
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: MessageDisplay(
                    bubbleRelativePosition: bubbleRelativePosition,
                    client: widget.client,
                    message: msg,
                    isServiceMessage: true,
                  ))
            else
              Row(
                children: [
                  if (msg.isOutgoing! && !isServiceMessage) const Spacer(),
                  Expanded(
                      child: FutureBuilder(
                          key: UniqueKey(),
                          future: msg.replyToMessageId == 0
                              ? null
                              : widget.client.send(GetMessage(
                                  chatId: msg.replyInChatId == 0
                                      ? chat.id
                                      : msg.replyInChatId,
                                  messageId: msg.replyToMessageId)),
                          builder: (_, replieDate) {
                            return Container(
                                margin: EdgeInsets.only(
                                    bottom: (bubbleRelativePosition ==
                                                BubbleRelativePosition.bottom ||
                                            bubbleRelativePosition ==
                                                BubbleRelativePosition.single)
                                        ? 16
                                        : 4),
                                child: MessageDisplay(
                                  bubbleRelativePosition:
                                      bubbleRelativePosition,
                                  chat: chat,
                                  message: msg,
                                  replieOn: replieDate.data == null ||
                                          replieDate.data is! Message
                                      ? null
                                      : replieDate.data as Message,
                                  client: widget.client,
                                  adminTitle: adminInfo != null
                                      ? (adminInfo.customTitle?.isEmpty ?? true)
                                          ? widget.client.getTranslation(
                                              adminInfo.isOwner!
                                                  ? "lng_owner_badge"
                                                  : "lng_admin_badge")
                                          : adminInfo.customTitle!
                                      : null,
                                ));
                          })),
                  if (!msg.isOutgoing! && !isServiceMessage) const Spacer()
                ],
              ),
            if (showDateBelow)
              Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: DateBubble(client: widget.client, date: prevDate)),
          ]);
        });
  }
}
