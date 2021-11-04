part of '../tdapi.dart';

class RemoveNotification extends TdFunction {

  /// Removes an active notification from notification list. Needs to be called only if the notification is removed by the current user
  RemoveNotification({this.notificationGroupId,
    this.notificationId});

  /// [notificationGroupId] Identifier of notification group to which the notification belongs 
  int? notificationGroupId;

  /// [notificationId] Identifier of removed notification
  int? notificationId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  RemoveNotification.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "notification_group_id": notificationGroupId,
      "notification_id": notificationId,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'removeNotification';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}