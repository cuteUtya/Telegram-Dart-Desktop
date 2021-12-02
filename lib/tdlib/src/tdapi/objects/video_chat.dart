part of '../tdapi.dart';

class VideoChat extends TdObject {

  /// Describes a video chat
  VideoChat({this.groupCallId,
    this.hasParticipants,
    this.defaultParticipantId});

  /// [groupCallId] Group call identifier of an active video chat; 0 if none. Full information about the video chat can be received through the method getGroupCall
  int? groupCallId;

  /// [hasParticipants] True, if the video chat has participants
  bool? hasParticipants;

  /// [defaultParticipantId] Default group call participant identifier to join the video chat; may be null
  MessageSender? defaultParticipantId;

  /// Parse from a json
  VideoChat.fromJson(Map<String, dynamic> json)  {
    groupCallId = json['group_call_id'] == null ? null : json['group_call_id'];
    hasParticipants = json['has_participants'] == null ? null : json['has_participants'];
    defaultParticipantId = json['default_participant_id'] == null ? null : MessageSender.fromJson(json['default_participant_id'] ?? <String, dynamic>{});
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

  static const CONSTRUCTOR = 'videoChat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}