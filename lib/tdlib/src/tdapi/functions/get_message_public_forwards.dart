part of '../tdapi.dart';

class GetMessagePublicForwards extends TdFunction {

  /// Returns forwarded copies of a channel message to different public channels. For optimal performance, the number of returned messages is chosen by TDLib
  GetMessagePublicForwards({this.chatId,
    this.messageId,
    this.offset,
    this.limit});

  /// [chatId] Chat identifier of the message
  int? chatId;

  /// [messageId] Message identifier
  int? messageId;

  /// [offset] Offset of the first entry to return as received from the previous request; use empty string to get first chunk of results
  String? offset;

  /// [limit] The maximum number of messages to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessagePublicForwards.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessagePublicForwards';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}