import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_item_horizontal.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class ChatFilterFullInfo {
  ChatFilterFullInfo(
      {required this.id,
      required this.title,
      required this.unread,
      required this.unreadImportante});
  String title;
  int unread;
  int unreadImportante;
  int id;
}

class ChatFilterHorizontal extends StatefulWidget {
  const ChatFilterHorizontal(
      {Key? key,
      required this.client,
      //required this.onChatListChange,
      required this.chatListState})
      : super(key: key);
  final TelegramClient client;
  //final Function(ChatList list) onChatListChange;
  final GlobalKey<ChatListsManagerState> chatListState;
  @override
  State<StatefulWidget> createState() => ChatFilterHorizontalState();
}

class ChatFilterHorizontalState extends State<ChatFilterHorizontal> {
  static List<ChatFilterFullInfo> filters = [];
  static int active = -1;

  void rebuildFilters(List<ChatFilterInfo> folders) {
    filters.clear();
    filters.add(ChatFilterFullInfo(
        id: -1,
        title: widget.client.getTranslation("lng_filters_all"),
        unread: 0,
        unreadImportante: 0));
    folders.forEach((element) {
      filters.add(ChatFilterFullInfo(
          id: element.id!,
          title: element.title!,
          unread: 0,
          unreadImportante: 0));
    });
    widget.chatListState.currentState?.setChatLists(<ChatList>[ChatListMain()] +
        folders.map((e) => ChatListFilter(chatFilterId: e.id)).toList());
    setState(() {});
  }

  bool _init = false;

  void _subcribeOnUpdates() {
    _init = true;
    rebuildFilters(widget.client.chatFilterInfo ?? []);
    widget.client.updateChatFilters.listen((event) {
      rebuildFilters(event.chatFilters!);
    });
    widget.client.updateUnreadChatCount.listen((event) {
      if (event.chatList is ChatListMain) {
        setState(() {
          filters[0].unread = event.unreadCount!;
          filters[0].unreadImportante = event.unreadUnmutedCount!;
        });
      } else if (event.chatList is ChatListFilter) {
        setState(() {
          var folder = filters.firstWhere(
              (e) => e.id == (event.chatList as ChatListFilter).chatFilterId);
          folder.unread = event.unreadCount!;
          folder.unreadImportante = event.unreadUnmutedCount!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!_init) _subcribeOnUpdates();
    });
    if (filters.length <= 1) return const SizedBox.shrink();
    return Container(
        height: 36,
        margin: const EdgeInsets.only(left: 12),
        child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: filters
                    .map((filter) => ChatFilterItemHorizontal(
                        onClick: (id) {
                          setState(() => active = id);
                          widget.chatListState.currentState?.setCurrentChatList(
                              id == -1
                                  ? ChatListMain()
                                  : ChatListFilter(chatFilterId: id));
                        },
                        info: filter,
                        active: filter.id == active))
                    .toList())));
  }
}
