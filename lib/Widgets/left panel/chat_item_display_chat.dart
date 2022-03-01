import 'package:flutter/material.dart';
import 'package:myapp/State managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
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
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text hide RichText;
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

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
    streamSubscriptions.add(UIEvents.selectedChat().listen((chats) {
      setState(() => selected = chats.isEmpty ? false : chats.last == widget.chatId);
    }));
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
    var chat = widget.client.getChat(widget.chatId);
    bool isPrivate =
        chat.type is ChatTypePrivate || chat.type is ChatTypeSecret;
    var interlocutorId = isPrivate ? (chat.type as dynamic).userId : null;
    var interlocutor =
        interlocutorId == null ? null : widget.client.getUser(interlocutorId!);
    var supergroup = chat.type is ChatTypeSupergroup
        ? widget.client
            .getSupergroup((chat.type as ChatTypeSupergroup).supergroupId!)
        : null;

    return /*StreamBuilder(
      stream: ,
      builder: (_, selectedSnapshot) {

        return*/
        ChatItemBase(
      selected: selected,
      onClick: () => widget.onClick?.call(),
      title: Row(
        children: [
          Expanded(
            child: isSavedMessages
                ? ChatItemTitle(
                    title: widget.client.getTranslation("lng_saved_messages"),
                    selected: selected,
                  )
                : StreamBuilder(
                    stream: isSavedMessages
                        ? null
                        : widget.client.senderName(
                            MessageSenderChat(chatId: widget.chatId)),
                    initialData: chat.title,
                    builder: (_, nameSnapshot) {
                      return ChatItemTitle(
                        selected: selected,
                        isBot:
                            interlocutor?.type is UserTypeBot && !isReplieChat,
                        isChannel: (supergroup?.isChannel) ?? false,
                        isChat: (supergroup != null &&
                                !(supergroup.isChannel ?? true)) ||
                            chat.type is ChatTypeBasicGroup,
                        title: (interlocutor?.type is UserTypeDeleted)
                            ? widget.client.getTranslation("lng_deleted")
                            : nameSnapshot.data.toString(),
                        isScam: chat.type is ChatTypeSupergroup
                            ? supergroup?.isScam ?? false
                            : interlocutor?.isScam ?? false,
                        isVerifed: supergroup?.isSlowModeEnabled ?? false,
                        isSupport: interlocutor?.isSupport ?? false,
                      );
                    },
                  ),
          ),
          StreamBuilder(
            initialData: chat.lastReadOutboxMessageId,
            stream: widget.client.chatReadOutboxOf(widget.chatId),
            builder: (context, data) {
              var value = false;
              if (data.hasData) {
                value = (widget.client.getChat(widget.chatId).lastMessage?.id ??
                        0) <=
                    (data.data as int);
              }
              if (!isSavedMessages &&
                  (widget.client
                          .getChat(widget.chatId)
                          .lastMessage
                          ?.isOutgoing ??
                      false)) {
                return CheckMark(
                  isReaded: value,
                  selected: selected,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(width: 2),
          StreamBuilder(
            initialData: chat.lastMessage,
            stream: widget.client.lastMessageIn(widget.chatId),
            builder: (_, lastMessageSnapshot) => Text(
              lastMessageSnapshot.data == null
                  ? ""
                  : getMessageTime(lastMessageSnapshot.data as Message),
              textAlign: TextAlign.right,
              style: TextDisplay.create(
                size: 18,
                textColor: ClientTheme.currentTheme.getField(selected
                    ? "SelectedChatLastTimedMessage"
                    : "ChatLastTimeMessage"),
              ),
            ),
          ),
        ],
      ),
      chatPic: isSavedMessages
          ? UserpicIcon(
              color: ClientTheme.currentTheme.getField("SaveMessagesBackColor"),
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
                        height: 64,
                        width: 64,
                        child: StreamBuilder(
                          stream: widget.client.photoOf(widget.chatId),
                          initialData: chat.photo,
                          builder: (_, data) {
                            var chatPhoto = data.data == null
                                ? null
                                : data.data as ChatPhotoInfo;
                            return Userpic(
                              key: Key(
                                "userpic#chatId?=${widget.chatId}fileId?=${chatPhoto?.big?.id}",
                              ),
                              chatPhotoInfo: data.hasData ? chatPhoto : null,
                              userId: widget.chatId,
                              userTitle: chat.title!,
                              client: widget.client,
                            );
                          },
                        ),
                      ),
                      if (interlocutor != null &&
                          interlocutor.type is UserTypeRegular)
                        StreamBuilder(
                          stream: widget.client.statusOf(interlocutor.id!),
                          initialData: interlocutor.status,
                          builder: (context, statusSnapshot) =>
                              OnlineIndicatorDidplay(
                            size: 20,
                            selected: selected,
                            online: statusSnapshot.data is UserStatusOnline,
                          ),
                        ),
                    ]),
                    StreamBuilder(
                      initialData: chat.unreadMentionCount!,
                      stream: widget.client.unreadMentionCountOf(widget.chatId),
                      builder: (context, data) => UnreadCountBubble(
                        count: data.hasData ? data.data as int : 0,
                        important: true,
                      ),
                    ),
                  ],
                ),
      unreadPlaceHolder: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<int>(
            initialData: chat.unreadReactionCount!,
            stream: widget.client.unreadReactionsIn(widget.chatId),
            builder: (_, data) {
              if ((data.data as int) <= 0) return const SizedBox.shrink();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
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
                      size: 18,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      data.data.toString(),
                      style: TextDisplay.create(
                        textColor: ClientTheme.currentTheme.getField(
                          selected
                              ? "ReactionsInChatListTextColorSelected"
                              : "ReactionsInChatListTextColor",
                        ),
                        size: 18,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          StreamBuilder(
            initialData: chat.unreadCount,
            stream: widget.client.unreadCountOf(widget.chatId),
            builder: (context, data) {
              if (data.hasData) {
                chat.unreadCount = data.data as int;
              }
              return StreamBuilder(
                initialData: chat.unreadMentionCount,
                stream: widget.client.unreadMentionCountOf(chat.id!),
                builder: (context, data1) {
                  if (data.hasData) {
                    chat.unreadMentionCount = (data1.data as int);
                  }
                  return Container(
                    margin:
                        EdgeInsets.only(left: chat.unreadCount! > 0 ? 4 : 0),
                    child: UnreadCountBubble(
                      count: chat.unreadCount!,
                      important: (chat.unreadMentionCount ?? 0) != 0,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      content: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: StreamBuilder(
            stream: widget.client.actionsOf(widget.chatId),
            builder: (_, actionsSnapshow) {
              if (actionsSnapshow.hasData) {
                var actions = actionsSnapshow.data as List<UpdateChatAction>;
                if (actions.isNotEmpty) {
                  return ChatItemActionDisplay(
                    chatSelected: selected,
                    isPrivate: isPrivate,
                    chatid: widget.chatId,
                    client: widget.client,
                    actions: actions,
                  );
                }
              }

              if (chat.lastMessage == null) return const Center();
              return MessageContentPreview(
                chatSelected: selected,
                message: chat.draftMessage == null ? chat.lastMessage : null,
                draftMessage: chat.draftMessage,
                fromChatType: chat.type!,
                client: widget.client,
              );
            },
          ),
        ),
      ),
      icon: pinned(chat)
          ? Icon(
              Icons.push_pin,
              color: ClientTheme.currentTheme.getField(
                  selected ? "SelectedChatPinIconColor" : "ChatPinIconColor"),
            )
          : null,
      //    );
      //   },
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
