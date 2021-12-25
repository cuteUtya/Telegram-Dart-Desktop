part of '../tdapi.dart';

class GetChatStatistics extends TdFunction {

  /// Returns detailed statistics about a chat. Currently, this method can be used only for supergroups and channels. Can be used only if supergroupFullInfo.can_get_statistics == true
  GetChatStatistics({this.chatId,
    this.isDark});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [isDark] Pass true if a dark theme is used by the application
  bool? isDark;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatStatistics.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}