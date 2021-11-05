part of '../tdapi.dart';

class ScopeNotificationSettings extends TdObject {

  /// Contains information about notification settings for several chats
  ScopeNotificationSettings({this.muteFor,
    this.sound,
    this.showPreview,
    this.disablePinnedMessageNotifications,
    this.disableMentionNotifications});

  /// [muteFor] Time left before notifications will be unmuted, in seconds
  int? muteFor;

  /// [sound] The name of an audio file to be used for notification sounds; only applies to iOS applications
  String? sound;

  /// [showPreview] True, if message content must be displayed in notifications
  bool? showPreview;

  /// [disablePinnedMessageNotifications] True, if notifications for incoming pinned messages will be created as for an ordinary unread message
  bool? disablePinnedMessageNotifications;

  /// [disableMentionNotifications] True, if notifications for messages with mentions will be created as for an ordinary unread message
  bool? disableMentionNotifications;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ScopeNotificationSettings.fromJson(Map<String, dynamic> json)  {
    int? pre_muteFor;
    try{
      pre_muteFor=json['mute_for'];
   }catch(_){}
    muteFor = pre_muteFor;
    String? pre_sound;
    try{
      pre_sound=json['sound'];
   }catch(_){}
    sound = pre_sound;
    bool? pre_showPreview;
    try{
      pre_showPreview=json['show_preview'];
   }catch(_){}
    showPreview = pre_showPreview;
    bool? pre_disablePinnedMessageNotifications;
    try{
      pre_disablePinnedMessageNotifications=json['disable_pinned_message_notifications'];
   }catch(_){}
    disablePinnedMessageNotifications = pre_disablePinnedMessageNotifications;
    bool? pre_disableMentionNotifications;
    try{
      pre_disableMentionNotifications=json['disable_mention_notifications'];
   }catch(_){}
    disableMentionNotifications = pre_disableMentionNotifications;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "mute_for": muteFor,
      "sound": sound,
      "show_preview": showPreview,
      "disable_pinned_message_notifications": disablePinnedMessageNotifications,
      "disable_mention_notifications": disableMentionNotifications,
    };
  }

  static const CONSTRUCTOR = 'scopeNotificationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}