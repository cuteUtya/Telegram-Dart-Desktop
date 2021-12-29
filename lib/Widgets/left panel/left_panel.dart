import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_horizontal.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel(
      {Key? key, required this.client, required this.chatDisplayPointer})
      : super(key: key);
  final TelegramClient client;
  final GlobalKey<ChatDisplayState> chatDisplayPointer;

  @override
  Widget build(BuildContext context) {
    var listsManager = GlobalKey<ChatListsManagerState>();
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(children: [
          //settings and search
          Row(mainAxisSize: MainAxisSize.max, children: [
            const SizedBox(width: 12),
            //Settings icon
            const Icon(Icons.menu, size: 36),
            const SizedBox(width: 12),
            //search field
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    height: 36,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search, size: 18),
                          const SizedBox(width: 2),
                          client.buildTextByKey(
                              "lng_dlg_filter",
                              TextDisplay.create(
                                  size: 18,
                                  fontFamily: TextDisplay.greaterImportance)),
                        ]),
                    decoration: BoxDecoration(
                        color: ClientTheme.currentTheme
                            .getField("SearchBackground"),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))))),
          ]),
          const SizedBox(height: 12),
          ChatFilterHorizontal(
              client: client,
              onChatFiltersChange: (c) =>
                  listsManager.currentState?.setChatLists(c),
              onChatListSelect: (l) =>
                  listsManager.currentState?.setCurrentChatList(l)),
          const SeparatorLine(),
          Expanded(
              child: ChatListsManager(
                  key: listsManager,
                  client: client,
                  chatDisplayPointer: chatDisplayPointer))
        ]));
  }
}
