part of '../tdapi.dart';

class ChatInviteLinkMembers extends TdObject {

  /// Contains a list of chat members joined a chat by an invite link
  ChatInviteLinkMembers({this.totalCount,
    this.members});

  /// [totalCount] Approximate total count of chat members found 
  int? totalCount;

  /// [members] List of chat members, joined a chat by an invite link
  List<ChatInviteLinkMember>? members;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLinkMembers.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'];
    members = List<ChatInviteLinkMember>.from((json['members'] ?? [])!.map((item) => ChatInviteLinkMember.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "members": members?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}