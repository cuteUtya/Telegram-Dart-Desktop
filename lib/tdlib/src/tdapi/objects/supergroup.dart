part of '../tdapi.dart';

class Supergroup extends TdObject {

  /// Represents a supergroup or channel with zero or more members (subscribers in the case of channels). From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members, and posts from all administrators use the name and photo of the channel instead of individual names and profile photos. Unlike supergroups, channels can have an unlimited number of subscribers
  Supergroup({this.id,
    this.username,
    this.date,
    this.status,
    this.memberCount,
    this.hasLinkedChat,
    this.hasLocation,
    this.signMessages,
    this.isSlowModeEnabled,
    this.isChannel,
    this.isBroadcastGroup,
    this.isVerified,
    this.restrictionReason,
    this.isScam,
    this.isFake});

  /// [id] Supergroup or channel identifier
  int? id;

  /// [username] Username of the supergroup or channel; empty for private supergroups or channels
  String? username;

  /// [date] Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
  int? date;

  /// [status] Status of the current user in the supergroup or channel; custom title will be always empty
  ChatMemberStatus? status;

  /// [memberCount] Number of members in the supergroup or channel; 0 if unknown. Currently it is guaranteed to be known only if the supergroup or channel was received through searchPublicChats, searchChatsNearby, getInactiveSupergroupChats, getSuitableDiscussionChats, getGroupsInCommon, or getUserPrivacySettingRules
  int? memberCount;

  /// [hasLinkedChat] True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
  bool? hasLinkedChat;

  /// [hasLocation] True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
  bool? hasLocation;

  /// [signMessages] True, if messages sent to the channel need to contain information about the sender. This field is only applicable to channels
  bool? signMessages;

  /// [isSlowModeEnabled] True, if the slow mode is enabled in the supergroup
  bool? isSlowModeEnabled;

  /// [isChannel] True, if the supergroup is a channel
  bool? isChannel;

  /// [isBroadcastGroup] True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on number of members
  bool? isBroadcastGroup;

  /// [isVerified] True, if the supergroup or channel is verified
  bool? isVerified;

  /// [restrictionReason] If non-empty, contains a human-readable description of the reason why access to this supergroup or channel must be restricted
  String? restrictionReason;

  /// [isScam] True, if many users reported this supergroup or channel as a scam
  bool? isScam;

  /// [isFake] True, if many users reported this supergroup or channel as a fake account
  bool? isFake;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Supergroup.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    String? pre_username;
    try{
      pre_username=json['username'];
   }catch(_){}
    username = pre_username;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    ChatMemberStatus? pre_status;
    try{
      pre_status=ChatMemberStatus.fromJson(json['status'] ?? <String, dynamic>{});
   }catch(_){}
    status = pre_status;
    int? pre_memberCount;
    try{
      pre_memberCount=json['member_count'];
   }catch(_){}
    memberCount = pre_memberCount;
    bool? pre_hasLinkedChat;
    try{
      pre_hasLinkedChat=json['has_linked_chat'];
   }catch(_){}
    hasLinkedChat = pre_hasLinkedChat;
    bool? pre_hasLocation;
    try{
      pre_hasLocation=json['has_location'];
   }catch(_){}
    hasLocation = pre_hasLocation;
    bool? pre_signMessages;
    try{
      pre_signMessages=json['sign_messages'];
   }catch(_){}
    signMessages = pre_signMessages;
    bool? pre_isSlowModeEnabled;
    try{
      pre_isSlowModeEnabled=json['is_slow_mode_enabled'];
   }catch(_){}
    isSlowModeEnabled = pre_isSlowModeEnabled;
    bool? pre_isChannel;
    try{
      pre_isChannel=json['is_channel'];
   }catch(_){}
    isChannel = pre_isChannel;
    bool? pre_isBroadcastGroup;
    try{
      pre_isBroadcastGroup=json['is_broadcast_group'];
   }catch(_){}
    isBroadcastGroup = pre_isBroadcastGroup;
    bool? pre_isVerified;
    try{
      pre_isVerified=json['is_verified'];
   }catch(_){}
    isVerified = pre_isVerified;
    String? pre_restrictionReason;
    try{
      pre_restrictionReason=json['restriction_reason'];
   }catch(_){}
    restrictionReason = pre_restrictionReason;
    bool? pre_isScam;
    try{
      pre_isScam=json['is_scam'];
   }catch(_){}
    isScam = pre_isScam;
    bool? pre_isFake;
    try{
      pre_isFake=json['is_fake'];
   }catch(_){}
    isFake = pre_isFake;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "username": username,
      "date": date,
      "status": status == null ? null : status?.toJson(),
      "member_count": memberCount,
      "has_linked_chat": hasLinkedChat,
      "has_location": hasLocation,
      "sign_messages": signMessages,
      "is_slow_mode_enabled": isSlowModeEnabled,
      "is_channel": isChannel,
      "is_broadcast_group": isBroadcastGroup,
      "is_verified": isVerified,
      "restriction_reason": restrictionReason,
      "is_scam": isScam,
      "is_fake": isFake,
    };
  }

  static const CONSTRUCTOR = 'supergroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}