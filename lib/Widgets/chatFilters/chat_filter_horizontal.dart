import 'dart:async';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_item_horizontal.dart';
import 'package:myapp/Widgets/smooth_list_view.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/global_key_extenstion.dart';

class ChatFilterHorizontal extends StatefulWidget {
  const ChatFilterHorizontal({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => ChatFilterHorizontalState();
}

class ChatFilterHorizontalState extends StateWithStreamsSubscriptions<ChatFilterHorizontal> {
  static int active = -1;
  static List<ChatFilterInfo> filters = [];

  @override
  void initState() {
     streamSubscriptions.add(UIEvents.currentChatList().listen((event) {
      setState(() {
        active = event is ChatListMain
            ? -1
            : (event as ChatListFilter).chatFilterId!;
      });
    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      margin: const EdgeInsets.only(left: 12),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: PointerDeviceKind.values.toSet(),
        ),
        child: Stack(
          children: [
            StreamBuilder(
              key: UniqueKey(),
              initialData: filters,
              stream: widget.client.filters(),
              builder: (_, data) {
                List<ChatFilterInfo> filters = [];
                if (data.hasData) {
                  var f = data.data as List<ChatFilterInfo>;
                  UIEvents.changeChatList(
                    <ChatList>[ChatListMain()] +
                        (f
                            .map((e) => ChatListFilter(chatFilterId: e.id!))
                            .toList()),
                  );
                  filters.addAll(f);
                  ChatFilterHorizontalState.filters = filters;
                }
                filters = [
                      ChatFilterInfo(
                        id: -1,
                        title: widget.client.getTranslation("lng_filters_all"),
                      ),
                    ] +
                    filters;
                var items = [
                  for (final filter in filters)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: StreamBuilder(
                        stream: widget.client
                            .unreadIn(ChatListFilter(chatFilterId: filter.id)),
                        builder: (_, data) {
                          var unreadUpdate = data.data == null
                              ? null
                              : data.data as UpdateUnreadChatCount;
                          return ChatFilterItemHorizontal(
                            id: filter.id!,
                            title: filter.title!,
                            unread: unreadUpdate?.unreadCount ?? 0,
                            unreadUnmuted:
                                unreadUpdate?.unreadUnmutedCount ?? 0,
                            onClick: (id) {
                              UIEvents.selectChatList(id == -1
                                  ? ChatListMain()
                                  : ChatListFilter(chatFilterId: id));
                            },
                            active: filter.id == active,
                          );
                        },
                      ),
                    )
                ];
                return SmoothListView(
                  reverseScroll: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => items[i],
                  itemCount: items.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
