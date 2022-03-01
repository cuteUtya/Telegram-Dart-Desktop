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
        pagesCount -1 ,
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
    }

    ///TODO if user make swipe in left make UIEvents.pop();

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
