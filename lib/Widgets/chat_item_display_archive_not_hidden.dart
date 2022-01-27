import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Userpic/userpic_icon.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ChatItemDisplayArchiveNotHidden extends StatelessWidget {
  const ChatItemDisplayArchiveNotHidden({
    Key? key,
    required this.client,
    required this.chats,
  }) : super(key: key);

  final TelegramClient client;
  final List<ChatOrder> chats;
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> content = [];
    for (var element in sortChatsFor(chats, ChatListArchive())) {
      var chat = client.getChat(element.chatId);
      content.addAll([TextDisplay.parseEmojiInString(
            chat.title! + (chat.unreadCount! <= 0 ? ", " : ""),
            TextDisplay.create(
              textColor: ClientTheme.currentTheme.getField("ArchiveContentColor"),
              size: 18,
              fontWeight: (chat.unreadCount ?? 0) <= 0 ? FontWeight.normal : FontWeight.bold,
            ),
          ),
            const WidgetSpan(child: SizedBox(width: 4)),
            WidgetSpan(
              child: StreamBuilder(
                stream: client.unreadCountOf(chat.id!),
                builder: (_, data) => UnreadCountBubble(
                  fontSize: 14,
                  count: (data.data ?? chat.unreadCount!) as int,
                  important: false /*TODO true if have notify */,
                ),
              ),
            ),
            if (chat.unreadCount! > 0)
              TextSpan(
                text: ", ",
                style: TextDisplay.create(size: 18),
              ),
          ]);
    }
    return ChatItemBase(
      selected: false,
      onClick: () => UIEvents.openArchive(),
      key: UniqueKey(),
      title: Row(
        children: [
          Text(client.getTranslation("lng_archived_name"), style: TextDisplay.chatTittle),
          const Spacer(),
        ],
      ),
      content: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: RichText(
              maxLines: 2,
              text: TextSpan(children: content),
            ),
          ),
        ),
      ),
      chatPic: UserpicIcon(
        color: ClientTheme.currentTheme.getField("ArchiveNotHiddenBackColor"),
        icon: Icons.archive,
        iconColor: ClientTheme.currentTheme.getField(
          "ArchoveNotHiddenIconColor",
        ),
      ),
    );
  }
}
