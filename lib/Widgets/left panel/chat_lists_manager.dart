import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Widgets/left%20panel/chat_list.dart';
import 'package:myapp/Widgets/revertible_page.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'package:myapp/utils.dart';

class ChatListsManager extends StatefulWidget {
  const ChatListsManager({
    Key? key,
    required this.client,
    this.onChatRevert,
  }) : super(key: key);
  final TelegramClient client;
  final VoidCallback? onChatRevert;
  @override
  State<StatefulWidget> createState() => ChatListsManagerState();
}

class ChatListsManagerState extends StateWithStreamsSubscriptions<ChatListsManager> {
  List<ChatList> folders = [];
  PageController archiveContoller = PageController();
  PageController foldersContoller = PageController();

  @override
  void initState() {
    widget.client.send(LoadChats(chatList: ChatListMain(), limit: 50));
    widget.client.send(LoadChats(chatList: ChatListArchive(), limit: 20));

    streamSubscriptions.add(UIEvents.chatLists().listen((event) {
      setState(() => folders = event);
    }));
    streamSubscriptions.add(UIEvents.archiveState().listen((opened) {
      archiveContoller.jumpToPage(opened ? 1 : 0);
    }));
    streamSubscriptions.add(UIEvents.currentChatList().listen((event) {
      foldersContoller.animateToPage(
        folders.indexOf(folders.firstWhere((element) => chatListsEqual(element, event))),
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
      );
    }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: archiveContoller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PageView.builder(
          controller: foldersContoller,
          itemCount: folders.length,
          itemBuilder: (_, index) => ChatListDisplay(
            client: widget.client,
            chatList: folders[index],
          ),
        ),
        RevertiblePage(
          onRevert: () => UIEvents.closeArchive(),
          title: widget.client.getTranslation("lng_archived_name"),
          content: Expanded(
            child: ChatListDisplay(
              chatList: ChatListArchive(),
              client: widget.client,
            ),
          ),
        ),
      ],
    );
  }
}
