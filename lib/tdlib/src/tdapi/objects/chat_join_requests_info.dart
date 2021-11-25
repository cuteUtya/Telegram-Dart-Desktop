part of '../tdapi.dart';

class ChatJoinRequestsInfo extends TdObject {

  /// Contains information about pending chat join requests
  ChatJoinRequestsInfo({this.totalCount,
    this.userIds});

  /// [totalCount] Total number of pending join requests 
  int? totalCount;

  /// [userIds] Identifiers of users sent the newest pending join requests
  List<int>? userIds;

  /// Parse from a json
  ChatJoinRequestsInfo.fromJson(Map<String, dynamic> json)  {
    int? pre_totalCount;
    try{
      pre_totalCount=json['total_count'];
   }catch(_){}
    totalCount = pre_totalCount;
    List<int>? pre_userIds;
    try{
      pre_userIds=List<int>.from((json['user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    userIds = pre_userIds;
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