part of '../tdapi.dart';

class SearchMessages extends TdFunction {

  /// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  SearchMessages({this.chatList,
    this.query,
    this.offsetDate,
    this.offsetChatId,
    this.offsetMessageId,
    this.limit,
    this.filter,
    this.minDate,
    this.maxDate});

  /// [chatList] Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
  ChatList? chatList;

  /// [query] Query to search for
  String? query;

  /// [offsetDate] The date of the message starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last message
  int? offsetDate;

  /// [offsetChatId] The chat identifier of the last found message, or 0 for the first request
  int? offsetChatId;

  /// [offsetMessageId] The message identifier of the last found message, or 0 for the first request
  int? offsetMessageId;

  /// [limit] The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// [filter] Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
  SearchMessagesFilter? filter;

  /// [minDate] If not 0, the minimum date of the messages to return
  int? minDate;

  /// [maxDate] If not 0, the maximum date of the messages to return
  int? maxDate;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_list": chatList == null ? null : chatList?.toJson(),
      "query": query,
      "offset_date": offsetDate,
      "offset_chat_id": offsetChatId,
      "offset_message_id": offsetMessageId,
      "limit": limit,
      "filter": filter == null ? null : filter?.toJson(),
      "min_date": minDate,
      "max_date": maxDate,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}