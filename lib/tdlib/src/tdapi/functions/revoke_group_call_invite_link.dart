part of '../tdapi.dart';

class RevokeGroupCallInviteLink extends TdFunction {

  /// Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag
  RevokeGroupCallInviteLink({this.groupCallId});

  /// [groupCallId] Group call identifier
  int? groupCallId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RevokeGroupCallInviteLink.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'revokeGroupCallInviteLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}