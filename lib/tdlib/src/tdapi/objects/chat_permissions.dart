part of '../tdapi.dart';

class ChatPermissions extends TdObject {

  /// Describes actions that a user is allowed to take in a chat
  ChatPermissions({this.canSendMessages,
    this.canSendMediaMessages,
    this.canSendPolls,
    this.canSendOtherMessages,
    this.canAddWebPagePreviews,
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPinMessages});

  /// [canSendMessages] True, if the user can send text messages, contacts, locations, and venues
  bool? canSendMessages;

  /// [canSendMediaMessages] True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
  bool? canSendMediaMessages;

  /// [canSendPolls] True, if the user can send polls. Implies can_send_messages permissions
  bool? canSendPolls;

  /// [canSendOtherMessages] True, if the user can send animations, games, stickers, and dice and use inline bots. Implies can_send_messages permissions
  bool? canSendOtherMessages;

  /// [canAddWebPagePreviews] True, if the user may add a web page preview to their messages. Implies can_send_messages permissions
  bool? canAddWebPagePreviews;

  /// [canChangeInfo] True, if the user can change the chat title, photo, and other settings
  bool? canChangeInfo;

  /// [canInviteUsers] True, if the user can invite new users to the chat
  bool? canInviteUsers;

  /// [canPinMessages] True, if the user can pin messages
  bool? canPinMessages;

  /// Parse from a json
  ChatPermissions.fromJson(Map<String, dynamic> json)  {
    bool? pre_canSendMessages;
    try{
      pre_canSendMessages=json['can_send_messages'];
   }catch(_){}
    canSendMessages = pre_canSendMessages;
    bool? pre_canSendMediaMessages;
    try{
      pre_canSendMediaMessages=json['can_send_media_messages'];
   }catch(_){}
    canSendMediaMessages = pre_canSendMediaMessages;
    bool? pre_canSendPolls;
    try{
      pre_canSendPolls=json['can_send_polls'];
   }catch(_){}
    canSendPolls = pre_canSendPolls;
    bool? pre_canSendOtherMessages;
    try{
      pre_canSendOtherMessages=json['can_send_other_messages'];
   }catch(_){}
    canSendOtherMessages = pre_canSendOtherMessages;
    bool? pre_canAddWebPagePreviews;
    try{
      pre_canAddWebPagePreviews=json['can_add_web_page_previews'];
   }catch(_){}
    canAddWebPagePreviews = pre_canAddWebPagePreviews;
    bool? pre_canChangeInfo;
    try{
      pre_canChangeInfo=json['can_change_info'];
   }catch(_){}
    canChangeInfo = pre_canChangeInfo;
    bool? pre_canInviteUsers;
    try{
      pre_canInviteUsers=json['can_invite_users'];
   }catch(_){}
    canInviteUsers = pre_canInviteUsers;
    bool? pre_canPinMessages;
    try{
      pre_canPinMessages=json['can_pin_messages'];
   }catch(_){}
    canPinMessages = pre_canPinMessages;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "can_send_messages": canSendMessages,
      "can_send_media_messages": canSendMediaMessages,
      "can_send_polls": canSendPolls,
      "can_send_other_messages": canSendOtherMessages,
      "can_add_web_page_previews": canAddWebPagePreviews,
      "can_change_info": canChangeInfo,
      "can_invite_users": canInviteUsers,
      "can_pin_messages": canPinMessages,
    };
  }

  static const CONSTRUCTOR = 'chatPermissions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}