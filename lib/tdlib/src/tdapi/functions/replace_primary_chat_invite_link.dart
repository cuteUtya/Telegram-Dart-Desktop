part of '../tdapi.dart';

class ReplacePrimaryChatInviteLink extends TdFunction {

  /// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right
  ReplacePrimaryChatInviteLink({this.chatId});

  /// [chatId] Chat identifier
  int? chatId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ReplacePrimaryChatInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'replacePrimaryChatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}