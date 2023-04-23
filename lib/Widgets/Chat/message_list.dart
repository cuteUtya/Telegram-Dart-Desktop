import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:async/src/stream_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:myapp/Context%20menu/context_menu_config.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/blured_widget.dart';
import 'package:myapp/Widgets/date_bubble.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/horizontal_separator_line.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/Widgets/smooth_list_view.dart';
import 'package:myapp/Widgets/stream_builder_wrapper.dart';
import 'package:myapp/safe_spacer.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MessageList extends StatefulWidget {
  const MessageList({
    Key? key,
    required this.chatId,
    required this.client,
  }) : super(key: key);

  final int chatId;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Messages? messages;
  bool loadedFirstMessage = false;
  List<ChatAdministrator> admins = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  static const List<Type> serviceMessages = [
    MessageVideoChatStarted,
    MessageVideoChatEnded,
    MessageBasicGroupChatCreate,
    MessageSupergroupChatCreate,
    MessageChatChangeTitle,
    MessageChatChangePhoto,
    MessageChatDeletePhoto,
    MessageChatSetTheme,
  ];

  Future loadMessages(int limit, int fromMessageId, int offset,
      [VoidCallback? onLoad]) async {
    var msgs = await widget.client.send(
      GetChatHistory(
        chatId: widget.chatId,
        fromMessageId: fromMessageId,
        limit: limit,
        offset: offset,
      ),
    );
    if (msgs is! Messages) {
      print(msgs.toJson());
      return;
    }
    if (offset == 0 && (msgs.messages?.length ?? 1) == 0) {
      loadedFirstMessage = true;
    }

    if (mounted) {
      setState(
        () {
          if (messages == null) {
            messages = msgs;
          } else {
            messages!.totalCount = messages!.totalCount! + msgs.totalCount!;
            messages!.messages!.addAll(msgs.messages!);
            messages!.messages!.sort((a, b) => b.id!.compareTo(a.id!));

            var result = messages!.messages!;
            for (int i = 0; i < result.length; i++) {
              for (int j = 1; j < messages!.messages!.length; j++) {
                if (messages!.messages![i].id == result[j].id && i != j) {
                  result.removeAt(j);
                }
              }
            }
          }
          onLoad?.call();
        },
      );
    }
  }

  @override
  void initState() {
    initialLoad();
    widget.client.send(GetChatAdministrators(chatId: widget.chatId)).then(
      (adm) {
        if (adm is ChatAdministrators) {
          setState(() => admins = adm.administrators!);
        }
      },
    );
    super.initState();
  }

  void initialLoad() async {
    var chat = widget.client.getChat(widget.chatId);
    bool haveUnread = chat.unreadCount != 0;
    startLoadMoreMessagesBelow = true;
    var offset = -min(chat.unreadCount!, 50);

    await loadMessages(
      50,
      chat.lastReadInboxMessageId!,
      offset,
    );
    print(messages?.messages?.length);
    await loadMessages(
      50,
      chat.lastReadInboxMessageId!,
      -1,
    );

    Future.delayed(
      Duration.zero,
      () {
        if (haveUnread) {
          itemScrollController.jumpTo(
            index: -offset,
            alignment: 0.1,
          );
          firstUnreadMessageId = messages!.messages![-offset].id!;
          startLoadMoreMessagesBelow = false;
        }
        itemPositionsListener.itemPositions.addListener(
          () {
            var readed =
                itemPositionsListener.itemPositions.value.map((e) => e.index);

            if (messages!.messages!.length >=
                itemPositionsListener.itemPositions.value.length) {
              widget.client.send(
                ViewMessages(
                  chatId: widget.chatId,
                  messageIds: readed
                      .map(
                        (e) => e == -1 ? 0 : messages!.messages![e].id!,
                      )
                      .toList(),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Map<int, List<Message>> albums = {};
  Map<int, Size> itemsSize = {};

  void shiftIndexes(int shift) {
    var position = itemPositionsListener.itemPositions.value.reduce(
      (a, b) => a.index < b.index ? a : b,
    );
    itemScrollController.jumpTo(
      index: position.index + shift,
      alignment: position.itemLeadingEdge,
    );
  }

  void deleteHandler(Message message) {
    Future.delayed(
      Duration.zero,
      () => setState(
        () {
          messages!.messages!.removeWhere(
            (element) => element.id == message.id,
          );
        },
      ),
    );
  }

  bool startLoadMoreMessagesBelow = false;
  int firstUnreadMessageId = 0;

  @override
  Widget build(BuildContext context) {
    int messagesCount = (messages?.messages?.length ?? 0);
    var chat = widget.client.getChat(widget.chatId);

    albums = {};
    print('build list with $messagesCount messages');
    var result = ScrollablePositionedList.builder(
      reverse: true,
      minCacheExtent: 500,
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemCount: messagesCount,
      itemBuilder: (context, index) {
        if (index == messagesCount - 1 || index == 0) {
          if (messages?.messages != null) {
            if (index == 0 &&
                messages!.messages?.first.id != chat.lastMessage!.id &&
                !startLoadMoreMessagesBelow) {
              startLoadMoreMessagesBelow = true;
              int count = messages!.messages!.length;

              ///TODO: bug, skipped messages
              loadMessages(
                30,
                messages!.messages!.first.id!,
                -30,
                () {
                  int loaded = messages!.messages!.length - count;
                  Future.delayed(
                    Duration.zero,
                    () {
                      shiftIndexes(loaded);
                      startLoadMoreMessagesBelow = false;
                    },
                  );
                },
              );
            }
            if (index == messagesCount - 1) {
              // if we havent messages - that mean what we alreade called
              // loadMessages in start of build method
              if (messagesCount != 0 && !loadedFirstMessage) {
                loadMessages(25, messages?.messages?.last.id ?? 0, 0);
              }
            }
          }
        }

        if (index >= messagesCount || index < 0) {
          return SizedBox(
            height: 100,
            child: Text(
              "$index",
            ),
          );
        }
        return buildMessage(index);
      },
    );
    return Stack(
      children: [
        result,
        StreamBuilderWrapper(
            stream: () => widget.client.newMessagesIn(widget.chatId),
            cleanupDataAfterBuild: true,
            builder: (_, data) {
              if (data.hasData) {
                var update = data.data as Message;
                if (messages?.messages?.first.id == update.id) {
                  return null;
                }
                Future.delayed(
                  Duration.zero,
                  () => setState(
                    () {
                      messages?.messages = [update] + messages!.messages!;
                      shiftIndexes(1);
                    },
                  ),
                );
              }
              return null;
            })
      ],
    );
  }

  double get messageWidth => UIManager.useDesktopLayout
      ? 400
      : MediaQuery.of(context).size.width * 0.75;

  Widget buildMessage(int index) {
    var chat = widget.client.getChat(widget.chatId);
    var msg = messages!.messages![index];

    var previus = (index - 1 < 0 ? null : messages!.messages![index - 1]);
    var next = (index + 1 >= messages!.messages!.length
        ? null
        : messages!.messages![index + 1]);

    bool buildAlbum = false;

    if (msg.mediaAlbumId != 0) {
      if (albums[msg.mediaAlbumId] == null) {
        albums[msg.mediaAlbumId!] = [];
      }
      var album = albums[msg.mediaAlbumId!]!;
      if (!album.contains(msg)) {
        album.add(msg);
      }

      if (next?.mediaAlbumId != msg.mediaAlbumId) {
        buildAlbum = true;
      } else {
        return const SizedBox();
      }
    }

    return StreamBuilderWrapper(
      key: Key("message?id=${msg.id}?chatId=${msg.chatId}"),
      stream: () => StreamGroup.merge(
        [
          widget.client.messageEdits(widget.chatId, msg.id!),
          widget.client.messageContentChanges(widget.chatId, msg.id!),
          widget.client.messagePinState(widget.chatId, msg.id!)
        ],
      ),
      builder: (_, data) {
        if (data.hasData) {
          var update = data.data;
          switch (update.runtimeType) {
            case UpdateMessageEdited:
              update as UpdateMessageEdited;
              msg.editDate = update.editDate;
              msg.replyMarkup = update.replyMarkup;
              break;
            case UpdateMessageContent:
              update as UpdateMessageContent;
              msg.content = update.newContent;
              break;
            case UpdateMessageIsPinned:
              update as UpdateMessageIsPinned;
              msg.isPinned = update.isPinned;
              break;
          }
        }

        var prevDate = previus == null ? null : unixToDateTime(previus.date!);
        var currDate = unixToDateTime(msg.date!);
        var nextDate = next == null ? null : unixToDateTime(next.date!);

        bool showDateBelow = prevDate != null &&
            (prevDate.day != currDate.day ||
                prevDate.month != currDate.month ||
                prevDate.year != currDate.year);

        bool showDateAbove = nextDate != null &&
            (nextDate.day != currDate.day ||
                nextDate.month != currDate.month ||
                nextDate.year != currDate.year);

        var prevSenderId = getSenderId(previus?.senderId);
        var nextSenderId = getSenderId(next?.senderId);
        var currSenderId = getSenderId(msg.senderId);
        BubbleRelativePosition bubbleRelativePosition =
            BubbleRelativePosition.single;
        if (currSenderId == nextSenderId && currSenderId == prevSenderId) {
          if (showDateAbove && showDateBelow) {
            bubbleRelativePosition = BubbleRelativePosition.single;
          } else if (showDateAbove) {
            bubbleRelativePosition = BubbleRelativePosition.top;
          } else if (showDateBelow) {
            bubbleRelativePosition = BubbleRelativePosition.bottom;
          } else {
            bubbleRelativePosition = BubbleRelativePosition.middle;
          }
        } else if (currSenderId == prevSenderId) {
          bubbleRelativePosition = BubbleRelativePosition.top;
        } else if (currSenderId == nextSenderId) {
          if (showDateAbove) {
            bubbleRelativePosition = BubbleRelativePosition.single;
          } else {
            bubbleRelativePosition = BubbleRelativePosition.bottom;
          }
        }

        var adminInfo = admins.firstWhereOrNull(
            (element) => element.userId == getSenderId(msg.senderId!));
        bool isServiceMessage =
            serviceMessages.contains(msg.content.runtimeType);

        const double serviceMessageMargin = 6;
        const double messageMargin = 4;

        Widget result = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (nextDate == null)
              Container(
                  margin: const EdgeInsets.only(bottom: serviceMessageMargin),
                  child: DateBubble(client: widget.client, date: currDate)),
            if (isServiceMessage)
              Container(
                margin: const EdgeInsets.only(bottom: serviceMessageMargin),
                child: MessageDisplay(
                  bubbleRelativePosition: bubbleRelativePosition,
                  client: widget.client,
                  messages: [msg],
                  onMessageDelete: () => deleteHandler(msg),
                  isServiceMessage: true,
                ),
              )
            else
              SizedBox(
                width: messageWidth,
                child: FutureBuilder(
                  key: Key(
                    "replie?replyToMessageId=${msg.replyToMessageId}msgId=${msg.id}",
                  ),
                  initialData: widget.client.getMessage(
                    widget.chatId,
                    msg.replyToMessageId!,
                  ),
                  future: msg.replyToMessageId == 0
                      ? null
                      : widget.client.send(
                          GetMessage(
                            chatId: msg.replyInChatId == 0
                                ? chat.id
                                : msg.replyInChatId,
                            messageId: msg.replyToMessageId,
                          ),
                        ),
                  builder: (_, replieDate) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: (bubbleRelativePosition ==
                                      BubbleRelativePosition.bottom ||
                                  bubbleRelativePosition ==
                                      BubbleRelativePosition.single)
                              ? serviceMessageMargin
                              : messageMargin),
                      child: MessageDisplay(
                        bubbleRelativePosition: bubbleRelativePosition,
                        chat: chat,
                        messages: buildAlbum
                            //because tdlib load messages in reverse chronological order
                            ? albums[msg.mediaAlbumId!]!.reversed.toList()
                            : [msg],
                        isReplie: msg.replyToMessageId != 0,
                        replieOn: replieDate.hasData
                            ? (replieDate.data is Message
                                ? ReplieLoadingResultSucces(
                                    replieDate.data as Message)
                                : ReplieLoadingResultDeleted())
                            : null,
                        client: widget.client,
                        onMessageDelete: () => deleteHandler(msg),
                        adminTitle: adminInfo != null
                            ? (adminInfo.customTitle?.isEmpty ?? true)
                                ? widget.client.getTranslation(
                                    adminInfo.isOwner!
                                        ? "lng_owner_badge"
                                        : "lng_admin_badge")
                                : adminInfo.customTitle!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            if (showDateBelow)
              Container(
                margin: const EdgeInsets.only(bottom: serviceMessageMargin),
                child: DateBubble(
                  client: widget.client,
                  date: prevDate,
                ),
              ),
          ],
        );

        /// for increaseing region, where context menu can be called
        result = Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Row(
              mainAxisAlignment: msg.isOutgoing!
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [result],
            ),
          ],
        );

        if (next?.id == firstUnreadMessageId) {
          result = Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              result,
              //TODO get colors from theme
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.client.getTranslation(
                        "lng_unread_bar_some",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

          /*Container(
            child: result,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
            ),
          );*/
        }

        return ContextMenu(
          items: [
            ContextMenuItemIconButton(
              icon: Icons.reply,
              text: widget.client.getTranslation(
                "lng_context_reply_msg",
              ),
              onClick: () => UIEvents.replieTo(msg.id),
            ),
            if (chat.permissions!.canPinMessages!)
              ContextMenuItemIconButton(
                icon: Icons.push_pin,
                text: widget.client.getTranslation(
                  msg.isPinned! ? "lng_pinned_unpin" : "lng_pinned_pin",
                ),
                onClick: () => widget.client.send(
                  msg.isPinned!
                      ? UnpinChatMessage(
                          chatId: chat.id,
                          messageId: msg.id,
                        )
                      : PinChatMessage(
                          chatId: chat.id,
                          //TODO ask for it
                          disableNotification: true,
                          messageId: msg.id,
                          //TODO ask for it
                          onlyForSelf: false,
                        ),
                ),
              ),
            if (!isPrivate(chat.type!) && chat.type is! ChatTypeBasicGroup)
              ContextMenuItemIconButton(
                icon: Icons.link,
                text: widget.client.getTranslation(
                  isChannel(chat.type!)
                      ? "lng_context_copy_post_link"
                      : "lng_context_copy_message_link",
                ),
                onClick: () async {
                  var link = await widget.client.send(
                    GetMessageLink(
                      chatId: widget.chatId,
                      messageId: msg.id,
                      forAlbum: true,
                    ),
                  );
                  if (link is MessageLink) {
                    Clipboard.setData(
                      ClipboardData(
                        text: link.link ?? "",
                      ),
                    );
                  }
                },
              ),
            if (msg.canBeDeletedForAllUsers!)
              ContextMenuItemIconButton(
                icon: Icons.delete,
                text: widget.client.getTranslation(
                  "lng_mediaview_delete",
                ),
                destructiveAction: true,
                //TODO show dialog alert to confirm
                onClick: () => widget.client.send(
                  DeleteMessages(
                    chatId: widget.chatId,
                    messageIds: [msg.id!],
                    revoke: true,
                  ),
                ),
              ),
            if (msg.editDate != 0)
              ContextMenuItemText(
                icon: Icons.info_outline,
                text: widget.client.getTranslation(
                  "lng_edited_date",
                  replacing: {
                    "{date}": formatEditTime(msg.editDate!),
                  },
                ),
              ),
            ContextMenuItemText(
              icon: Icons.numbers,
              text: msg.id!.toString(),
            ),
          ],
          child: result,
        );
      },
    );
  }

  String formatEditTime(int unix) {
    var date = unixToDateTime(unix);
    var now = DateTime.now();

    return widget.client.getTranslation(
      now.day - date.day <= 1
          ? (date.day == now.day
              ? "lng_player_message_today"
              : "lng_player_message_yesterday")
          : "lng_player_message_date",
      replacing: {
        "{time}": getHHMM(date),
        "{date}":
            "${widget.client.getTranslation("lng_month${date.month}")} ${date.day}"
      },
    );
  }
}

class _widgetBuildProvider extends StatelessWidget {
  const _widgetBuildProvider({Key? key, required this.onBuild})
      : super(key: key);
  final Function onBuild;
  @override
  Widget build(BuildContext context) {
    onBuild();
    return const SizedBox.shrink();
  }
}

// You know, I'm something of a architect myself 😏😏😏

abstract class ReplieLoadingResult {}

class ReplieLoadingResultDeleted extends ReplieLoadingResult {}

class ReplieLoadingResultSucces extends ReplieLoadingResult {
  ReplieLoadingResultSucces(this.replieOn);
  final Message replieOn;
}
