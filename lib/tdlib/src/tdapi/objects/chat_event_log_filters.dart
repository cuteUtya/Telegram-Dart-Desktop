part of '../tdapi.dart';

class ChatEventLogFilters extends TdObject {

  /// Represents a set of filters used to obtain a chat event log
  ChatEventLogFilters({this.messageEdits,
    this.messageDeletions,
    this.messagePins,
    this.memberJoins,
    this.memberLeaves,
    this.memberInvites,
    this.memberPromotions,
    this.memberRestrictions,
    this.infoChanges,
    this.settingChanges,
    this.inviteLinkChanges,
    this.videoChatChanges});

  /// [messageEdits] True, if message edits need to be returned
  bool? messageEdits;

  /// [messageDeletions] True, if message deletions need to be returned
  bool? messageDeletions;

  /// [messagePins] True, if pin/unpin events need to be returned
  bool? messagePins;

  /// [memberJoins] True, if members joining events need to be returned
  bool? memberJoins;

  /// [memberLeaves] True, if members leaving events need to be returned
  bool? memberLeaves;

  /// [memberInvites] True, if invited member events need to be returned
  bool? memberInvites;

  /// [memberPromotions] True, if member promotion/demotion events need to be returned
  bool? memberPromotions;

  /// [memberRestrictions] True, if member restricted/unrestricted/banned/unbanned events need to be returned
  bool? memberRestrictions;

  /// [infoChanges] True, if changes in chat information need to be returned
  bool? infoChanges;

  /// [settingChanges] True, if changes in chat settings need to be returned
  bool? settingChanges;

  /// [inviteLinkChanges] True, if changes to invite links need to be returned
  bool? inviteLinkChanges;

  /// [videoChatChanges] True, if video chat actions need to be returned
  bool? videoChatChanges;

  /// Parse from a json
  ChatEventLogFilters.fromJson(Map<String, dynamic> json)  {
    bool? pre_messageEdits;
    try{
      pre_messageEdits=json['message_edits'];
   }catch(_){}
    messageEdits = pre_messageEdits;
    bool? pre_messageDeletions;
    try{
      pre_messageDeletions=json['message_deletions'];
   }catch(_){}
    messageDeletions = pre_messageDeletions;
    bool? pre_messagePins;
    try{
      pre_messagePins=json['message_pins'];
   }catch(_){}
    messagePins = pre_messagePins;
    bool? pre_memberJoins;
    try{
      pre_memberJoins=json['member_joins'];
   }catch(_){}
    memberJoins = pre_memberJoins;
    bool? pre_memberLeaves;
    try{
      pre_memberLeaves=json['member_leaves'];
   }catch(_){}
    memberLeaves = pre_memberLeaves;
    bool? pre_memberInvites;
    try{
      pre_memberInvites=json['member_invites'];
   }catch(_){}
    memberInvites = pre_memberInvites;
    bool? pre_memberPromotions;
    try{
      pre_memberPromotions=json['member_promotions'];
   }catch(_){}
    memberPromotions = pre_memberPromotions;
    bool? pre_memberRestrictions;
    try{
      pre_memberRestrictions=json['member_restrictions'];
   }catch(_){}
    memberRestrictions = pre_memberRestrictions;
    bool? pre_infoChanges;
    try{
      pre_infoChanges=json['info_changes'];
   }catch(_){}
    infoChanges = pre_infoChanges;
    bool? pre_settingChanges;
    try{
      pre_settingChanges=json['setting_changes'];
   }catch(_){}
    settingChanges = pre_settingChanges;
    bool? pre_inviteLinkChanges;
    try{
      pre_inviteLinkChanges=json['invite_link_changes'];
   }catch(_){}
    inviteLinkChanges = pre_inviteLinkChanges;
    bool? pre_videoChatChanges;
    try{
      pre_videoChatChanges=json['video_chat_changes'];
   }catch(_){}
    videoChatChanges = pre_videoChatChanges;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_edits": messageEdits,
      "message_deletions": messageDeletions,
      "message_pins": messagePins,
      "member_joins": memberJoins,
      "member_leaves": memberLeaves,
      "member_invites": memberInvites,
      "member_promotions": memberPromotions,
      "member_restrictions": memberRestrictions,
      "info_changes": infoChanges,
      "setting_changes": settingChanges,
      "invite_link_changes": inviteLinkChanges,
      "video_chat_changes": videoChatChanges,
    };
  }

  static const CONSTRUCTOR = 'chatEventLogFilters';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}