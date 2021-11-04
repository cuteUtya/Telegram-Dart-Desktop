part of '../tdapi.dart';

class SetGroupCallParticipantVolumeLevel extends TdFunction {

  /// Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level
  SetGroupCallParticipantVolumeLevel({this.groupCallId,
    this.participantId,
    this.volumeLevel});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [participantId] Participant identifier 
  MessageSender? participantId;

  /// [volumeLevel] New participant's volume level; 1-20000 in hundreds of percents
  int? volumeLevel;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetGroupCallParticipantVolumeLevel.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "volume_level": volumeLevel,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setGroupCallParticipantVolumeLevel';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}