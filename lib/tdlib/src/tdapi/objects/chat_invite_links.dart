part of '../tdapi.dart';

class ChatInviteLinks extends TdObject {

  /// Contains a list of chat invite links
  ChatInviteLinks({this.totalCount,
    this.inviteLinks});

  /// [totalCount] Approximate total count of chat invite links found 
  int? totalCount;

  /// [inviteLinks] List of invite links
  List<ChatInviteLink>? inviteLinks;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLinks.fromJson(Map<String, dynamic> json)  {
    totalCount = json['total_count'];
    inviteLinks = List<ChatInviteLink>.from((json['invite_links'] ?? [])!.map((item) => ChatInviteLink.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "total_count": totalCount,
      "invite_links": inviteLinks?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinks';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}