import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Widgets/chat_item_display_archive_not_hidden.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display_chat.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/smooth_list_view.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatelessWidget {
  const ChatListDisplay({
    Key? key,
    required this.client,
    required this.chatList,
    this.scrollController,
  }) : super(key: key);

  final TelegramClient client;
  final ChatList chatList;
  final ScrollController? scrollController;

  String _chatListStr(ChatList obj) {
    if (obj is ChatListMain) return "m";
    if (obj is ChatListArchive) return "a";
    return "f${(obj as ChatListFilter).chatFilterId}";
  }

  @override
  Widget build(BuildContext context) {
    bool addArchive = chatList is ChatListMain;
    return StreamBuilder(
      initialData: client.getChatsInChatListSync(chatList),
      stream: client.chatsInChatList(chatList),
      builder: (_, data) {
        var chats = data.data as List<ChatOrder>;
        return SmoothListView(
          reverseScroll: true,
          itemCount: chats.length + (addArchive ? 1 : 0),
          scrollController: scrollController,
          itemBuilder: (_, index) {
            if (addArchive) {
              if (index == 0) {
                return ChatItemDisplayArchiveNotHidden(
                  client: client,
                );
              }
              index--;
            }
            var chatId = chats[index].chatId;
            return ChatItemDisplay(
              key: Key("ChatItemDisplay?id=$chatId"),
              onClick: () => UIEvents.selectChat(chatId, client),
              chatId: chatId,
              client: client,
              chatList: chats[0].position.list!,
            );
          },
        );
      },
    );
  }
}
