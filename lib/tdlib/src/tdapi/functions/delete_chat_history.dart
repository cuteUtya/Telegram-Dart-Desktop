part of '../tdapi.dart';

class DeleteChatHistory extends TdFunction {

  /// Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
  DeleteChatHistory({this.chatId,
    this.removeFromChatList,
    this.revoke});

  /// [chatId] Chat identifier
  int? chatId;

  /// [removeFromChatList] Pass true if the chat needs to be removed from the chat list 
  bool? removeFromChatList;

  /// [revoke] Pass true to try to delete chat history for all users
  bool? revoke;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeleteChatHistory.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "remove_from_chat_list": removeFromChatList,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deleteChatHistory';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}