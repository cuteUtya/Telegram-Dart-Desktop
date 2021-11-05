part of '../tdapi.dart';

class ChatNotificationSettings extends TdObject {

  /// Contains information about notification settings for a chat
  ChatNotificationSettings({this.useDefaultMuteFor,
    this.muteFor,
    this.useDefaultSound,
    this.sound,
    this.useDefaultShowPreview,
    this.showPreview,
    this.useDefaultDisablePinnedMessageNotifications,
    this.disablePinnedMessageNotifications,
    this.useDefaultDisableMentionNotifications,
    this.disableMentionNotifications});

  /// [useDefaultMuteFor] If true, mute_for is ignored and the value for the relevant type of chat is used instead
  bool? useDefaultMuteFor;

  /// [muteFor] Time left before notifications will be unmuted, in seconds
  int? muteFor;

  /// [useDefaultSound] If true, sound is ignored and the value for the relevant type of chat is used instead
  bool? useDefaultSound;

  /// [sound] The name of an audio file to be used for notification sounds; only applies to iOS applications
  String? sound;

  /// [useDefaultShowPreview] If true, show_preview is ignored and the value for the relevant type of chat is used instead
  bool? useDefaultShowPreview;

  /// [showPreview] True, if message content must be displayed in notifications
  bool? showPreview;

  /// [useDefaultDisablePinnedMessageNotifications] If true, disable_pinned_message_notifications is ignored and the value for the relevant type of chat is used instead
  bool? useDefaultDisablePinnedMessageNotifications;

  /// [disablePinnedMessageNotifications] If true, notifications for incoming pinned messages will be created as for an ordinary unread message
  bool? disablePinnedMessageNotifications;

  /// [useDefaultDisableMentionNotifications] If true, disable_mention_notifications is ignored and the value for the relevant type of chat is used instead
  bool? useDefaultDisableMentionNotifications;

  /// [disableMentionNotifications] If true, notifications for messages with mentions will be created as for an ordinary unread message
  bool? disableMentionNotifications;

  /// Parse from a json
  ChatNotificationSettings.fromJson(Map<String, dynamic> json)  {
    bool? pre_useDefaultMuteFor;
    try{
      pre_useDefaultMuteFor=json['use_default_mute_for'];
   }catch(_){}
    useDefaultMuteFor = pre_useDefaultMuteFor;
    int? pre_muteFor;
    try{
      pre_muteFor=json['mute_for'];
   }catch(_){}
    muteFor = pre_muteFor;
    bool? pre_useDefaultSound;
    try{
      pre_useDefaultSound=json['use_default_sound'];
   }catch(_){}
    useDefaultSound = pre_useDefaultSound;
    String? pre_sound;
    try{
      pre_sound=json['sound'];
   }catch(_){}
    sound = pre_sound;
    bool? pre_useDefaultShowPreview;
    try{
      pre_useDefaultShowPreview=json['use_default_show_preview'];
   }catch(_){}
    useDefaultShowPreview = pre_useDefaultShowPreview;
    bool? pre_showPreview;
    try{
      pre_showPreview=json['show_preview'];
   }catch(_){}
    showPreview = pre_showPreview;
    bool? pre_useDefaultDisablePinnedMessageNotifications;
    try{
      pre_useDefaultDisablePinnedMessageNotifications=json['use_default_disable_pinned_message_notifications'];
   }catch(_){}
    useDefaultDisablePinnedMessageNotifications = pre_useDefaultDisablePinnedMessageNotifications;
    bool? pre_disablePinnedMessageNotifications;
    try{
      pre_disablePinnedMessageNotifications=json['disable_pinned_message_notifications'];
   }catch(_){}
    disablePinnedMessageNotifications = pre_disablePinnedMessageNotifications;
    bool? pre_useDefaultDisableMentionNotifications;
    try{
      pre_useDefaultDisableMentionNotifications=json['use_default_disable_mention_notifications'];
   }catch(_){}
    useDefaultDisableMentionNotifications = pre_useDefaultDisableMentionNotifications;
    bool? pre_disableMentionNotifications;
    try{
      pre_disableMentionNotifications=json['disable_mention_notifications'];
   }catch(_){}
    disableMentionNotifications = pre_disableMentionNotifications;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "use_default_mute_for": useDefaultMuteFor,
      "mute_for": muteFor,
      "use_default_sound": useDefaultSound,
      "sound": sound,
      "use_default_show_preview": useDefaultShowPreview,
      "show_preview": showPreview,
      "use_default_disable_pinned_message_notifications": useDefaultDisablePinnedMessageNotifications,
      "disable_pinned_message_notifications": disablePinnedMessageNotifications,
      "use_default_disable_mention_notifications": useDefaultDisableMentionNotifications,
      "disable_mention_notifications": disableMentionNotifications,
    };
  }

  static const CONSTRUCTOR = 'chatNotificationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}