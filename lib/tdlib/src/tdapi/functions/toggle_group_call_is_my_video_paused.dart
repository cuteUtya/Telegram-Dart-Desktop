part of '../tdapi.dart';

class ToggleGroupCallIsMyVideoPaused extends TdFunction {

  /// Toggles whether current user's video is paused
  ToggleGroupCallIsMyVideoPaused({this.groupCallId,
    this.isMyVideoPaused});

  /// [groupCallId] Group call identifier 
  int? groupCallId;

  /// [isMyVideoPaused] Pass true if the current user's video is paused
  bool? isMyVideoPaused;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallIsMyVideoPaused.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "is_my_video_paused": isMyVideoPaused,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallIsMyVideoPaused';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}