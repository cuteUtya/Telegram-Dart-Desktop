part of '../tdapi.dart';

class Sessions extends TdObject {

  /// Contains a list of sessions
  Sessions({this.sessions,
    this.inactiveSessionTtlDays});

  /// [sessions] List of sessions 
  List<Session>? sessions;

  /// [inactiveSessionTtlDays] Number of days of inactivity before sessions will automatically be terminated; 1-366 days
  int? inactiveSessionTtlDays;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Sessions.fromJson(Map<String, dynamic> json)  {
    sessions = json['sessions'] == null ? null : List<Session>.from((json['sessions'] ?? [])!.map((item) => Session.fromJson(item ?? <String, dynamic>{})).toList());
    inactiveSessionTtlDays = json['inactive_session_ttl_days'] == null ? null : json['inactive_session_ttl_days'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "sessions": sessions?.map((i) => i.toJson()).toList(),
      "inactive_session_ttl_days": inactiveSessionTtlDays,
    };
  }

  static const CONSTRUCTOR = 'sessions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}