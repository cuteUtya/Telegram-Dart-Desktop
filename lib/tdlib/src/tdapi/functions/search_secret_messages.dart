part of '../tdapi.dart';

class SearchSecretMessages extends TdFunction {

  /// Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance, the number of returned messages is chosen by TDLib
  SearchSecretMessages({this.chatId,
    this.query,
    this.offset,
    this.limit,
    this.filter});

  /// [chatId] Identifier of the chat in which to search. Specify 0 to search in all secret chats
  int? chatId;

  /// [query] Query to search for. If empty, searchChatMessages must be used instead
  String? query;

  /// [offset] Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
  String? offset;

  /// [limit] The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// [filter] Additional filter for messages to search; pass null to search for all messages
  SearchMessagesFilter? filter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchSecretMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "query": query,
      "offset": offset,
      "limit": limit,
      "filter": filter == null ? null : filter?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchSecretMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}