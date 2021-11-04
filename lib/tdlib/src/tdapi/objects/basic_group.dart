part of '../tdapi.dart';

class BasicGroup extends TdObject {

  /// Represents a basic group of 0-200 users (must be upgraded to a supergroup to accommodate more than 200 users)
  BasicGroup({this.id,
    this.memberCount,
    this.status,
    this.isActive,
    this.upgradedToSupergroupId});

  /// [id] Group identifier
  int? id;

  /// [memberCount] Number of members in the group
  int? memberCount;

  /// [status] Status of the current user in the group
  ChatMemberStatus? status;

  /// [isActive] True, if the group is active
  bool? isActive;

  /// [upgradedToSupergroupId] Identifier of the supergroup to which this group was upgraded; 0 if none
  int? upgradedToSupergroupId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  BasicGroup.fromJson(Map<String, dynamic> json)  {
    id = json['id'];
    memberCount = json['member_count'];
    status = ChatMemberStatus.fromJson(json['status'] ?? <String, dynamic>{});
    isActive = json['is_active'];
    upgradedToSupergroupId = json['upgraded_to_supergroup_id'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "member_count": memberCount,
      "status": status == null ? null : status?.toJson(),
      "is_active": isActive,
      "upgraded_to_supergroup_id": upgradedToSupergroupId,
    };
  }

  static const CONSTRUCTOR = 'basicGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}