import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/button_icon.dart';
import 'package:myapp/Widgets/chatFilters/chat_filter_horizontal.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    Key? key,
    required this.client,
    this.onChatRevert,
  }) : super(key: key);

  final TelegramClient client;
  final VoidCallback? onChatRevert;

  static int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          ClientTheme.currentTheme.getField("FoldersAndSearchBackgroundColor"),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            //settings and search
            Row(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(width: p(8)),
              //Settings icon
              ButtonIcon(
                Icons.menu,
                size: p(24),
                color: ClientTheme.currentTheme.getField("GenericUIIconsColor"),
                onClick: () => client.send(GetBackgrounds()).then(
                      (backs) => client.send(
                        SetBackground(
                          forDarkTheme: true,
                          background: InputBackgroundRemote(
                            backgroundId: backs is Backgrounds
                                ? backs.backgrounds![++i].id!
                                : (backs as Background).id!,
                          ),
                        ),
                      ),
                    ),
              ),
              SizedBox(width: p(8)),
              //search field
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: p(8)),
                  height: p(24),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: p(14),
                          color: ClientTheme.currentTheme
                              .getField("GenericUIIconsColor"),
                        ),
                        const SizedBox(width: 2),
                        client.buildTextByKey(
                          "lng_dlg_filter",
                          TextDisplay.create(
                              size: p(14),
                              fontFamily: TextDisplay.greaterImportance,
                              textColor: ClientTheme.currentTheme
                                  .getField("SearchTextColor")),
                        ),
                      ]),
                  decoration: BoxDecoration(
                    color:
                        ClientTheme.currentTheme.getField("SearchBackground"),
                    borderRadius: BorderRadius.all(
                      Radius.circular(p(8)),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: p(8)),
            Expanded(
              child: Stack(
                children: [
                  ChatFilterHorizontal(client: client),
                  StreamBuilder(
                    stream: UIEvents.archiveState(),
                    builder: (_, data) {
                      bool archiveOpened = data.data == true;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease,
                        margin: EdgeInsets.only(
                          top: archiveOpened ? 0 : p(26),
                        ),
                        child: Column(
                          children: [
                            const SeparatorLine(),
                            Expanded(
                              child: ChatListsManager(
                                client: client,
                                onChatRevert: onChatRevert,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
