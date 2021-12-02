part of '../tdapi.dart';

class ChatInviteLink extends TdObject {

  /// Contains a chat invite link
  ChatInviteLink({this.inviteLink,
    this.name,
    this.creatorUserId,
    this.date,
    this.editDate,
    this.expireDate,
    this.memberLimit,
    this.memberCount,
    this.pendingJoinRequestCount,
    this.createsJoinRequest,
    this.isPrimary,
    this.isRevoked});

  /// [inviteLink] Chat invite link
  String? inviteLink;

  /// [name] Name of the link
  String? name;

  /// [creatorUserId] User identifier of an administrator created the link
  int? creatorUserId;

  /// [date] Point in time (Unix timestamp) when the link was created
  int? date;

  /// [editDate] Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
  int? editDate;

  /// [expireDate] Point in time (Unix timestamp) when the link will expire; 0 if never
  int? expireDate;

  /// [memberLimit] The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
  int? memberLimit;

  /// [memberCount] Number of chat members, which joined the chat using the link
  int? memberCount;

  /// [pendingJoinRequestCount] Number of pending join requests created using this link
  int? pendingJoinRequestCount;

  /// [createsJoinRequest] True, if the link only creates join request. If true, total number of joining members will be unlimited
  bool? createsJoinRequest;

  /// [isPrimary] True, if the link is primary. Primary invite link can't have name, expire date or usage limit. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
  bool? isPrimary;

  /// [isRevoked] True, if the link was revoked
  bool? isRevoked;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLink.fromJson(Map<String, dynamic> json)  {
    inviteLink = json['invite_link'] == null ? null : json['invite_link'];
    name = json['name'] == null ? null : json['name'];
    creatorUserId = json['creator_user_id'] == null ? null : json['creator_user_id'];
    date = json['date'] == null ? null : json['date'];
    editDate = json['edit_date'] == null ? null : json['edit_date'];
    expireDate = json['expire_date'] == null ? null : json['expire_date'];
    memberLimit = json['member_limit'] == null ? null : json['member_limit'];
    memberCount = json['member_count'] == null ? null : json['member_count'];
    pendingJoinRequestCount = json['pending_join_request_count'] == null ? null : json['pending_join_request_count'];
    createsJoinRequest = json['creates_join_request'] == null ? null : json['creates_join_request'];
    isPrimary = json['is_primary'] == null ? null : json['is_primary'];
    isRevoked = json['is_revoked'] == null ? null : json['is_revoked'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": inviteLink,
      "name": name,
      "creator_user_id": creatorUserId,
      "date": date,
      "edit_date": editDate,
      "expire_date": expireDate,
      "member_limit": memberLimit,
      "member_count": memberCount,
      "pending_join_request_count": pendingJoinRequestCount,
      "creates_join_request": createsJoinRequest,
      "is_primary": isPrimary,
      "is_revoked": isRevoked,
    };
  }

  static const CONSTRUCTOR = 'chatInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}