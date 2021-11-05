part of '../tdapi.dart';

class SponsoredMessages extends TdObject {

  /// Contains a list of sponsored messages
  SponsoredMessages({this.messages});

  /// [messages] List of sponsored messages
  List<SponsoredMessage>? messages;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SponsoredMessages.fromJson(Map<String, dynamic> json)  {
    List<SponsoredMessage>? pre_messages;
    try{
      pre_messages=List<SponsoredMessage>.from((json['messages'] ?? [])!.map((item) => SponsoredMessage.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    messages = pre_messages;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "messages": messages?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'sponsoredMessages';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}