part of '../tdapi.dart';

class ChatStatisticsInviterInfo extends TdObject {

  /// Contains statistics about number of new members invited by a user
  ChatStatisticsInviterInfo({this.userId,
    this.addedMemberCount});

  /// [userId] User identifier
  int? userId;

  /// [addedMemberCount] Number of new members invited by the user
  int? addedMemberCount;

  /// Parse from a json
  ChatStatisticsInviterInfo.fromJson(Map<String, dynamic> json)  {
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_addedMemberCount;
    try{
      pre_addedMemberCount=json['added_member_count'];
   }catch(_){}
    addedMemberCount = pre_addedMemberCount;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "added_member_count": addedMemberCount,
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsInviterInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}