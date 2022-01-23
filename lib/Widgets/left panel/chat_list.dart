import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/Widgets/chat_item_display_archive_not_hidden.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display_chat.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/smooth_desktop_list_view.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatelessWidget {
  const ChatListDisplay({
    Key? key,
    required this.client,
    required this.chatList,
    required this.chatsPositions,
    this.scrollController,
  }) : super(key: key);

  final TelegramClient client;
  final ChatList chatList;
  final List<ChatOrder> chatsPositions;
  final ScrollController? scrollController;

  String _chatListStr(ChatList obj) {
    if (obj is ChatListMain) return "m";
    if (obj is ChatListArchive) return "a";
    return "f${(obj as ChatListFilter).chatFilterId}";
  }

  @override
  Widget build(BuildContext context) {
    var sorted = sortChatsFor(chatsPositions, chatList);
    bool isMain = chatList is ChatListMain;
    return SmoothDesktopListView(
      reverseScroll: true,
      itemCount: sorted.length + (isMain ? 1 : 0) + 1,
      itemBuilder: (_, index) {
        if (isMain) {
          if (index == 0) {
            return ChatItemDisplayArchiveNotHidden(client: client, chats: chatsPositions);
          }
          index--;
        }
        if (index >= sorted.length) {
          return Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const SeparatorLine(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Total chats: ${sorted.length}",
                      style: TextDisplay.regular18,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        var order = sorted[index];
        return ChatItemDisplay(
          key: Key("ChatItemDisplay?id=${order.chatId}?chatList=${_chatListStr(chatList)}"),
          onClick: () => UIEvents.selectChat(order.chatId, client),
          chatId: order.chatId,
          client: client,
          chatList: chatList,
        );
      },
    );
  }
}
