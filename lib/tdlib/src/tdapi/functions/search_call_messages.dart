part of '../tdapi.dart';

class SearchCallMessages extends TdFunction {

  /// Searches for call messages. Returns the results in reverse chronological order (i. e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
  SearchCallMessages({this.fromMessageId,
    this.limit,
    this.onlyMissed});

  /// [fromMessageId] Identifier of the message from which to search; use 0 to get results from the last message
  int? fromMessageId;

  /// [limit] The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// [onlyMissed] If true, returns only messages with missed calls
  bool? onlyMissed;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchCallMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "from_message_id": fromMessageId,
      "limit": limit,
      "only_missed": onlyMissed,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchCallMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}