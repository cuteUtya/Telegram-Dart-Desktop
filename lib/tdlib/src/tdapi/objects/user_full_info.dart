part of '../tdapi.dart';

class UserFullInfo extends TdObject {

  /// Contains full information about a user
  UserFullInfo({this.photo,
    this.isBlocked,
    this.canBeCalled,
    this.supportsVideoCalls,
    this.hasPrivateCalls,
    this.hasPrivateForwards,
    this.needPhoneNumberPrivacyException,
    this.bio,
    this.shareText,
    this.description,
    this.groupInCommonCount,
    this.commands});

  /// [photo] User profile photo; may be null
  ChatPhoto? photo;

  /// [isBlocked] True, if the user is blocked by the current user
  bool? isBlocked;

  /// [canBeCalled] True, if the user can be called
  bool? canBeCalled;

  /// [supportsVideoCalls] True, if a video call can be created with the user
  bool? supportsVideoCalls;

  /// [hasPrivateCalls] True, if the user can't be called due to their privacy settings
  bool? hasPrivateCalls;

  /// [hasPrivateForwards] True, if the user can't be linked in forwarded messages due to their privacy settings
  bool? hasPrivateForwards;

  /// [needPhoneNumberPrivacyException] True, if the current user needs to explicitly allow to share their phone number with the user when the method addContact is used
  bool? needPhoneNumberPrivacyException;

  /// [bio] A short user bio
  String? bio;

  /// [shareText] For bots, the text that is shown on the bot's profile page and is sent together with the link when users share the bot
  String? shareText;

  /// [description] For bots, the text shown in the chat with the bot if the chat is empty
  String? description;

  /// [groupInCommonCount] Number of group chats where both the other user and the current user are a member; 0 for the current user
  int? groupInCommonCount;

  /// [commands] For bots, list of the bot commands
  List<BotCommand>? commands;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UserFullInfo.fromJson(Map<String, dynamic> json)  {
    photo = json['photo'] == null ? null : ChatPhoto.fromJson(json['photo'] ?? <String, dynamic>{});
    isBlocked = json['is_blocked'] == null ? null : json['is_blocked'];
    canBeCalled = json['can_be_called'] == null ? null : json['can_be_called'];
    supportsVideoCalls = json['supports_video_calls'] == null ? null : json['supports_video_calls'];
    hasPrivateCalls = json['has_private_calls'] == null ? null : json['has_private_calls'];
    hasPrivateForwards = json['has_private_forwards'] == null ? null : json['has_private_forwards'];
    needPhoneNumberPrivacyException = json['need_phone_number_privacy_exception'] == null ? null : json['need_phone_number_privacy_exception'];
    bio = json['bio'] == null ? null : json['bio'];
    shareText = json['share_text'] == null ? null : json['share_text'];
    description = json['description'] == null ? null : json['description'];
    groupInCommonCount = json['group_in_common_count'] == null ? null : json['group_in_common_count'];
    commands = json['commands'] == null ? null : List<BotCommand>.from((json['commands'] ?? [])!.map((item) => BotCommand.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": photo == null ? null : photo?.toJson(),
      "is_blocked": isBlocked,
      "can_be_called": canBeCalled,
      "supports_video_calls": supportsVideoCalls,
      "has_private_calls": hasPrivateCalls,
      "has_private_forwards": hasPrivateForwards,
      "need_phone_number_privacy_exception": needPhoneNumberPrivacyException,
      "bio": bio,
      "share_text": shareText,
      "description": description,
      "group_in_common_count": groupInCommonCount,
      "commands": commands?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'userFullInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}