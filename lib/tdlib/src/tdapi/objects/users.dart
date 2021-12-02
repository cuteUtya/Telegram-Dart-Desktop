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
    totalCount = json['total_count'] == null ? null : json['total_count'];
    userIds = json['user_ids'] == null ? null : List<int>.from((json['user_ids'] ?? [])!.map((item) => item).toList());
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