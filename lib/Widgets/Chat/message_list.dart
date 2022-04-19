import 'dart:async';
import 'package:async/src/stream_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Context%20menu/context_menu_config.dart';
import 'package:myapp/Context%20menu/context_menu_region.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/date_bubble.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/bubble_utils.dart';
import 'package:myapp/Widgets/message/mac_message_bubble.dart';
import 'package:myapp/Widgets/message/message_display.dart';
import 'package:myapp/Widgets/smooth_list_view.dart';
import 'package:myapp/safe_spacer.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart' hide Text;
import 'package:myapp/tdlib/tdlib_utils.dart';
import 'package:collection/collection.dart';
import 'package:myapp/utils.dart';
import 'package:collection/collection.dart';

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

class _MessageListState extends StateWithStreamsSubscriptions<MessageList> {
  Messages? messages;
  bool loadedFirstMessage = false;
  ScrollController scrollController = ScrollController();
  List<ChatAdministrator> admins = [];

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

  void loadMessages(int limit, int fromMessageId, int offset) async {
    var msgs = await widget.client.send(
      GetChatHistory(
        chatId: widget.chatId,
        fromMessageId: fromMessageId,
        limit: limit,
        offset: offset,
      ),
    ) as Messages;

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
          }
        },
      );
    }
  }

  void listenMessagesUpdates() {
    streamSubscriptions.add(
      widget.client.newMessagesIn(widget.chatId).listen(
        (event) {
          setState(
            () {
              messages?.totalCount = messages!.totalCount! + 1;
              messages?.messages = [event] + messages!.messages!;
            },
          );

          if (scrollController.offset <= 0) {
            scrollController.jumpTo(41);
            scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 400),
              curve: Curves.decelerate,
            );
          }
        },
      ),
    );
    streamSubscriptions.add(
      widget.client.updateMessageIsPinned.listen(
        (event) {
          if (event.chatId == widget.chatId) {
            var msg = messages?.messages
                ?.firstWhereOrNull((e) => e.id == event.messageId);
            if (msg != null) {
              setState(() => msg.isPinned = event.isPinned);
            }
          }
        },
      ),
    );
  }

  @override
  void initState() {
    listenMessagesUpdates();
    loadMessages(50, 0, 0);
    widget.client.send(GetChatAdministrators(chatId: widget.chatId)).then(
      (adm) {
        if (adm is ChatAdministrators) {
          setState(() => admins = adm.administrators!);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Map<int, List<Message>> albums = {};

  @override
  Widget build(BuildContext context) {
    int messagesCount = (messages?.totalCount ?? 0);
    var chat = widget.client.getChat(widget.chatId);

    return SmoothListView(
      reverse: true,
      scrollController: scrollController,
      itemCount: messagesCount + 1,
      cacheExtent: 1500,
      itemBuilder: (context, index) {
        if (index >= messagesCount) {
          return _widgetBuildProvider(
            onBuild: () {
              // if we havent messages - that mean what we alreade called
              // loadMessages in start of build method
              if (messagesCount != 0 && !loadedFirstMessage) {
                loadMessages(25, messages?.messages?.last.id ?? 0, 0);
              }
            },
          );
        }

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

        return StreamBuilder(
          key: Key("message?id=${msg.id}?chatId=${msg.chatId}"),
          stream: StreamGroup.merge(
            [
              widget.client.messageEdits(widget.chatId, msg.id!),
              widget.client.messageContentChanges(widget.chatId, msg.id!),
            ],
          ),
          builder: (_, data) {
            if (data.hasData) {
              var update = data.data;
              if (update is UpdateMessageEdited) {
                msg.editDate = update.editDate;
                msg.replyMarkup = update.replyMarkup;
              }
              if (update is UpdateMessageContent) {
                msg.content = update.newContent;
              }
            }

            var prevDate =
                previus == null ? null : unixToDateTime(previus.date!);
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
              children: [
                if (nextDate == null)
                  Container(
                      margin:
                          const EdgeInsets.only(bottom: serviceMessageMargin),
                      child: DateBubble(client: widget.client, date: currDate)),
                if (isServiceMessage)
                  Container(
                    margin: const EdgeInsets.only(bottom: serviceMessageMargin),
                    child: MessageDisplay(
                      bubbleRelativePosition: bubbleRelativePosition,
                      client: widget.client,
                      messages: [msg],
                      isServiceMessage: true,
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: msg.isOutgoing!
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: UIManager.useDesktopLayout
                            ? 400
                            : MediaQuery.of(context).size.width * 0.75,
                        child: FutureBuilder(
                          key: Key(
                              "replie?replyToMessageId=${msg.replyToMessageId}?replyInChatId=${msg.replyInChatId}"),
                          initialData: widget.client
                              .getMessage(widget.chatId, msg.replyToMessageId!),
                          future: msg.replyToMessageId == 0
                              ? null
                              : widget.client.send(GetMessage(
                                  chatId: msg.replyInChatId == 0
                                      ? chat.id
                                      : msg.replyInChatId,
                                  messageId: msg.replyToMessageId)),
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
                                    ? albums[msg.mediaAlbumId!]!
                                        .reversed
                                        .toList()
                                    : [msg],
                                isReplie: msg.replyToMessageId != 0,
                                replieOn: replieDate.hasData
                                    ? (replieDate.data is Message
                                        ? ReplieLoadingResultSucces(
                                            replieDate.data as Message)
                                        : ReplieLoadingResultDeleted())
                                    : null,
                                client: widget.client,
                                onMessageDelete: () => setState(
                                  () => messages?.messages!.removeWhere(
                                    (element) => element.id == msg.id,
                                  ),
                                ),
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
                    ],
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

            return ContextMenuRegion(
              config: ContextMenuConfig(
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
                ],
              ),
              child: result,
            );
          },
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
