part of '../tdapi.dart';

class LoadGroupCallParticipants extends TdFunction {

  /// Loads more participants of a group call. The loaded participants will be received through updates. Use the field groupCall.loaded_all_participants to check whether all participants has already been loaded
  LoadGroupCallParticipants({this.groupCallId,
    this.limit});

  /// [groupCallId] Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
  int? groupCallId;

  /// [limit] The maximum number of participants to load; up to 100
  int? limit;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LoadGroupCallParticipants.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "limit": limit,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'loadGroupCallParticipants';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}