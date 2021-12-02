part of '../tdapi.dart';

class BasicGroupFullInfo extends TdObject {

  /// Contains full information about a basic group
  BasicGroupFullInfo({this.photo,
    this.description,
    this.creatorUserId,
    this.members,
    this.inviteLink,
    this.botCommands});

  /// [photo] Chat photo; may be null
  ChatPhoto? photo;

  /// [description] Group description. Updated only after the basic group is opened
  String? description;

  /// [creatorUserId] User identifier of the creator of the group; 0 if unknown
  int? creatorUserId;

  /// [members] Group members
  List<ChatMember>? members;

  /// [inviteLink] Primary invite link for this group; may be null. For chat administrators with can_invite_users right only. Updated only after the basic group is opened
  ChatInviteLink? inviteLink;

  /// [botCommands] List of commands of bots in the group
  List<BotCommands>? botCommands;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  BasicGroupFullInfo.fromJson(Map<String, dynamic> json)  {
    photo = json['photo'] == null ? null : ChatPhoto.fromJson(json['photo'] ?? <String, dynamic>{});
    description = json['description'] == null ? null : json['description'];
    creatorUserId = json['creator_user_id'] == null ? null : json['creator_user_id'];
    members = json['members'] == null ? null : List<ChatMember>.from((json['members'] ?? [])!.map((item) => ChatMember.fromJson(item ?? <String, dynamic>{})).toList());
    inviteLink = json['invite_link'] == null ? null : ChatInviteLink.fromJson(json['invite_link'] ?? <String, dynamic>{});
    botCommands = json['bot_commands'] == null ? null : List<BotCommands>.from((json['bot_commands'] ?? [])!.map((item) => BotCommands.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "description": description,
      "creator_user_id": creatorUserId,
      "members": members?.map((i) => i.toJson()).toList(),
      "invite_link": inviteLink == null ? null : inviteLink?.toJson(),
      "bot_commands": botCommands?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'basicGroupFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}