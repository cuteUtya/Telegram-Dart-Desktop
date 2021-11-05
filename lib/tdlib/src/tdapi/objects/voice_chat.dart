part of '../tdapi.dart';

class VoiceChat extends TdObject {

  /// Describes a voice chat
  VoiceChat({this.groupCallId,
    this.hasParticipants,
    this.defaultParticipantId});

  /// [groupCallId] Group call identifier of an active voice chat; 0 if none. Full information about the voice chat can be received through the method getGroupCall
  int? groupCallId;

  /// [hasParticipants] True, if the voice chat has participants
  bool? hasParticipants;

  /// [defaultParticipantId] Default group call participant identifier to join the voice chat; may be null
  MessageSender? defaultParticipantId;

  /// Parse from a json
  VoiceChat.fromJson(Map<String, dynamic> json)  {
    int? pre_groupCallId;
    try{
      pre_groupCallId=json['group_call_id'];
   }catch(_){}
    groupCallId = pre_groupCallId;
    bool? pre_hasParticipants;
    try{
      pre_hasParticipants=json['has_participants'];
   }catch(_){}
    hasParticipants = pre_hasParticipants;
    MessageSender? pre_defaultParticipantId;
    try{
      pre_defaultParticipantId=MessageSender.fromJson(json['default_participant_id'] ?? <String, dynamic>{});
   }catch(_){}
    defaultParticipantId = pre_defaultParticipantId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "has_participants": hasParticipants,
      "default_participant_id": defaultParticipantId == null ? null : defaultParticipantId?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'voiceChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}