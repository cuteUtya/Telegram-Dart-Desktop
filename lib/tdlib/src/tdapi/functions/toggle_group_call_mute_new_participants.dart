part of '../tdapi.dart';

class ToggleGroupCallMuteNewParticipants extends TdFunction {

  /// Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_toggle_mute_new_participants group call flag
  ToggleGroupCallMuteNewParticipants({this.groupCallId,
    this.muteNewParticipants});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [muteNewParticipants] New value of the mute_new_participants setting
  bool? muteNewParticipants;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallMuteNewParticipants.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "mute_new_participants": muteNewParticipants,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallMuteNewParticipants';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}