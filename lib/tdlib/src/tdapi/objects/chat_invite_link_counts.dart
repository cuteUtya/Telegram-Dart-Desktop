part of '../tdapi.dart';

class ChatInviteLinkCounts extends TdObject {

  /// Contains a list of chat invite link counts
  ChatInviteLinkCounts({this.inviteLinkCounts});

  /// [inviteLinkCounts] List of invite link counts
  List<ChatInviteLinkCount>? inviteLinkCounts;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatInviteLinkCounts.fromJson(Map<String, dynamic> json)  {
    List<ChatInviteLinkCount>? pre_inviteLinkCounts;
    try{
      pre_inviteLinkCounts=List<ChatInviteLinkCount>.from((json['invite_link_counts'] ?? [])!.map((item) => ChatInviteLinkCount.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    inviteLinkCounts = pre_inviteLinkCounts;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link_counts": inviteLinkCounts?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatInviteLinkCounts';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}