import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Chat/action_bar_display.dart';
import 'package:myapp/Widgets/Chat/input_field.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/background_display.dart';

class ChatDisplay extends StatefulWidget {
  const ChatDisplay({Key? key, required this.client, this.chat})
      : super(key: key);
  final TelegramClient client;
  final Chat? chat;
  @override
  State<StatefulWidget> createState() => ChatDisplayState();
}

class ChatDisplayState extends State<ChatDisplay> {
  late Chat? chat = widget.chat;
  User? _user;
  Supergroup? _supergroup;
  BasicGroup? _basicGroup;

  void changeChat(Chat newchat) async {
    chat = newchat;
    if (chat?.type is ChatTypePrivate) {
      _supergroup = null;
      _basicGroup = null;
      _user = (await widget.client
              .send(GetUser(userId: (chat?.type as ChatTypePrivate).userId!)))
          as User;
    } else if (chat?.type is ChatTypeSecret) {
      _supergroup = null;
      _basicGroup = null;
      _user = (await widget.client
              .send(GetUser(userId: (chat?.type as ChatTypeSecret).userId!)))
          as User;
    } else if (chat?.type is ChatTypeBasicGroup) {
      _supergroup = null;
      _user = null;
      _basicGroup = (await widget.client.send(GetBasicGroup(
              basicGroupId: (chat?.type as ChatTypeBasicGroup).basicGroupId)))
          as BasicGroup;
    } else if (chat?.type is ChatTypeSupergroup) {
      _user = null;
      _basicGroup = null;
      _supergroup = (await widget.client.send(GetSupergroup(
              supergroupId: (chat?.type as ChatTypeSupergroup).supergroupId)))
          as Supergroup;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (chat == null) return const SizedBox.shrink();
    return Column(
      children: [
        ActionBarDisplay(
          client: widget.client,
          title: chat!.title!,
          status: _user?.status,
          isBot: _user?.type is UserTypeBot,
          isChannel: _supergroup?.isChannel ?? false,
          members: ((_supergroup?.isChannel ?? false)
                  ? null
                  : _supergroup?.memberCount) ??
              _basicGroup?.memberCount,
          membersOnline: 0,
          subscriptions: (_supergroup?.isChannel ?? false)
              ? _supergroup?.memberCount
              : null,
        ),
        Expanded(
            child: Stack(children: [
          BakgroundDisplay(
              client: widget.client,
              background: Background(
                  type: BackgroundTypeFill(
                      fill: BackgroundFillFreeformGradient(
                          colors: [0xFF8CB58C, 0xFFC9D38B, 0xFF8CB58C])))),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.all(24),
                  alignment: Alignment.bottomCenter,
                  child: InputField(client: widget.client)))
        ]))
      ],
    );
  }
}
