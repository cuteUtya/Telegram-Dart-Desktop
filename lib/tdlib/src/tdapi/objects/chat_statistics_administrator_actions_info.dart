part of '../tdapi.dart';

class ChatStatisticsAdministratorActionsInfo extends TdObject {

  /// Contains statistics about administrator actions done by a user
  ChatStatisticsAdministratorActionsInfo({this.userId,
    this.deletedMessageCount,
    this.bannedUserCount,
    this.restrictedUserCount});

  /// [userId] Administrator user identifier
  int? userId;

  /// [deletedMessageCount] Number of messages deleted by the administrator
  int? deletedMessageCount;

  /// [bannedUserCount] Number of users banned by the administrator
  int? bannedUserCount;

  /// [restrictedUserCount] Number of users restricted by the administrator
  int? restrictedUserCount;

  /// Parse from a json
  ChatStatisticsAdministratorActionsInfo.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_deletedMessageCount;
    try{
      pre_deletedMessageCount=json['deleted_message_count'];
   }catch(_){}
    deletedMessageCount = pre_deletedMessageCount;
    int? pre_bannedUserCount;
    try{
      pre_bannedUserCount=json['banned_user_count'];
   }catch(_){}
    bannedUserCount = pre_bannedUserCount;
    int? pre_restrictedUserCount;
    try{
      pre_restrictedUserCount=json['restricted_user_count'];
   }catch(_){}
    restrictedUserCount = pre_restrictedUserCount;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "deleted_message_count": deletedMessageCount,
      "banned_user_count": bannedUserCount,
      "restricted_user_count": restrictedUserCount,
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsAdministratorActionsInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}