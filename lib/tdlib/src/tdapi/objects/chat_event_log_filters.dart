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
    messageEdits = json['message_edits'] == null ? null : json['message_edits'];
    messageDeletions = json['message_deletions'] == null ? null : json['message_deletions'];
    messagePins = json['message_pins'] == null ? null : json['message_pins'];
    memberJoins = json['member_joins'] == null ? null : json['member_joins'];
    memberLeaves = json['member_leaves'] == null ? null : json['member_leaves'];
    memberInvites = json['member_invites'] == null ? null : json['member_invites'];
    memberPromotions = json['member_promotions'] == null ? null : json['member_promotions'];
    memberRestrictions = json['member_restrictions'] == null ? null : json['member_restrictions'];
    infoChanges = json['info_changes'] == null ? null : json['info_changes'];
    settingChanges = json['setting_changes'] == null ? null : json['setting_changes'];
    inviteLinkChanges = json['invite_link_changes'] == null ? null : json['invite_link_changes'];
    videoChatChanges = json['video_chat_changes'] == null ? null : json['video_chat_changes'];
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