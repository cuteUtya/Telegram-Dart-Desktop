part of '../tdapi.dart';

class GetMessageThreadHistory extends TdFunction {

  /// Returns messages in a message thread of a message. Can be used only if message.can_get_message_thread == true. Message thread of a channel message is in the channel's linked supergroup.. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib
  GetMessageThreadHistory({this.chatId,
    this.messageId,
    this.fromMessageId,
    this.offset,
    this.limit});

  /// [chatId] Chat identifier
  int? chatId;

  /// [messageId] Message identifier, which thread history needs to be returned
  int? messageId;

  /// [fromMessageId] Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  int? fromMessageId;

  /// [offset] Specify 0 to get results from exactly the from_message_id or a negative offset up to 99 to get additionally some newer messages
  int? offset;

  /// [limit] The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than or equal to -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageThreadHistory.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageThreadHistory';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}