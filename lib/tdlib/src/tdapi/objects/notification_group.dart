part of '../tdapi.dart';

class NotificationGroup extends TdObject {

  /// Describes a group of notifications
  NotificationGroup({this.id,
    this.type,
    this.chatId,
    this.totalCount,
    this.notifications});

  /// [id] Unique persistent auto-incremented from 1 identifier of the notification group 
  int? id;

  /// [type] Type of the group
  NotificationGroupType? type;

  /// [chatId] Identifier of a chat to which all notifications in the group belong
  int? chatId;

  /// [totalCount] Total number of active notifications in the group
  int? totalCount;

  /// [notifications] The list of active notifications
  List<Notification>? notifications;

  /// Parse from a json
  NotificationGroup.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    NotificationGroupType? pre_type;
    try{
      pre_type=NotificationGroupType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    int? pre_chatId;
    try{
      pre_chatId=json['chat_id'];
   }catch(_){}
    chatId = pre_chatId;
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<Notification>? pre_notifications;
    try{
      pre_notifications=List<Notification>.from((json['notifications'] ?? [])!.map((item) => Notification.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    notifications = pre_notifications;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "type": type == null ? null : type?.toJson(),
      "chat_id": chatId,
      "total_count": totalCount,
      "notifications": notifications?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'notificationGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}