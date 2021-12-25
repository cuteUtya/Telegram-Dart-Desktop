part of '../tdapi.dart';

class DeleteChatMessagesBySender extends TdFunction {

  /// Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator privileges
  DeleteChatMessagesBySender({this.chatId,
    this.senderId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [senderId] Identifier of the sender of messages to delete
  MessageSender? senderId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteChatMessagesBySender.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "sender_id": senderId == null ? null : senderId?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteChatMessagesBySender';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}