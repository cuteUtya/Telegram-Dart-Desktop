import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_item_horizontal.dart';
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
  const ChatFilterHorizontal({Key? key, required this.client})
      : super(key: key);
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatFilterHorizontalState();
}

class ChatFilterHorizontalState extends State<ChatFilterHorizontal> {
  List<ChatFilterFullInfo> filters = [];
  int active = 0;

  void rebuildFilters(List<ChatFilterInfo> folders) {
    filters.clear();
    filters.add(ChatFilterFullInfo(
        id: 0,
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
    setState(() {});
  }

  @override
  void initState() {
    rebuildFilters(widget.client.chatFilterInfo ?? []);
    widget.client.updateChatFilters.listen((event) {
      rebuildFilters(event.chatFilters!);
    });
    widget.client.updateUnreadChatCount.listen((event) {
      print(json.encode(event));
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (filters.length <= 1) return const SizedBox.shrink();
    return Container(
        height: 36,
        margin: const EdgeInsets.only(left: 12),
        child: Expanded(
            child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: PointerDeviceKind.values.toSet(),
                ),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: filters
                        .map((filter) => ChatFilterItemHorizontal(
                            onClick: (id) => setState(() => active = id),
                            info: filter,
                            active: filter.id == active))
                        .toList()))));
  }
}
