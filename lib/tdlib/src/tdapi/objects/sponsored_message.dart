part of '../tdapi.dart';

class SponsoredMessage extends TdObject {

  /// Describes a sponsored message
  SponsoredMessage({this.messageId,
    this.sponsorChatId,
    this.sponsorChatInfo,
    this.link,
    this.content});

  /// [messageId] Message identifier; unique for the chat to which the sponsored message belongs among both ordinary and sponsored messages
  int? messageId;

  /// [sponsorChatId] Sponsor chat identifier; 0 if the sponsor chat is accessible through an invite link
  int? sponsorChatId;

  /// [sponsorChatInfo] Information about the sponsor chat; may be null unless sponsor_chat_id == 0
  ChatInviteLinkInfo? sponsorChatInfo;

  /// [link] An internal link to be opened when the sponsored message is clicked; may be null. If null, the sponsor chat needs to be opened instead
  InternalLinkType? link;

  /// [content] Content of the message. Currently, can be only of the type messageText
  MessageContent? content;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SponsoredMessage.fromJson(Map<String, dynamic> json)  {
    messageId = json['message_id'] == null ? null : json['message_id'];
    sponsorChatId = json['sponsor_chat_id'] == null ? null : json['sponsor_chat_id'];
    sponsorChatInfo = json['sponsor_chat_info'] == null ? null : ChatInviteLinkInfo.fromJson(json['sponsor_chat_info'] ?? <String, dynamic>{});
    link = json['link'] == null ? null : InternalLinkType.fromJson(json['link'] ?? <String, dynamic>{});
    content = json['content'] == null ? null : MessageContent.fromJson(json['content'] ?? <String, dynamic>{});
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "message_id": messageId,
      "sponsor_chat_id": sponsorChatId,
      "sponsor_chat_info": sponsorChatInfo == null ? null : sponsorChatInfo?.toJson(),
      "link": link == null ? null : link?.toJson(),
      "content": content == null ? null : content?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'sponsoredMessage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}