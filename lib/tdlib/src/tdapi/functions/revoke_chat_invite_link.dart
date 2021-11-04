part of '../tdapi.dart';

class RevokeChatInviteLink extends TdFunction {

  /// Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.. If a primary link is revoked, then additionally to the revoked link returns new primary link
  RevokeChatInviteLink({this.chatId,
    this.inviteLink});

  /// [chatId] Chat identifier
  int? chatId;

  /// [inviteLink] Invite link to be revoked
  String? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RevokeChatInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'revokeChatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}