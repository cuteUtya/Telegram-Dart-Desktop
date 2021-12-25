part of '../tdapi.dart';

class ToggleSessionCanAcceptCalls extends TdFunction {

  /// Toggles whether a session can accept incoming calls
  ToggleSessionCanAcceptCalls({this.sessionId,
    this.canAcceptCalls});

  /// [sessionId] Session identifier 
  int? sessionId;

  /// [canAcceptCalls] True, if incoming calls can be accepted by the session
  bool? canAcceptCalls;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleSessionCanAcceptCalls.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "session_id": sessionId,
      "can_accept_calls": canAcceptCalls,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleSessionCanAcceptCalls';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}