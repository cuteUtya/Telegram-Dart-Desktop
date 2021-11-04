part of '../tdapi.dart';

class RemoveTopChat extends TdFunction {

  /// Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled
  RemoveTopChat({this.category,
    this.chatId});

  /// [category] Category of frequently used chats 
  TopChatCategory? category;

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RemoveTopChat.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "category": category == null ? null : category?.toJson(),
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'removeTopChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}