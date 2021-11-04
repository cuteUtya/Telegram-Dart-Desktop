part of '../tdapi.dart';

class TransferChatOwnership extends TdFunction {

  /// Changes the owner of a chat. The current user must be a current owner of the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
  TransferChatOwnership({this.chatId,
    this.userId,
    this.password});

  /// [chatId] Chat identifier
  int? chatId;

  /// [userId] Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user 
  int? userId;

  /// [password] The password of the current user
  String? password;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  TransferChatOwnership.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "user_id": userId,
      "password": password,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'transferChatOwnership';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}