part of '../tdapi.dart';

class Users extends TdObject {

  /// Represents a list of users
  Users({this.totalCount,
    this.userIds});

  /// [totalCount] Approximate total count of users found 
  int? totalCount;

  /// [userIds] A list of user identifiers
  List<int>? userIds;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Users.fromJson(Map<String, dynamic> json)  {
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
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "user_ids": userIds?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'users';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}