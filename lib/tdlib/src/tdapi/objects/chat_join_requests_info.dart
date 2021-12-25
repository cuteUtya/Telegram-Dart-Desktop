part of '../tdapi.dart';

class ChatJoinRequestsInfo extends TdObject {

  /// Contains information about pending join requests for a chat
  ChatJoinRequestsInfo({this.totalCount,
    this.userIds});

  /// [totalCount] Total number of pending join requests 
  int? totalCount;

  /// [userIds] Identifiers of at most 3 users sent the newest pending join requests
  List<int>? userIds;

  /// Parse from a json
  ChatJoinRequestsInfo.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'] == null ? null : json['total_count'];
    userIds = json['user_ids'] == null ? null : List<int>.from((json['user_ids'] ?? [])!.map((item) => item).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "user_ids": userIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatJoinRequestsInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}