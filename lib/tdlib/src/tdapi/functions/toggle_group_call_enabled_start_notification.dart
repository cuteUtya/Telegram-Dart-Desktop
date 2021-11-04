part of '../tdapi.dart';

class ToggleGroupCallEnabledStartNotification extends TdFunction {

  /// Toggles whether the current user will receive a notification when the group call will start; scheduled group calls only
  ToggleGroupCallEnabledStartNotification({this.groupCallId,
    this.enabledStartNotification});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [enabledStartNotification] New value of the enabled_start_notification setting
  bool? enabledStartNotification;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallEnabledStartNotification.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "enabled_start_notification": enabledStartNotification,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallEnabledStartNotification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}