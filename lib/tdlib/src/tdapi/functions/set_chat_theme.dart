part of '../tdapi.dart';

class SetChatTheme extends TdFunction {

  /// Changes the chat theme. Supported only in private and secret chats
  SetChatTheme({this.chatId,
    this.themeName});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [themeName] Name of the new chat theme; pass an empty string to return the default theme
  String? themeName;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetChatTheme.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "theme_name": themeName,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setChatTheme';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}