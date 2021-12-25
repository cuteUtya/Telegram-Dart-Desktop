part of '../tdapi.dart';

class ToggleSessionCanAcceptSecretChats extends TdFunction {

  /// Toggles whether a session can accept incoming secret chats
  ToggleSessionCanAcceptSecretChats({this.sessionId,
    this.canAcceptSecretChats});

  /// [sessionId] Session identifier 
  int? sessionId;

  /// [canAcceptSecretChats] True, if incoming secret chats can be accepted by the session
  bool? canAcceptSecretChats;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ToggleSessionCanAcceptSecretChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "session_id": sessionId,
      "can_accept_secret_chats": canAcceptSecretChats,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'toggleSessionCanAcceptSecretChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}