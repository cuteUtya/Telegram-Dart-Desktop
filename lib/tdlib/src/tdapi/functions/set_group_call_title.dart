part of '../tdapi.dart';

class SetGroupCallTitle extends TdFunction {

  /// Sets group call title. Requires groupCall.can_be_managed group call flag
  SetGroupCallTitle({this.groupCallId,
    this.title});

  /// [groupCallId] Group call identifier 
  int? groupCallId;

  /// [title] New group call title; 1-64 characters
  String? title;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetGroupCallTitle.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "group_call_id": groupCallId,
      "title": title,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setGroupCallTitle';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}