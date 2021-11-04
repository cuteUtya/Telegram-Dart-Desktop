part of '../tdapi.dart';

class GetMessages extends TdFunction {

  /// Returns information about messages. If a message is not found, returns null on the corresponding position of the result
  GetMessages({this.chatId,
    this.messageIds});

  /// [chatId] Identifier of the chat the messages belong to 
  int? chatId;

  /// [messageIds] Identifiers of the messages to get
  List<int>? messageIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessages.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_ids": messageIds?.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}