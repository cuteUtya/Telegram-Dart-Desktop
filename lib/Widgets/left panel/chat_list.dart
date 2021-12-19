import 'package:flutter/material.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';

class ChatListDisplay extends StatelessWidget {
  const ChatListDisplay(
      {Key? key,
      required this.client,
      required this.chatList,
      required this.chats})
      : super(key: key);
  final TelegramClient client;
  final ChatList chatList;
  final List<ChatFullInfo> chats;

  @override
  Widget build(BuildContext context) {
    try {
      var list = chats
          .where((element) =>
              showChatInChatList(element.chat.positions!, chatList))
          .sorted((b, a) => a.chat.positions!
              .firstWhere((e) => compareChatlists(e.list!, chatList))
              .order!
              .compareTo(b.chat.positions!
                  .firstWhere((e) => compareChatlists(e.list!, chatList))
                  .order!));
      int order = -1;

      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (index >= list.length) return Container();
            print("ELEMENT AT $index == ${list[index]}");
            return ChatItemDisplay(
                chat: list[index].chat,
                client: client,
                interlocutor: list[index].interlocutor,
                supergroup: list[index].supergroup,
                joinInfo: list[index].joinInfo,
                lastMessageSenderName: list[index].lastMessageSenderName,
                order: order,
                chatList: chatList);
          });
    } catch (_) {
      return Container();
    }
  }
  /*@override
  State<ChatListDisplay> createState() => _ChatListDisplayState();*/
}

/*
class _ChatListDisplayState extends State<ChatListDisplay> {
  late List<ChatFullInfo> chats = widget.chats;
  /*void updateChats() {
    widget.client.send(LoadChats(chatList: widget.chatList, limit: 25));
  }

  
*/
/*
  void updateShouldDraw() {
    chats.forEach((element) {
      var draw = shouldDraw(element.order);
      if (element.key.currentState?.shouldDraw != draw &&
          (element.key.currentState == null
              ? false
              : element.key.currentState!.mounted)) {
        element..currentState?.updateShouldDrawOption(draw);
      }
    });
  }*/

  /*void sortItems() {
    for (int i = chats.length - 1; i > 0; i--) {
      bool havePosInCurrChatList = false;
      chats[i].chat.positions!.forEach((pos) {
        if (compareChatlists(pos.list!, widget.chatList)) {
          havePosInCurrChatList = true;
        }
      });
      if (!havePosInCurrChatList) chats.removeAt(i);
    }

    chats.sort((a, b) {
      var aPos = a.chat.positions!.firstWhere((e) {
        return compareChatlists(e.list!, widget.chatList);
      });
      var bPos = b.chat.positions!
          .firstWhere((e) => compareChatlists(e.list!, widget.chatList));

      return bPos.order!.compareTo(aPos.order!);
    });
    for (int order = 0; order < chats.length; order++) {
      if (order != chats[order].order) {
        chats[order].order = order;
        chats[order].key.currentState?.reOrder(order);
      }
    }
  }
*/
  /*
  @override
  void initState() {
   /* updateChats();
    listenChatPosition();
*/
    
    //listViewContoller.addListener(updateShouldDraw);
    super.initState();
  }

  static const double cachedItems = 240;

  bool shouldDraw(int order) {
    if (!listViewContoller.hasClients) return true;
    var myPosition = -listViewContoller.offset + order * 88;
    return !(myPosition - cachedItems > MediaQuery.of(context).size.height ||
        myPosition + 88 + cachedItems < 0);
  }*/

  //List<_ChatFullInfo> chats = [];
  //ScrollController listViewContoller = ScrollController();
  @override
  Widget build(BuildContext context) {
    //if (chats.isEmpty) return const SizedBox(height: 30);
    
  }
}
*/