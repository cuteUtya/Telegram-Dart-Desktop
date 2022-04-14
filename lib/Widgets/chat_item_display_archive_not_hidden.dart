import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/Userpic/userpic_icon.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_lists_manager.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';

class ChatItemDisplayArchiveNotHidden extends StatefulWidget {
  const ChatItemDisplayArchiveNotHidden({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  State<ChatItemDisplayArchiveNotHidden> createState() =>
      _ChatItemDisplayArchiveNotHiddenState();
}

class _ChatItemDisplayArchiveNotHiddenState
    extends State<ChatItemDisplayArchiveNotHidden> {
  late List<ChatOrder> _chats =
      widget.client.getChatsInChatListSync(ChatListArchive());

  @override
  Widget build(BuildContext context) {
    var textColor = ClientTheme.currentTheme.getField("ArchiveContentColor");
    return StreamBuilder(
      initialData: _chats,
      stream: widget.client.chatsInChatList(ChatListArchive(), _chats),
      builder: (_, data) {
        List<InlineSpan> content = [];
        var chats = data.data as List<ChatOrder>;
        _chats = chats;
        for (var element in chats) {
          var chat = widget.client.getChat(element.chatId);
          content.add(TextSpan(children: [
            TextDisplay.parseEmojiInString(
              chat.title!,
              TextDisplay.create(
                size: font(13),
                fontWeight: (chat.unreadCount ?? 0) <= 0
                    ? FontWeight.normal
                    : FontWeight.bold,
              ),
            ),
            WidgetSpan(
              child: StreamBuilder(
                initialData: chat.unreadCount!,
                stream: widget.client.unreadCountOf(chat.id!),
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
        if (chats.isEmpty) return const SizedBox.shrink();

        return ChatItemBase(
          selected: false,
          onClick: () => UIEvents.openArchive(),
          title: Row(
            children: [
              Text(widget.client.getTranslation("lng_archived_name"),
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
                  maxLines: ChatItemBase.contentLines,
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
