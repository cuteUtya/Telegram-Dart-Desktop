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
    id = json['id'] == null ? null : json['id'];
    sponsorChatId = json['sponsor_chat_id'] == null ? null : json['sponsor_chat_id'];
    link = json['link'] == null ? null : InternalLinkType.fromJson(json['link'] ?? <String, dynamic>{});
    content = json['content'] == null ? null : MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
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