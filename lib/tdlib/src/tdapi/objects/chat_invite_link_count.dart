part of '../tdapi.dart';

class ChatInviteLinkCount extends TdObject {

  /// Describes a chat administrator with a number of active and revoked chat invite links
  ChatInviteLinkCount({this.userId,
    this.inviteLinkCount,
    this.revokedInviteLinkCount});

  /// [userId] Administrator's user identifier
  int? userId;

  /// [inviteLinkCount] Number of active invite links
  int? inviteLinkCount;

  /// [revokedInviteLinkCount] Number of revoked invite links
  int? revokedInviteLinkCount;

  /// Parse from a json
  ChatInviteLinkCount.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_inviteLinkCount;
    try{
      pre_inviteLinkCount=json['invite_link_count'];
   }catch(_){}
    inviteLinkCount = pre_inviteLinkCount;
    int? pre_revokedInviteLinkCount;
    try{
      pre_revokedInviteLinkCount=json['revoked_invite_link_count'];
   }catch(_){}
    revokedInviteLinkCount = pre_revokedInviteLinkCount;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "invite_link_count": inviteLinkCount,
      "revoked_invite_link_count": revokedInviteLinkCount,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkCount';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}