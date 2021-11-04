part of '../tdapi.dart';

class JoinChatByInviteLink extends TdFunction {

  /// Uses an invite link to add the current user to the chat if possible
  JoinChatByInviteLink({this.inviteLink});

  /// [inviteLink] Invite link to use
  String? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JoinChatByInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'joinChatByInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}