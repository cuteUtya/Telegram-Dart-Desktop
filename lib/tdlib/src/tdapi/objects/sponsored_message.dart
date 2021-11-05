part of '../tdapi.dart';

class SponsoredMessage extends TdObject {

  /// Describes a sponsored message
  SponsoredMessage({this.id,
    this.sponsorChatId,
    this.link,
    this.content});

  /// [id] Unique sponsored message identifier 
  int? id;

  /// [sponsorChatId] Chat identifier
  int? sponsorChatId;

  /// [link] An internal link to be opened when the sponsored message is clicked; may be null. If null, the sponsor chat needs to be opened instead
  InternalLinkType? link;

  /// [content] Content of the message
  MessageContent? content;

  /// Parse from a json
  SponsoredMessage.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    int? pre_sponsorChatId;
    try{
      pre_sponsorChatId=json['sponsor_chat_id'];
   }catch(_){}
    sponsorChatId = pre_sponsorChatId;
    InternalLinkType? pre_link;
    try{
      pre_link=InternalLinkType.fromJson(json['link'] ?? <String, dynamic>{});
   }catch(_){}
    link = pre_link;
    MessageContent? pre_content;
    try{
      pre_content=MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
   }catch(_){}
    content = pre_content;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "sponsor_chat_id": sponsorChatId,
      "link": link == null ? null : link?.toJson(),
      "content": content == null ? null : content?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'sponsoredMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}