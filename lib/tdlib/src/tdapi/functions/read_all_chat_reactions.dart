part of '../tdapi.dart';

class ReadAllChatReactions extends TdFunction {

  /// Marks all reactions in a chat as read
  ReadAllChatReactions({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReadAllChatReactions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'readAllChatReactions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}