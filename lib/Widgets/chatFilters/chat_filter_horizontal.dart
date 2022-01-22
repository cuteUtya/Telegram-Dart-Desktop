import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/StateManagment/ui_events.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_item_horizontal.dart';
import 'package:myapp/Widgets/smooth_desktop_list_view.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/global_key_extenstion.dart';

class ChatFilterHorizontal extends StatefulWidget {
  const ChatFilterHorizontal({Key? key, required this.client})
      : super(key: key);
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatFilterHorizontalState();
}

class ChatFilterHorizontalState extends State<ChatFilterHorizontal> {
  static int active = -1;
  final Map<int, GlobalKey> _filtersKeys = {};

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        margin: const EdgeInsets.only(left: 12),
        child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: PointerDeviceKind.values.toSet(),
            ),
            child: Stack(children: [
              StreamBuilder(
                  stream: widget.client.filters(),
                  builder: (_, data) {
                    var filters = <ChatFilterInfo>[
                      ChatFilterInfo(
                          id: -1,
                          title:
                              widget.client.getTranslation("lng_filters_all"))
                    ];
                    if (data.hasData) {
                      var f = data.data as List<ChatFilterInfo>;
                      UIEvents.changeChatList(<ChatList>[ChatListMain()] +
                          (f
                              .map((e) => ChatListFilter(chatFilterId: e.id!))
                              .toList()));
                      filters.addAll(f);
                    }
                    for (var e in filters) {
                      if (_filtersKeys[e.id!] == null) {
                        _filtersKeys[e.id!] = GlobalKey();
                      }
                    }
                    var items = [
                      for (final filter in filters)
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: StreamBuilder(
                                stream: widget.client.unreadIn(
                                    ChatListFilter(chatFilterId: filter.id)),
                                builder: (_, data) {
                                  var unreadUpdate = data.data == null
                                      ? null
                                      : data.data as UpdateUnreadChatCount;
                                  return ChatFilterItemHorizontal(
                                      key: _filtersKeys[filter.id!],
                                      id: filter.id!,
                                      title: filter.title!,
                                      unread: unreadUpdate?.unreadCount ?? 0,
                                      unreadUnmuted:
                                          unreadUpdate?.unreadUnmutedCount ?? 0,
                                      onClick: (id) {
                                        setState(() => active = id);
                                        UIEvents.selectChatList(id == -1
                                            ? ChatListMain()
                                            : ChatListFilter(chatFilterId: id));
                                      },
                                      active: filter.id == active);
                                }))
                    ];
                    return SmoothDesktopListView(
                      reverseScroll: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => items[i],
                      itemCount: items.length,
                    );
                  }),
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
        ((_filtersKeys[active]?.globalPaintBounds?.width) ?? 0) +
            (margin < 0 ? margin : 0));
  }

  double _getCurrentFolderLeftMargin() {
    return (_filtersKeys[active]?.globalPaintBounds?.left ?? 0) - 16;
  }
}
