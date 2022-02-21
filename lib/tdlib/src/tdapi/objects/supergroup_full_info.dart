part of '../tdapi.dart';

class SupergroupFullInfo extends TdObject {

  /// Contains full information about a supergroup or channel
  SupergroupFullInfo({this.photo,
    this.description,
    this.memberCount,
    this.administratorCount,
    this.restrictedCount,
    this.bannedCount,
    this.linkedChatId,
    this.slowModeDelay,
    this.slowModeDelayExpiresIn,
    this.canGetMembers,
    this.canSetUsername,
    this.canSetStickerSet,
    this.canSetLocation,
    this.canGetStatistics,
    this.isAllHistoryAvailable,
    this.stickerSetId,
    this.location,
    this.inviteLink,
    this.botCommands,
    this.upgradedFromBasicGroupId,
    this.upgradedFromMaxMessageId});

  /// [photo] Chat photo; may be null
  ChatPhoto? photo;

  /// [description] Supergroup or channel description
  String? description;

  /// [memberCount] Number of members in the supergroup or channel; 0 if unknown
  int? memberCount;

  /// [administratorCount] Number of privileged users in the supergroup or channel; 0 if unknown
  int? administratorCount;

  /// [restrictedCount] Number of restricted users in the supergroup; 0 if unknown
  int? restrictedCount;

  /// [bannedCount] Number of users banned from chat; 0 if unknown
  int? bannedCount;

  /// [linkedChatId] Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
  int? linkedChatId;

  /// [slowModeDelay] Delay between consecutive sent messages for non-administrator supergroup members, in seconds
  int? slowModeDelay;

  /// [slowModeDelayExpiresIn] Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
  double? slowModeDelayExpiresIn;

  /// [canGetMembers] True, if members of the chat can be retrieved
  bool? canGetMembers;

  /// [canSetUsername] True, if the chat username can be changed
  bool? canSetUsername;

  /// [canSetStickerSet] True, if the supergroup sticker set can be changed
  bool? canSetStickerSet;

  /// [canSetLocation] True, if the supergroup location can be changed
  bool? canSetLocation;

  /// [canGetStatistics] True, if the supergroup or channel statistics are available
  bool? canGetStatistics;

  /// [isAllHistoryAvailable] True, if new chat members will have access to old messages. In public or discussion groups and both public and private channels, old messages are always available, so this option affects only private supergroups without a linked chat. The value of this field is only available for chat administrators
  bool? isAllHistoryAvailable;

  /// [stickerSetId] Identifier of the supergroup sticker set; 0 if none
  int? stickerSetId;

  /// [location] Location to which the supergroup is connected; may be null
  ChatLocation? location;

  /// [inviteLink] Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
  ChatInviteLink? inviteLink;

  /// [botCommands] List of commands of bots in the group
  List<BotCommands>? botCommands;

  /// [upgradedFromBasicGroupId] Identifier of the basic group from which supergroup was upgraded; 0 if none
  int? upgradedFromBasicGroupId;

  /// [upgradedFromMaxMessageId] Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
  int? upgradedFromMaxMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SupergroupFullInfo.fromJson(Map<String, dynamic> json)  {
    photo = json['photo'] == null ? null : ChatPhoto.fromJson(json['photo'] ?? <String, dynamic>{});
    description = json['description'] == null ? null : json['description'];
    memberCount = json['member_count'] == null ? null : json['member_count'];
    administratorCount = json['administrator_count'] == null ? null : json['administrator_count'];
    restrictedCount = json['restricted_count'] == null ? null : json['restricted_count'];
    bannedCount = json['banned_count'] == null ? null : json['banned_count'];
    linkedChatId = json['linked_chat_id'] == null ? null : json['linked_chat_id'];
    slowModeDelay = json['slow_mode_delay'] == null ? null : json['slow_mode_delay'];
    slowModeDelayExpiresIn = json['slow_mode_delay_expires_in'] == null ? null : json['slow_mode_delay_expires_in'];
    canGetMembers = json['can_get_members'] == null ? null : json['can_get_members'];
    canSetUsername = json['can_set_username'] == null ? null : json['can_set_username'];
    canSetStickerSet = json['can_set_sticker_set'] == null ? null : json['can_set_sticker_set'];
    canSetLocation = json['can_set_location'] == null ? null : json['can_set_location'];
    canGetStatistics = json['can_get_statistics'] == null ? null : json['can_get_statistics'];
    isAllHistoryAvailable = json['is_all_history_available'] == null ? null : json['is_all_history_available'];
    stickerSetId = json['sticker_set_id'] == null ? null : int.tryParse(json['sticker_set_id'] ?? "");
    location = json['location'] == null ? null : ChatLocation.fromJson(json['location'] ?? <String, dynamic>{});
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
    botCommands = json['bot_commands'] == null ? null : List<BotCommands>.from((json['bot_commands'] ?? [])!.map((item) => BotCommands.fromJson(item ?? <String, dynamic>{})).toList());
    upgradedFromBasicGroupId = json['upgraded_from_basic_group_id'] == null ? null : json['upgraded_from_basic_group_id'];
    upgradedFromMaxMessageId = json['upgraded_from_max_message_id'] == null ? null : json['upgraded_from_max_message_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "description": description,
      "member_count": memberCount,
      "administrator_count": administratorCount,
      "restricted_count": restrictedCount,
      "banned_count": bannedCount,
      "linked_chat_id": linkedChatId,
      "slow_mode_delay": slowModeDelay,
      "slow_mode_delay_expires_in": slowModeDelayExpiresIn,
      "can_get_members": canGetMembers,
      "can_set_username": canSetUsername,
      "can_set_sticker_set": canSetStickerSet,
      "can_set_location": canSetLocation,
      "can_get_statistics": canGetStatistics,
      "is_all_history_available": isAllHistoryAvailable,
      "sticker_set_id": stickerSetId,
      "location": location == null ? null : location?.toJson(),
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
      "bot_commands": botCommands?.map((i) => i.toJson()).toList(),
      "upgraded_from_basic_group_id": upgradedFromBasicGroupId,
      "upgraded_from_max_message_id": upgradedFromMaxMessageId,
    };
  }

  static const CONSTRUCTOR = 'supergroupFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}