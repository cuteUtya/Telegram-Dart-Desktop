part of '../tdapi.dart';

class ResetAllNotificationSettings extends TdFunction {

  /// Resets all notification settings to their default values. By default, all chats are unmuted, the sound is set to "default" and message previews are shown
  ResetAllNotificationSettings();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ResetAllNotificationSettings.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'resetAllNotificationSettings';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}