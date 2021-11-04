part of '../tdapi.dart';

class CheckChatInviteLink extends TdFunction {

  /// Checks the validity of an invite link for a chat and returns information about the corresponding chat
  CheckChatInviteLink({this.inviteLink});

  /// [inviteLink] Invite link to be checked
  String? inviteLink;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckChatInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkChatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}