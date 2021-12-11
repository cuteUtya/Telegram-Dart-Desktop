import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/tdlib/client.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  State<LeftPanel> createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
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
                          widget.client.buildTextByKey(
                              "lng_dlg_filter",
                              TextDisplay.create(
                                  size: 18,
                                  fontFamily: TextFont.greaterImportance)),
                        ]),
                    decoration: BoxDecoration(
                        color: ClientTheme.currentTheme
                            .getField("SearchBackground"),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))))),
          ]),
          const SizedBox(height: 44),
          const HorizontalSeparatorLine(),
          ChatListDisplay(client: widget.client)
        ],
      ),
    );
  }
}
