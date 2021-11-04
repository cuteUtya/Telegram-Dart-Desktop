part of '../tdapi.dart';

class DeleteChatMessagesFromUser extends TdFunction {

  /// Deletes all messages sent by the specified user to a chat. Supported only for supergroups; requires can_delete_messages administrator privileges
  DeleteChatMessagesFromUser({this.chatId,
    this.userId});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [userId] User identifier
  int? userId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteChatMessagesFromUser.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteChatMessagesFromUser';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}