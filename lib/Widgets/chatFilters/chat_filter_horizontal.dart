import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_item_horizontal.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/global_key_extenstion.dart';

class ChatFilterFullInfo {
  ChatFilterFullInfo(
      {required this.id, required this.title, required this.key});
  String title;
  int id;
  GlobalKey key;
}

class ChatFilterHorizontal extends StatefulWidget {
  const ChatFilterHorizontal(
      {Key? key,
      required this.client,
      required this.onChatFiltersChange,
      required this.onChatListSelect})
      : super(key: key);
  final TelegramClient client;
  final Function(List<ChatList>) onChatFiltersChange;
  final Function(ChatList) onChatListSelect;
  @override
  State<StatefulWidget> createState() => ChatFilterHorizontalState();
}

class ChatFilterHorizontalState extends State<ChatFilterHorizontal> {
  static List<ChatFilterFullInfo> filters = [];
  static Map<int, int> unreadInFolders = {};
  static Map<int, int> unreadImportantInFolders = {};
  static int active = -1;

  void rebuildFilters(List<ChatFilterInfo> folders) {
    filters.clear();
    filters.add(ChatFilterFullInfo(
        id: -1,
        title: widget.client.getTranslation("lng_filters_all"),
        key: GlobalKey()));
    folders.forEach((element) {
      filters.add(ChatFilterFullInfo(
          id: element.id!, title: element.title!, key: GlobalKey()));
    });
    widget.onChatFiltersChange(<ChatList>[ChatListMain()] +
        folders.map((e) => ChatListFilter(chatFilterId: e.id)).toList());
    setState(() {});
  }

  void _processUnreadChatCountUpdates(UpdateUnreadChatCount update) {
    if (update.chatList is ChatListMain) {
      setState(() {
        unreadInFolders[-1] = update.unreadCount!;
        unreadImportantInFolders[-1] = update.unreadUnmutedCount!;
      });
    } else if (update.chatList is ChatListFilter) {
      setState(() {
        var id = (update.chatList as ChatListFilter).chatFilterId!;
        unreadInFolders[id] = update.unreadCount!;
        unreadImportantInFolders[id] = update.unreadUnmutedCount!;
      });
    }
  }

  List<StreamSubscription> _subsciptions = [];

  void _subcribeOnUpdates() {
    rebuildFilters(widget.client.chatFilterInfo ?? []);
    _subsciptions.add(widget.client.updateChatFilters.listen((event) {
      rebuildFilters(event.chatFilters!);
    }));
    widget.client.cachedUnreadChatCountUpdates
        .forEach((element) => _processUnreadChatCountUpdates(element));
    widget.client.cacheUnreadChatCountUpdates = false;
    widget.client.cachedUnreadChatCountUpdates.clear();

    _subsciptions.add(widget.client.updateUnreadChatCount
        .listen((event) => _processUnreadChatCountUpdates(event)));
  }

  @override
  void dispose() {
    _subsciptions.forEach((element) => element.cancel());
    super.dispose();
  }

  ScrollController _scrollController = ScrollController();

  bool _init = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (!_init) {
        _init = true;
        _subcribeOnUpdates();
        _scrollController.addListener(() => setState(() {}));
      }
    });
    if (filters.length <= 1) return const SizedBox.shrink();
    return Container(
        height: 36,
        margin: const EdgeInsets.only(left: 12),
        child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
            child: Stack(children: [
              ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (final filter in filters)
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: ChatFilterItemHorizontal(
                              key: filter.key,
                              unread: unreadInFolders[filter.id] ?? 0,
                              unreadMention:
                                  unreadImportantInFolders[filter.id] ?? 0,
                              onClick: (id) {
                                setState(() => active = id);
                                widget.onChatListSelect(id == -1
                                    ? ChatListMain()
                                    : ChatListFilter(chatFilterId: id));
                              },
                              info: filter,
                              active: filter.id == active))
                  ]),
              AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: ClientTheme.currentTheme
                          .getField("ChatFilterActiveColor"),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(4))),
                  height: 4,
                  width: _getCurrentFolderWidth(),
                  margin: EdgeInsets.only(
                      left: max(0, _getCurrentFolderLeftMargin()), top: 32))
            ])));
  }

  double _getCurrentFolderWidth() {
    var margin = _getCurrentFolderLeftMargin();
    return max(
        0,
        ((filters[max(active - 1, 0)].key.globalPaintBounds?.width) ?? 0) +
            (margin < 0 ? margin : 0));
  }

  double _getCurrentFolderLeftMargin() {
    return (filters[max(active - 1, 0)].key.globalPaintBounds?.left ?? 0) - 16;
  }
}
