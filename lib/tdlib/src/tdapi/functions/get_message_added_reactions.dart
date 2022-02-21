part of '../tdapi.dart';

class GetMessageAddedReactions extends TdFunction {

  /// Returns reactions added for a message, along with their sender
  GetMessageAddedReactions({this.chatId,
    this.messageId,
    this.reaction,
    this.offset,
    this.limit});

  /// [chatId] Identifier of the chat to which the message belongs
  int? chatId;

  /// [messageId] Identifier of the message
  int? messageId;

  /// [reaction] If non-empty, only added reactions with the specified text representation will be returned
  String? reaction;

  /// [offset] Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  String? offset;

  /// [limit] The maximum number of reactions to be returned; must be positive and can't be greater than 100
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageAddedReactions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "reaction": reaction,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageAddedReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}