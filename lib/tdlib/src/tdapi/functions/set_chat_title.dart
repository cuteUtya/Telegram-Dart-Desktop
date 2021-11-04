part of '../tdapi.dart';

class SetChatTitle extends TdFunction {

  /// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
  SetChatTitle({this.chatId,
    this.title});

  /// [chatId] Chat identifier
  int? chatId;

  /// [title] New title of the chat; 1-128 characters
  String? title;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatTitle.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "title": title,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatTitle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}