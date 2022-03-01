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
  }) : super(key: key);

  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    var textColor = ClientTheme.currentTheme.getField("ArchiveContentColor");
    return StreamBuilder(
     initialData: const <ChatOrder>[],
      stream: client.chatsInChatList(ChatListArchive()),
      builder: (_, data) {
        List<InlineSpan> content = [];
        var chats = data.data as List<ChatOrder>;
        for (var element in chats) {
          var chat = client.getChat(element.chatId);
          content.add(TextSpan(children: [
            TextDisplay.parseEmojiInString(
              chat.title!,
              TextDisplay.create(
                size: 18,
                fontWeight: (chat.unreadCount ?? 0) <= 0
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
            WidgetSpan(
              child: StreamBuilder(
                initialData: chat.unreadCount!,
                stream: client.unreadCountOf(chat.id!),
                builder: (_, data) => Container(
                  margin: data.data as int == 0
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(left: 4),
                  child: UnreadCountBubble(
                    fontSize: 14,
                    count: data.data as int,
                    important: false /*TODO true if have notify */,
                  ),
                ),
              ),
            ),
            TextSpan(
                text: ", ",
                style: TextDisplay.create(
                  size: 14,
                  textColor: textColor,
                ))
          ]));
        }
        return ChatItemBase(
          selected: false,
          onClick: () => UIEvents.openArchive(),
          title: Row(
            children: [
              Text(client.getTranslation("lng_archived_name"),
                  style: TextDisplay.chatTittle),
              const Spacer(),
            ],
          ),
          content: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ExcludeSemantics(
                excluding: true,
                child: Text.rich(
                  TextSpan(children: content),
                  maxLines: 2,
                ),
              ),
            ),
          ),
          chatPic: UserpicIcon(
            color:
                ClientTheme.currentTheme.getField("ArchiveNotHiddenBackColor"),
            icon: Icons.archive,
            iconColor: ClientTheme.currentTheme.getField(
              "ArchoveNotHiddenIconColor",
            ),
          ),
        );
      },
    );
  }
}
