part of '../tdapi.dart';

class ToggleChatHasProtectedContent extends TdFunction {

  /// Changes the ability of users to save, forward, or copy chat content. Supported only for basic groups, supergroups and channels. Requires owner privileges
  ToggleChatHasProtectedContent({this.chatId,
    this.hasProtectedContent});

  /// [chatId] Chat identifier
  int? chatId;

  /// [hasProtectedContent] True, if chat content can't be saved locally, forwarded, or copied
  bool? hasProtectedContent;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleChatHasProtectedContent.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "has_protected_content": hasProtectedContent,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleChatHasProtectedContent';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}