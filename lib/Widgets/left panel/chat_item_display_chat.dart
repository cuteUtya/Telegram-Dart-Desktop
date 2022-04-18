import 'package:flutter/material.dart';
import 'package:myapp/Context%20menu/context_menu_config.dart';
import 'package:myapp/Context%20menu/context_menu_region.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Userpic/userpic_icon.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_base.dart';
import 'package:myapp/Widgets/check_mark.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_action_display.dart';
import 'package:myapp/Widgets/left%20panel/chat_item.content_display.dart/message_content_preview.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/left%20panel/chat_item_title.dart';
import 'package:myapp/Widgets/online_indicator_display.dart';
import 'package:myapp/Widgets/unread_mention_bubble.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';
import 'dart:collection';

class ChatItemDisplay extends StatefulWidget {
  const ChatItemDisplay({
    Key? key,
    required this.chatId,
    required this.client,
    required this.chatList,
    this.onClick,
  }) : super(key: key);

  final int chatId;
  final TelegramClient client;
  final ChatList chatList;
  final Function()? onClick;

  @override
  State<ChatItemDisplay> createState() => _ChatItemDisplayState();
}

class _ChatItemDisplayState
    extends StateWithStreamsSubscriptions<ChatItemDisplay> {
  bool pinned(Chat chat) =>
      chat.positions
          ?.firstWhereOrNull(
              (element) => chatListsEqual(element.list!, widget.chatList))
          ?.isPinned ??
      false;

  bool selected = false;

  @override
  void initState() {
    if (UIManager.useDesktopLayout) {
      streamSubscriptions.add(
        UIEvents.selectedChat().listen(
          (chats) {
            bool value = chats.isEmpty ? false : chats.last == widget.chatId;
            if (value != selected) {
              setState(() => selected = value);
            }
          },
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSavedMessages = widget.chatId ==
        widget.client.getOptionValue<OptionValueInteger>("my_id")?.value;
    bool isReplieChat = widget.chatId ==
        (widget.client
            .getOptionValue<OptionValueInteger>("replies_bot_chat_id")
            ?.value);
    var initialChat = widget.client.getChat(widget.chatId);
    bool isPrivate = initialChat.type is ChatTypePrivate ||
        initialChat.type is ChatTypeSecret;
    var interlocutorId =
        isPrivate ? (initialChat.type as dynamic).userId : null;
    var interlocutor =
        interlocutorId == null ? null : widget.client.getUser(interlocutorId!);
    var supergroup = initialChat.type is ChatTypeSupergroup
        ? widget.client.getSupergroup(
            (initialChat.type as ChatTypeSupergroup).supergroupId!)
        : null;

    return StreamBuilder(
      stream: widget.client.chatAnyUpdates(widget.chatId),
      builder: (_, data) {
        var chat = (data.data ?? initialChat) as Chat;
        var result = ChatItemBase(
          selected: selected,
          onClick: () => widget.onClick?.call(),
          title: Row(
            children: [
              Expanded(
                child: isSavedMessages
                    ? ChatItemTitle(
                        title:
                            widget.client.getTranslation("lng_saved_messages"),
                        selected: selected,
                      )
                    : ChatItemTitle(
                        selected: selected,
                        isBot:
                            interlocutor?.type is UserTypeBot && !isReplieChat,
                        isChannel: (supergroup?.isChannel) ?? false,
                        isChat: (supergroup != null &&
                                !(supergroup.isChannel ?? true)) ||
                            chat.type is ChatTypeBasicGroup,
                        title: (interlocutor?.type is UserTypeDeleted)
                            ? widget.client.getTranslation("lng_deleted")
                            : chat.title!,
                        isScam: chat.type is ChatTypeSupergroup
                            ? supergroup?.isScam ?? false
                            : interlocutor?.isScam ?? false,
                        isVerifed: supergroup?.isVerified ?? false,
                        isSupport: interlocutor?.isSupport ?? false,
                      ),
              ),
              if (!isSavedMessages &&
                  (widget.client
                          .getChat(widget.chatId)
                          .lastMessage
                          ?.isOutgoing ??
                      false))
                CheckMark(
                  isReaded: (chat.lastMessage?.id ?? 0) <=
                      chat.lastReadOutboxMessageId!,
                  selected: selected,
                  size: p(14),
                )
              else
                const SizedBox.shrink(),
              const SizedBox(width: 2),
              Text(
                chat.lastMessage == null
                    ? ""
                    : getMessageTime(chat.lastMessage as Message),
                textAlign: TextAlign.right,
                style: TextDisplay.create(
                  size: font(13),
                  textColor: ClientTheme.currentTheme.getField(selected
                      ? "SelectedChatLastTimedMessage"
                      : "ChatLastTimeMessage"),
                ),
              )
            ],
          ),
          chatPic: isSavedMessages
              ? UserpicIcon(
                  color: ClientTheme.currentTheme
                      .getField("SaveMessagesBackColor"),
                  iconColor:
                      ClientTheme.currentTheme.getField("SaveMessageIconColor"),
                  icon: Icons.bookmarks_outlined,
                )
              : isReplieChat
                  ? UserpicIcon(
                      color: ClientTheme.currentTheme
                          .getField("RepliesMessagesBackColor"),
                      iconColor: ClientTheme.currentTheme
                          .getField("RepliesMessageIconColor"),
                      icon: Icons.question_answer_outlined,
                    )
                  : Stack(
                      children: [
                        Stack(alignment: Alignment.bottomRight, children: [
                          SizedBox(
                            height: p(42),
                            width: p(42),
                            child: Userpic(
                              key: Key(
                                "userpic#chatId?=${widget.chatId}fileId?=${chat.photo?.big?.id}",
                              ),
                              chatPhotoInfo: chat.photo,
                              userId: widget.chatId,
                              userTitle: chat.title!,
                              client: widget.client,
                            ),
                          ),
                          if (interlocutor != null &&
                              interlocutor.type is UserTypeRegular)
                            StreamBuilder(
                              stream: widget.client.statusOf(interlocutor.id!),
                              initialData: interlocutor.status,
                              builder: (context, statusSnapshot) =>
                                  OnlineIndicatorDidplay(
                                size: p(14),
                                selected: selected,
                                online: statusSnapshot.data is UserStatusOnline,
                              ),
                            ),
                        ]),
                        UnreadCountBubble(
                          count: chat.unreadMentionCount!,
                          important: true,
                          fontSize: p(13),
                        )
                      ],
                    ),
          unreadPlaceHolder: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (chat.unreadReactionCount! <= 0)
                const SizedBox.shrink()
              else
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: p(4), vertical: p(1)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(p(12)),
                    ),
                    color: ClientTheme.currentTheme.getField(selected
                        ? "ReactionsInChatlistBackgroundColorSelected"
                        : "ReactionsInChatlistBackgroundColor"),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        ClientTheme.currentTheme
                            .getField("ReactionsInChatListIcon"),
                        color: ClientTheme.currentTheme.getField(
                          selected
                              ? "ReactionsInChatListIconColorSelected"
                              : "ReactionsInChatListIconColor",
                        ),
                        size: p(12),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        chat.unreadReactionCount.toString(),
                        style: TextDisplay.create(
                          textColor: ClientTheme.currentTheme.getField(
                            selected
                                ? "ReactionsInChatListTextColorSelected"
                                : "ReactionsInChatListTextColor",
                          ),
                          size: font(14),
                        ),
                      )
                    ],
                  ),
                ),
              Padding(
                padding:
                    EdgeInsets.only(left: chat.unreadCount! > 0 ? p(2) : 0),
                child: UnreadCountBubble(
                  count: chat.unreadCount!,
                  important: (chat.unreadMentionCount ?? 0) != 0,
                  fontSize: p(13),
                ),
              ),
            ],
          ),
          content: Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: p(6)),
              child: StreamBuilder(
                stream: widget.client.actionsOf(widget.chatId),
                builder: (_, actionsSnapshow) {
                  Widget content;
                  if (actionsSnapshow.hasData) {
                    var actions =
                        actionsSnapshow.data as List<UpdateChatAction>;
                    if (actions.isNotEmpty) {
                      content = ChatItemActionDisplay(
                        textColor: selected ? Colors.white : null,
                        isPrivate: isPrivate,
                        chatid: widget.chatId,
                        client: widget.client,
                        actions: actions,
                      );
                    }
                  }

                  if (chat.lastMessage == null && chat.lastMessage == null) {
                    content = const Center();
                  } else {
                    content = MessageContentPreview(
                      key: Key(
                          "messagePreview?from=${chat.messageSenderId?.toJson()}"),
                      textColor: selected ? Colors.white : null,
                      message:
                          chat.draftMessage == null ? chat.lastMessage : null,
                      draftMessage: chat.draftMessage,
                      fromChatType: chat.type!,
                      client: widget.client,
                      fontSize: font(14),
                      maxLines: ChatItemBase.contentLines,
                    );
                  }
                  return Stack(
                    children: [
                      content,

                      ///fake text placeholder that prevents chat resize if in it preview
                      ///contain only 1 line of text
                      if (ChatItemBase.contentLines == 2)
                        Text(
                          "1\n1",
                          style: TextStyle(
                            fontSize: font(14),
                            color: Colors.transparent,
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ),
          icon: pinned(chat)
              ? Icon(
                  Icons.push_pin,
                  size: p(16),
                  color: ClientTheme.currentTheme.getField(selected
                      ? "SelectedChatPinIconColor"
                      : "ChatPinIconColor"),
                )
              : null,
        );

        bool isArchived = chat.positions!.firstWhereOrNull(
                (e) => e.list is ChatListArchive && e.order != 0) !=
            null;
        bool isChatOrChannel = (chat.type is ChatTypeSupergroup ||
            chat.type is ChatTypeBasicGroup);

        return ContextMenuRegion(
          config: ContextMenuConfig(
            items: [
              ContextMenuItem(
                icon: isArchived
                    ? Icons.unarchive_outlined
                    : Icons.archive_outlined,
                text: widget.client.getTranslation(
                  isArchived ? "lng_archived_remove" : "lng_archived_add",
                ),
                onClick: () => widget.client.send(
                  AddChatToList(
                    chatId: chat.id,
                    chatList: isArchived ? ChatListMain() : ChatListArchive(),
                  ),
                ),
              ),
              ContextMenuItem(
                icon: Icons.push_pin_outlined,
                text: widget.client.getTranslation(
                  pinned(chat)
                      ? "lng_context_unpin_from_top"
                      : "lng_context_pin_to_top",
                ),
                onClick: () => widget.client.send(
                  ToggleChatIsPinned(
                    chatList: widget.chatList,
                    chatId: widget.chatId,
                    isPinned: !pinned(chat),
                  ),
                ),
              ),
              if (chat.lastMessage != null)
                ContextMenuItem(
                  icon: chat.unreadCount == 0
                      ? Icons.mark_chat_unread_outlined
                      : Icons.mark_chat_read_outlined,
                  text: widget.client.getTranslation(
                    chat.unreadCount == 0
                        ? "lng_context_mark_unread"
                        : "lng_context_mark_read",
                  ),
                  onClick: () {
                    widget.client.send(
                      ToggleChatIsMarkedAsUnread(
                        chatId: chat.id!,
                        isMarkedAsUnread: chat.unreadCount != 0,
                      ),
                    );
                    if (chat.unreadCount != 0) {
                      widget.client.send(ViewMessages(
                          chatId: chat.id,
                          forceRead: true,
                          messageIds: [chat.lastMessage!.id!]));
                    }
                  },
                ),
              ContextMenuItem(
                icon: isChatOrChannel
                    ? Icons.logout_rounded
                    : Icons.delete_outline,
                text: widget.client.getTranslation(
                  isChatOrChannel
                      ? "lng_profile_leave_group"
                      : "lng_profile_delete_conversation",
                ),
                destructiveAction: true,
                onClick: () => widget.client.send(
                  isChatOrChannel
                      ? LeaveChat(chatId: chat.id!)
                      : DeleteChat(chatId: chat.id!),
                ),
              ),
            ],
          ),
          child: result,
        );
      },
    );
  }

  String getMessageTime(Message? message) {
    if (message == null) return "";
    var time = unixToDateTime(message.date!);
    var now = DateTime.now();
    var deltaInDays = (DateTime.now().difference(time) +
            (const Duration(days: 1) -
                Duration(
                    hours: now.hour,
                    minutes: now.minute,
                    seconds: now.second,
                    milliseconds: now.millisecond)))
        .inDays;

    if (deltaInDays <= 0) {
      return getHHMM(time);
    } else if (deltaInDays <= 7 && time.weekday < now.weekday) {
      return "${widget.client.getTranslation("lng_weekday${time.weekday}")} (${getHHMM(time)})";
    }

    return "${to00format(time.day.toString())}.${to00format(time.month.toString())}.${time.year}";
  }
}
