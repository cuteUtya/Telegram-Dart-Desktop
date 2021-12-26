import 'package:flutter/cupertino.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ActionBarDisplay extends StatelessWidget {
  const ActionBarDisplay(
      {Key? key,
      required this.client,
      required this.title,
      this.status,
      this.isBot = false,
      this.members,
      this.membersOnline,
      this.subscriptions})
      : super(key: key);
  final TelegramClient client;
  final String title;
  final UserStatus? status;
  final bool isBot;
  final int? subscriptions;
  final int? members;
  final int? membersOnline;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: ClientTheme.currentTheme.getField("ActionBarColor"),
        child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Column(children: [
              RichText(
                  text: TextSpan(
                      children: TextDisplay.parseEmojiInString(
                          title,
                          TextDisplay.create(
                              size: 18,
                              fontWeight: FontWeight.bold,
                              textColor: TextColor.HeaderMain)))),
              const SizedBox(height: 2),
              _buildSecondLine()
            ])));
  }

  Widget _buildSecondLine() {
    var text = "";
    if (status != null) {
      if (!isBot) {
        switch (status.runtimeType) {
          case UserStatusOnline:
            return Text(client.getTranslation("lng_status_online"),
                style: TextDisplay.create(
                    size: 16, textColor: TextColor.OnlineColor));
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
    }

    if (subscriptions != null) {
      text = client.getTranslation("lng_chat_status_subscribers",
          itemsCount: subscriptions,
          replacing: {"{count}": subscriptions.toString()});
    }

    if (members != null && membersOnline != null) {
      text =
          client.getTranslation("lng_chat_status_members_online", replacing: {
        "{members_count}": client.getTranslation("lng_channel_members_link",
            replacing: {"{count}": members.toString()}, itemsCount: members),
        "{online_count}": client.getTranslation("lng_chat_status_online",
            replacing: {"{count}": membersOnline.toString()},
            itemsCount: membersOnline)
      });
    }

    return Text(text, style: TextDisplay.actionBarOffline);
  }
}
