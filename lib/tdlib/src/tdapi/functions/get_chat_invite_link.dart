part of '../tdapi.dart';

class GetChatInviteLink extends TdFunction {

  /// Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
  GetChatInviteLink({this.chatId,
    this.inviteLink});

  /// [chatId] Chat identifier
  int? chatId;

  /// [inviteLink] Invite link to get
  String? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}