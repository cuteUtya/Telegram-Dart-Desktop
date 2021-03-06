import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/stream_builder_wrapper.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide RichText;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:myapp/utils.dart';

class ActionBarDisplay extends StatelessWidget {
  const ActionBarDisplay({
    Key? key,
    required this.client,
    required this.chat,
    required this.useBlurStyle,
    this.onChatRevert,
  }) : super(key: key);

  final TelegramClient client;
  final Chat chat;
  final VoidCallback? onChatRevert;
  final bool useBlurStyle;
  @override
  Widget build(BuildContext context) {
    User? user = getInterlocutor(chat, client);
    Supergroup? supergroup = chat.type is ChatTypeSupergroup
        ? client.getSupergroup((chat.type as ChatTypeSupergroup).supergroupId!)
        : null;
    BasicGroup? group = chat.type is ChatTypeBasicGroup
        ? client.getBasicGroup((chat.type as ChatTypeBasicGroup).basicGroupId!)
        : null;
    int membersCount = (group?.memberCount ?? supergroup?.memberCount) ?? 0;

    double height = p(48);

    var blurSize = SizedBox(
      width: double.infinity,
      height: height,
    );

    var title = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 4),
          StreamBuilderWrapper(
            stream: () => client.senderName(MessageSenderChat(chatId: chat.id)),
            initialData: client.getChatTitleSync(chat.id!),
            builder: (_, data) => ChatItemTitle(
              textColor:
                  ClientTheme.currentTheme.getField("ActionBarTitleColor"),
              selected: false,
              isBot: user?.type is UserTypeBot,
              isChannel: supergroup?.isChannel ?? false,
              isChat: !(supergroup?.isChannel ?? true),
              title: data.data.toString(),
              isScam: user?.isScam ?? false || (supergroup?.isScam ?? false),
              isVerifed: supergroup?.isVerified ?? false,
              isSupport: user?.isSupport ?? false,
            ),
          ),
          const SizedBox(height: 2),
          if (supergroup?.isChannel ?? false)
            client.buildTextByKey(
              "lng_chat_status_subscribers",
              TextDisplay.actionBarOffline,
              replacing: {"{count}": (supergroup?.memberCount ?? 0).toString()},
              itemsCount: supergroup?.memberCount ?? 0,
            )
          else if (user?.status != null)
            StreamBuilderWrapper(
              initialData: user!.status,
              stream: () => client.statusOf(user.id!),
              builder: (_, data) => data.hasData
                  ? _buildStatusText(
                      data.data as UserStatus, user.type is UserTypeBot)
                  : const SizedBox.shrink(),
            )
          else
            StreamBuilderWrapper(
              stream: () => client.onlineMemebersIn(chat.id!),
              builder: (_, data) {
                var onlineCount = (data.data ?? 0) as int;
                return client.buildTextByKey(
                  onlineCount > 0
                      ? "lng_chat_status_members_online"
                      : "lng_chat_status_members",
                  TextDisplay.actionBarOffline,
                  itemsCount: onlineCount,
                  replacing: {
                    "{count}": membersCount.toString(),
                    "{members_count}": client.getTranslation(
                        "lng_channel_members_link",
                        replacing: {"{count}": membersCount.toString()},
                        itemsCount: membersCount),
                    "{online_count}": client.getTranslation(
                        "lng_chat_status_online",
                        replacing: {"{count}": onlineCount.toString()},
                        itemsCount: onlineCount),
                  },
                );
              },
            ),
        ],
      ),
    );

    var closeBtn = Container(
      width: p(32),
      height: p(32),
      margin: EdgeInsets.only(left: p(8)),
      child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return ClientTheme.currentTheme.getField("CloseChatClickColor");
              }
              return Colors.transparent;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: Icon(
            Icons.arrow_back,
            color: ClientTheme.currentTheme.getField("CloseChatIconColor"),
          ),
          onPressed: onChatRevert),
    );

    var blur = ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          //TODO get this values from settings
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: blurSize,
      ),
    );

    return Container(
      height: height,
      color: useBlurStyle
          ? null
          : ClientTheme.currentTheme.getField("ActionBarColor"),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (useBlurStyle) blur,
          title,
          closeBtn,
        ],
      ),
    );
  }

  Widget _buildStatusText(UserStatus status, bool isBot) {
    String text = "";
    if (!isBot) {
      switch (status.runtimeType) {
        case UserStatusOnline:
          return Text(client.getTranslation("lng_status_online"),
              style: TextDisplay.create(
                  size: font(13),
                  textColor: ClientTheme.currentTheme
                      .getField("ActionBarOnlineTextColor")));
        case UserStatusEmpty:
          return const SizedBox.shrink();
        case UserStatusOffline:
          var lastOnline =
              unixToDateTime((status as UserStatusOffline).wasOnline!);
          var now = DateTime.now();
          var delta = (DateTime.now().difference(lastOnline) +
              (const Duration(days: 1) -
                  Duration(
                      hours: now.hour,
                      minutes: now.minute,
                      seconds: now.second,
                      milliseconds: now.millisecond)));
          if (delta.inDays <= 0) {
            text = client.getTranslation("lng_status_lastseen_today",
                replacing: {"{time}": getHHMM(lastOnline)});
          } else if (delta.inDays <= 1) {
            text = client.getTranslation("lng_status_lastseen_yesterday",
                replacing: {"{time}": getHHMM(lastOnline)});
          } else if (delta.inDays <= 7) {
            text = client.getTranslation("lng_status_last_week");
          } else {
            text = client.getTranslation("lng_status_last_month");
          }
          break;
        case UserStatusRecently:
          text = client.getTranslation("lng_status_recently");
          break;
        case UserStatusLastWeek:
          text = client.getTranslation("lng_status_last_week");
          break;
        case UserStatusLastMonth:
          text = client.getTranslation("lng_status_last_month");
          break;
      }
    } else {
      text = client.getTranslation("lng_status_bot");
    }
    return Text(
      text,
      style: TextDisplay.actionBarOffline,
    );
  }
}
