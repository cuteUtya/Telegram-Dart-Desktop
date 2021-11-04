part of '../tdapi.dart';

class ChatMembers extends TdObject {

  /// Contains a list of chat members
  ChatMembers({this.totalCount,
    this.members});

  /// [totalCount] Approximate total count of chat members found 
  int? totalCount;

  /// [members] A list of chat members
  List<ChatMember>? members;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatMembers.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'];
    members = List<ChatMember>.from((json['members'] ?? [])!.map((item) => ChatMember.fromJson(item ?? <String, dynamic>{})).toList());
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

  static const CONSTRUCTOR = 'chatMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}