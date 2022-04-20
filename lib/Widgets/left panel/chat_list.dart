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

class ChatListDisplay extends StatefulWidget {
  const ChatListDisplay({
    Key? key,
    required this.client,
    required this.chatList,
    this.scrollController,
  }) : super(key: key);

  final TelegramClient client;
  final ChatList chatList;
  final ScrollController? scrollController;

  @override
  State<ChatListDisplay> createState() => _ChatListDisplayState();
}

class _ChatListDisplayState extends State<ChatListDisplay> {
  late List<ChatOrder> _chats =
      widget.client.getChatsInChatListSync(widget.chatList);

  int maxChats = 2;
  int? totalChats;

  @override
  void initState() {
    widget.client.send(GetChats(chatList: widget.chatList, limit: 5)).then(
          (e) => totalChats = (e as Chats).totalCount,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool addArchive = widget.chatList is ChatListMain;
    return StreamBuilder(
      initialData: _chats,
      stream: widget.client.chatsInChatList(widget.chatList, _chats),
      builder: (_, data) {
        var chats = data.data as List<ChatOrder>;
        _chats = chats;
        if ((totalChats ?? double.infinity) > chats.length + 1) {
          return Center(
            child: Text(
              //TODO make cool loading animation
              "Load chats...\n${chats.length} / $totalChats",
              style: TextDisplay.create(
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        return SmoothListView(
          reverseScroll: true,
          itemCount: maxChats,
          scrollController: widget.scrollController,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          itemBuilder: (_, index) {
            if (addArchive) {
              if (index == 0) {
                return ChatItemDisplayArchiveNotHidden(
                  client: widget.client,
                );
              }
              index--;
            }
            if (index == maxChats - 2 && maxChats != _chats.length) {
              Future.delayed(
                Duration.zero,
                () => setState(
                  () =>
                      maxChats = clamp(maxChats + 10, 0, _chats.length).toInt(),
                ),
              );
            }
            var chatId = chats[index].chatId;
            return ChatItemDisplay(
              key: Key("ChatItemDisplay?id=$chatId"),
              onClick: () => UIEvents.selectChat(chatId, widget.client),
              chatId: chatId,
              client: widget.client,
              chatList: chats[0].position.list!,
            );
          },
        );
      },
    );
  }
}
