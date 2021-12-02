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
    canSendMessages = json['can_send_messages'] == null ? null : json['can_send_messages'];
    canSendMediaMessages = json['can_send_media_messages'] == null ? null : json['can_send_media_messages'];
    canSendPolls = json['can_send_polls'] == null ? null : json['can_send_polls'];
    canSendOtherMessages = json['can_send_other_messages'] == null ? null : json['can_send_other_messages'];
    canAddWebPagePreviews = json['can_add_web_page_previews'] == null ? null : json['can_add_web_page_previews'];
    canChangeInfo = json['can_change_info'] == null ? null : json['can_change_info'];
    canInviteUsers = json['can_invite_users'] == null ? null : json['can_invite_users'];
    canPinMessages = json['can_pin_messages'] == null ? null : json['can_pin_messages'];
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