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
    muteFor = json['mute_for'];
    sound = json['sound'];
    showPreview = json['show_preview'];
    disablePinnedMessageNotifications = json['disable_pinned_message_notifications'];
    disableMentionNotifications = json['disable_mention_notifications'];
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