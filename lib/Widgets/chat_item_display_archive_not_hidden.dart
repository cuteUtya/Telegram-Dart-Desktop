import 'package:flutter/material.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:collection/collection.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide RichText;

class ChatItemDisplayArchiveNotHidden extends StatelessWidget {
  const ChatItemDisplayArchiveNotHidden(
      {Key? key, required this.client, required this.chats})
      : super(key: key);
  final TelegramClient client;
  final List<ChatFullInfo> chats;
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> content = [];
    var c = chats.where((element) {
      var archivePos = element.chat.positions!
          .firstWhereOrNull((e) => e.list is ChatListArchive);
      return archivePos != null && archivePos.order != 0;
    });
    c.forEach((element) => content.addAll(TextDisplay.parseEmojiInString(
            element.chat.title! + (element.chat.unreadCount! <= 0 ? ", " : ""),
            TextDisplay.create(
                size: 18,
                fontWeight: (element.chat.unreadCount ?? 0) <= 0
                    ? FontWeight.normal
                    : FontWeight.bold)) +
        [
          const WidgetSpan(child: SizedBox(width: 4)),
          WidgetSpan(
              child: UnreadCountBubble(
                  fontSize: 14,
                  count: element.chat.unreadCount!,
                  important: false /*TODO true if have notify */)),
          if (element.chat.unreadCount! > 0)
            TextSpan(text: ", ", style: TextDisplay.create(size: 18)),
        ]));
    return ChatItemBase(
        key: UniqueKey(),
        title: Row(children: [
          Text(client.getTranslation("lng_archived_name"),
              style: TextDisplay.chatTittle),
          const Spacer()
        ]),
        content: Expanded(
            child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: RichText(
                        maxLines: 2, text: TextSpan(children: content))))),
        chatPic: Container(
            child: Icon(Icons.archive,
                size: 36,
                color: ClientTheme.currentTheme
                    .getField("ArchoveNotHiddenIconColor")),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ClientTheme.currentTheme
                    .getField("ArchiveNotHiddenBackColor"))));
  }
}
