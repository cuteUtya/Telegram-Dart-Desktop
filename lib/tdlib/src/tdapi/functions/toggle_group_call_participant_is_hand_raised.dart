part of '../tdapi.dart';

class ToggleGroupCallParticipantIsHandRaised extends TdFunction {

  /// Toggles whether a group call participant hand is rased
  ToggleGroupCallParticipantIsHandRaised({this.groupCallId,
    this.participantId,
    this.isHandRaised});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// [participantId] Participant identifier
  MessageSender? participantId;

  /// [isHandRaised] Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed group call flag to lower other's hand
  bool? isHandRaised;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleGroupCallParticipantIsHandRaised.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "participant_id": participantId == null ? null : participantId?.toJson(),
      "is_hand_raised": isHandRaised,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleGroupCallParticipantIsHandRaised';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}