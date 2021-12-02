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
    userId = json['user_id'] == null ? null : json['user_id'];
    addedMemberCount = json['added_member_count'] == null ? null : json['added_member_count'];
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