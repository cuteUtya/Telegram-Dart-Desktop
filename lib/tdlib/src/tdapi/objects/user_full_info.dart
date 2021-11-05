part of '../tdapi.dart';

class UserFullInfo extends TdObject {

  /// Contains full information about a user
  UserFullInfo({this.photo,
    this.isBlocked,
    this.canBeCalled,
    this.supportsVideoCalls,
    this.hasPrivateCalls,
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
    ChatPhoto? pre_photo;
    try{
      pre_photo=ChatPhoto.fromJson(json['photo'] ?? <String, dynamic>{});
   }catch(_){}
    photo = pre_photo;
    bool? pre_isBlocked;
    try{
      pre_isBlocked=json['is_blocked'];
   }catch(_){}
    isBlocked = pre_isBlocked;
    bool? pre_canBeCalled;
    try{
      pre_canBeCalled=json['can_be_called'];
   }catch(_){}
    canBeCalled = pre_canBeCalled;
    bool? pre_supportsVideoCalls;
    try{
      pre_supportsVideoCalls=json['supports_video_calls'];
   }catch(_){}
    supportsVideoCalls = pre_supportsVideoCalls;
    bool? pre_hasPrivateCalls;
    try{
      pre_hasPrivateCalls=json['has_private_calls'];
   }catch(_){}
    hasPrivateCalls = pre_hasPrivateCalls;
    bool? pre_needPhoneNumberPrivacyException;
    try{
      pre_needPhoneNumberPrivacyException=json['need_phone_number_privacy_exception'];
   }catch(_){}
    needPhoneNumberPrivacyException = pre_needPhoneNumberPrivacyException;
    String? pre_bio;
    try{
      pre_bio=json['bio'];
   }catch(_){}
    bio = pre_bio;
    String? pre_shareText;
    try{
      pre_shareText=json['share_text'];
   }catch(_){}
    shareText = pre_shareText;
    String? pre_description;
    try{
      pre_description=json['description'];
   }catch(_){}
    description = pre_description;
    int? pre_groupInCommonCount;
    try{
      pre_groupInCommonCount=json['group_in_common_count'];
   }catch(_){}
    groupInCommonCount = pre_groupInCommonCount;
    List<BotCommand>? pre_commands;
    try{
      pre_commands=List<BotCommand>.from((json['commands'] ?? [])!.map((item) => BotCommand.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    commands = pre_commands;
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