part of '../tdapi.dart';

class GetChatEventLog extends TdFunction {

  /// Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only for supergroups and channels. Requires administrator rights. Returns results in reverse chronological order (i. e., in order of decreasing event_id)
  GetChatEventLog({this.chatId,
    this.query,
    this.fromEventId,
    this.limit,
    this.filters,
    this.userIds});

  /// [chatId] Chat identifier
  int? chatId;

  /// [query] Search query by which to filter events 
  String? query;

  /// [fromEventId] Identifier of an event from which to return results. Use 0 to get results from the latest events 
  int? fromEventId;

  /// [limit] The maximum number of events to return; up to 100
  int? limit;

  /// [filters] The types of events to return; pass null to get chat events of all types
  ChatEventLogFilters? filters;

  /// [userIds] User identifiers by which to filter events. By default, events relating to all users will be returned
  List<int>? userIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatEventLog.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "query": query,
      "from_event_id": fromEventId,
      "limit": limit,
      "filters": filters == null ? null : filters?.toJson(),
      "user_ids": userIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatEventLog';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}