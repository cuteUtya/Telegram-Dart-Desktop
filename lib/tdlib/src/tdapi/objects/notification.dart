part of '../tdapi.dart';

class Notification extends TdObject {

  /// Contains information about a notification
  Notification({this.id,
    this.date,
    this.isSilent,
    this.type});

  /// [id] Unique persistent identifier of this notification 
  int? id;

  /// [date] Notification date
  int? date;

  /// [isSilent] True, if the notification was initially silent
  bool? isSilent;

  /// [type] Notification type
  NotificationType? type;

  /// Parse from a json
  Notification.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    bool? pre_isSilent;
    try{
      pre_isSilent=json['is_silent'];
   }catch(_){}
    isSilent = pre_isSilent;
    NotificationType? pre_type;
    try{
      pre_type=NotificationType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "date": date,
      "is_silent": isSilent,
      "type": type == null ? null : type?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'notification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}