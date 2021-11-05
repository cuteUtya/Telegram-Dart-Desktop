part of '../tdapi.dart';

class Sessions extends TdObject {

  /// Contains a list of sessions
  Sessions({this.sessions});

  /// [sessions] List of sessions
  List<Session>? sessions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Sessions.fromJson(Map<String, dynamic> json)  {
    List<Session>? pre_sessions;
    try{
      pre_sessions=List<Session>.from((json['sessions'] ?? [])!.map((item) => Session.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    sessions = pre_sessions;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sessions": sessions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'sessions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}