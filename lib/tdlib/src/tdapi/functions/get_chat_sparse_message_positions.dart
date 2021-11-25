part of '../tdapi.dart';

class GetChatSparseMessagePositions extends TdFunction {

  /// Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).. Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
  GetChatSparseMessagePositions({this.chatId,
    this.filter,
    this.fromMessageId,
    this.limit});

  /// [chatId] Identifier of the chat in which to return information about message positions
  int? chatId;

  /// [filter] Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterCall, searchMessagesFilterMissedCall, searchMessagesFilterMention and searchMessagesFilterUnreadMention are unsupported in this function
  SearchMessagesFilter? filter;

  /// [fromMessageId] The message identifier from which to return information about message positions
  int? fromMessageId;

  /// [limit] The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatSparseMessagePositions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "filter": filter == null ? null : filter?.toJson(),
      "from_message_id": fromMessageId,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatSparseMessagePositions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}