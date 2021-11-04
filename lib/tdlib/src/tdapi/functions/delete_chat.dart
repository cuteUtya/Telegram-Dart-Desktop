part of '../tdapi.dart';

class DeleteChat extends TdFunction {

  /// Deletes a chat along with all messages in the corresponding chat for all chat members; requires owner privileges. For group chats this will release the username and remove all members. Chats with more than 1000 members can't be deleted using this method
  DeleteChat({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}