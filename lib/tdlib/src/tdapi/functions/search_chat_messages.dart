part of '../tdapi.dart';

class SearchChatMessages extends TdFunction {

  /// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query. (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  SearchChatMessages({this.chatId,
    this.query,
    this.senderId,
    this.fromMessageId,
    this.offset,
    this.limit,
    this.filter,
    this.messageThreadId});

  /// [chatId] Identifier of the chat in which to search messages
  int? chatId;

  /// [query] Query to search for
  String? query;

  /// [senderId] Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
  MessageSender? senderId;

  /// [fromMessageId] Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  int? fromMessageId;

  /// [offset] Specify 0 to get results from exactly the from_message_id or a negative offset to get the specified message and some newer messages
  int? offset;

  /// [limit] The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// [filter] Additional filter for messages to search; pass null to search for all messages
  SearchMessagesFilter? filter;

  /// [messageThreadId] If not 0, only messages in the specified thread will be returned; supergroups only
  int? messageThreadId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchChatMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "query": query,
      "sender_id": senderId == null ? null : senderId?.toJson(),
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "filter": filter == null ? null : filter?.toJson(),
      "message_thread_id": messageThreadId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchChatMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}