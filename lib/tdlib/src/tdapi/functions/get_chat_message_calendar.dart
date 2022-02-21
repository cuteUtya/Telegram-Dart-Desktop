part of '../tdapi.dart';

class GetChatMessageCalendar extends TdFunction {

  /// Returns information about the next messages of the specified type in the chat split by days. Returns the results in reverse chronological order. Can return partial result for the last returned day. Behavior of this method depends on the value of the option "utc_time_offset"
  GetChatMessageCalendar({this.chatId,
    this.filter,
    this.fromMessageId});

  /// [chatId] Identifier of the chat in which to return information about messages
  int? chatId;

  /// [filter] Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
  SearchMessagesFilter? filter;

  /// [fromMessageId] The message identifier from which to return information about messages; use 0 to get results from the last message
  int? fromMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatMessageCalendar.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "filter": filter == null ? null : filter?.toJson(),
      "from_message_id": fromMessageId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatMessageCalendar';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}