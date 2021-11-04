part of '../tdapi.dart';

class GetMessageStatistics extends TdFunction {

  /// Returns detailed statistics about a message. Can be used only if message.can_get_statistics == true
  GetMessageStatistics({this.chatId,
    this.messageId,
    this.isDark});

  /// [chatId] Chat identifier 
  int? chatId;

  /// [messageId] Message identifier 
  int? messageId;

  /// [isDark] Pass true if a dark theme is used by the application
  bool? isDark;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetMessageStatistics.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "message_id": messageId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getMessageStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}