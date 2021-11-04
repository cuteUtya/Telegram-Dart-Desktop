part of '../tdapi.dart';

class GetInlineQueryResults extends TdFunction {

  /// Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
  GetInlineQueryResults({this.botUserId,
    this.chatId,
    this.userLocation,
    this.query,
    this.offset});

  /// [botUserId] The identifier of the target bot
  int? botUserId;

  /// [chatId] Identifier of the chat where the query was sent
  int? chatId;

  /// [userLocation] Location of the user; pass null if unknown or the bot doesn't need user's location
  Location? userLocation;

  /// [query] Text of the query
  String? query;

  /// [offset] Offset of the first entry to return
  String? offset;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetInlineQueryResults.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "bot_user_id": botUserId,
      "chat_id": chatId,
      "user_location": userLocation == null ? null : userLocation?.toJson(),
      "query": query,
      "offset": offset,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getInlineQueryResults';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}