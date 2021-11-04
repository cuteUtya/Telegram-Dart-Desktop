part of '../tdapi.dart';

class ToggleGroupCallIsMyVideoEnabled extends TdFunction {

  /// Toggles whether current user's video is enabled
  ToggleGroupCallIsMyVideoEnabled({this.groupCallId,
    this.isMyVideoEnabled});

  /// [groupCallId] Group call identifier 
  int? groupCallId;

  /// [isMyVideoEnabled] Pass true if the current user's video is enabled
  bool? isMyVideoEnabled;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallIsMyVideoEnabled.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "is_my_video_enabled": isMyVideoEnabled,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallIsMyVideoEnabled';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}