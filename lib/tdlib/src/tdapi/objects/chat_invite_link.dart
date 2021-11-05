part of '../tdapi.dart';

class ChatInviteLink extends TdObject {

  /// Contains a chat invite link
  ChatInviteLink({this.inviteLink,
    this.creatorUserId,
    this.date,
    this.editDate,
    this.expireDate,
    this.memberLimit,
    this.memberCount,
    this.isPrimary,
    this.isRevoked});

  /// [inviteLink] Chat invite link 
  String? inviteLink;

  /// [creatorUserId] User identifier of an administrator created the link
  int? creatorUserId;

  /// [date] Point in time (Unix timestamp) when the link was created
  int? date;

  /// [editDate] Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
  int? editDate;

  /// [expireDate] Point in time (Unix timestamp) when the link will expire; 0 if never
  int? expireDate;

  /// [memberLimit] The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited
  int? memberLimit;

  /// [memberCount] Number of chat members, which joined the chat using the link
  int? memberCount;

  /// [isPrimary] True, if the link is primary. Primary invite link can't have expire date or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
  bool? isPrimary;

  /// [isRevoked] True, if the link was revoked
  bool? isRevoked;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLink.fromJson(Map<String, dynamic> json)  {
    String? pre_inviteLink;
    try{
      pre_inviteLink=json['invite_link'];
   }catch(_){}
    inviteLink = pre_inviteLink;
    int? pre_creatorUserId;
    try{
      pre_creatorUserId=json['creator_user_id'];
   }catch(_){}
    creatorUserId = pre_creatorUserId;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    int? pre_editDate;
    try{
      pre_editDate=json['edit_date'];
   }catch(_){}
    editDate = pre_editDate;
    int? pre_expireDate;
    try{
      pre_expireDate=json['expire_date'];
   }catch(_){}
    expireDate = pre_expireDate;
    int? pre_memberLimit;
    try{
      pre_memberLimit=json['member_limit'];
   }catch(_){}
    memberLimit = pre_memberLimit;
    int? pre_memberCount;
    try{
      pre_memberCount=json['member_count'];
   }catch(_){}
    memberCount = pre_memberCount;
    bool? pre_isPrimary;
    try{
      pre_isPrimary=json['is_primary'];
   }catch(_){}
    isPrimary = pre_isPrimary;
    bool? pre_isRevoked;
    try{
      pre_isRevoked=json['is_revoked'];
   }catch(_){}
    isRevoked = pre_isRevoked;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink,
      "creator_user_id": creatorUserId,
      "date": date,
      "edit_date": editDate,
      "expire_date": expireDate,
      "member_limit": memberLimit,
      "member_count": memberCount,
      "is_primary": isPrimary,
      "is_revoked": isRevoked,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}