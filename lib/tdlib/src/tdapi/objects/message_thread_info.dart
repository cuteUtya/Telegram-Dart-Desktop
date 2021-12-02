part of '../tdapi.dart';

class MessageThreadInfo extends TdObject {

  /// Contains information about a message thread
  MessageThreadInfo({this.chatId,
    this.messageThreadId,
    this.replyInfo,
    this.unreadMessageCount,
    this.messages,
    this.draftMessage});

  /// [chatId] Identifier of the chat to which the message thread belongs
  int? chatId;

  /// [messageThreadId] Message thread identifier, unique within the chat
  int? messageThreadId;

  /// [replyInfo] Information about the message thread
  MessageReplyInfo? replyInfo;

  /// [unreadMessageCount] Approximate number of unread messages in the message thread
  int? unreadMessageCount;

  /// [messages] The messages from which the thread starts. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
  List<Message>? messages;

  /// [draftMessage] A draft of a message in the message thread; may be null
  DraftMessage? draftMessage;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageThreadInfo.fromJson(Map<String, dynamic> json)  {
    chatId = json['chat_id'] == null ? null : json['chat_id'];
    messageThreadId = json['message_thread_id'] == null ? null : json['message_thread_id'];
    replyInfo = json['reply_info'] == null ? null : MessageReplyInfo.fromJson(json['reply_info'] ?? <String, dynamic>{});
    unreadMessageCount = json['unread_message_count'] == null ? null : json['unread_message_count'];
    messages = json['messages'] == null ? null : List<Message>.from((json['messages'] ?? [])!.map((item) => Message.fromJson(item ?? <String, dynamic>{})).toList());
    draftMessage = json['draft_message'] == null ? null : DraftMessage.fromJson(json['draft_message'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_thread_id": messageThreadId,
      "reply_info": replyInfo == null ? null : replyInfo?.toJson(),
      "unread_message_count": unreadMessageCount,
      "messages": messages?.map((i) => i.toJson()).toList(),
      "draft_message": draftMessage == null ? null : draftMessage?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageThreadInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}