part of '../tdapi.dart';

class SearchChatMembers extends TdFunction {

  /// Searches for a specified query in the first name, last name and username of the members of a specified chat. Requires administrator rights in channels
  SearchChatMembers({this.chatId,
    this.query,
    this.limit,
    this.filter});

  /// [chatId] Chat identifier
  int? chatId;

  /// [query] Query to search for
  String? query;

  /// [limit] The maximum number of users to be returned; up to 200
  int? limit;

  /// [filter] The type of users to search for; pass null to search among all chat members
  ChatMembersFilter? filter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchChatMembers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "query": query,
      "limit": limit,
      "filter": filter == null ? null : filter?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchChatMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}