import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

class AppMainMobile extends StatefulWidget {
  const AppMainMobile({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  State<StatefulWidget> createState() => _AppMainMobileState();
}

class _AppMainMobileState extends State<AppMainMobile> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    int pagesCount = 1;

    void switchToLastPage() {
      pageController.animateToPage(
        pagesCount - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
    }

    var lPage = 0;
    pageController.addListener(
      () {
        var c = pageController.page ?? 1;
        var remainder = c.toDouble() - (c.toInt().toDouble());
        var intgr = remainder < 0.01
            ? c.toInt()
            : remainder > 0.99
                ? c.toInt() + 1
                : null;
        if (intgr != null) {
          if (intgr < lPage) {
            UIEvents.popChat(widget.client);
          }
          lPage = intgr;
        }
      },
    );

    ///TODO if user make swipe in left make

    return StreamBuilder(
      initialData: const <int>[],
      stream: UIEvents.selectedChat(),
      builder: (_, data) {
        var childs = [
          LeftPanel(
            client: widget.client,
          ),
          for (final e in data.data as List<int>)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ChatDisplay(
                client: widget.client,
                chatId: e,
              ),
            ),
        ];
        pagesCount = childs.length;
        //print(pageController.hasClients);
        if (pageController.hasClients) {
          switchToLastPage();
        }
        return PageView(
          controller: pageController,
          children: childs,
        );
      },
    );
  }
}
