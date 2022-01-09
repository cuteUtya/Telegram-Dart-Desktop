import 'package:flutter/cupertino.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/date_bubble.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/Widgets/message/messages_info_bubble/message_info_bubble_base.dart';
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

          var prevSenderId = getSenderId(previus?.senderId);
          var nextSenderId = getSenderId(next?.senderId);
          var currSenderId = getSenderId(msg.senderId);
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
          var prevDate = previus == null ? null : unixToDateTime(previus.date!);
          var currDate = unixToDateTime(msg.date!);
          return Column(children: [
            Row(
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
            ),
            if (prevDate != null)
              if (prevDate.day != currDate.day ||
                  prevDate.month != currDate.month ||
                  prevDate.year != currDate.year)
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: DateBubble(client: widget.client, date: prevDate)),
          ]);
        });
  }
}
