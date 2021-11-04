part of '../tdapi.dart';

class GetChatNotificationSettingsExceptions extends TdFunction {

  /// Returns list of chats with non-default notification settings
  GetChatNotificationSettingsExceptions({this.scope,
    this.compareSound});

  /// [scope] If specified, only chats from the scope will be returned; pass null to return chats from all scopes
  NotificationSettingsScope? scope;

  /// [compareSound] If true, also chats with non-default sound will be returned
  bool? compareSound;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetChatNotificationSettingsExceptions.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "scope": scope == null ? null : scope?.toJson(),
      "compare_sound": compareSound,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getChatNotificationSettingsExceptions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}