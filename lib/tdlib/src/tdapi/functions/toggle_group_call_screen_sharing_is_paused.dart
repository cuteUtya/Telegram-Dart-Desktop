part of '../tdapi.dart';

class ToggleGroupCallScreenSharingIsPaused extends TdFunction {

  /// Pauses or unpauses screen sharing in a joined group call
  ToggleGroupCallScreenSharingIsPaused({this.groupCallId,
    this.isPaused});

  /// [groupCallId] Group call identifier 
  int? groupCallId;

  /// [isPaused] True if screen sharing is paused
  bool? isPaused;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallScreenSharingIsPaused.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "is_paused": isPaused,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallScreenSharingIsPaused';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}