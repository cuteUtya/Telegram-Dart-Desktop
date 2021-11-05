part of '../tdapi.dart';

class MessageLink extends TdObject {

  /// Contains an HTTPS link to a message in a supergroup or channel
  MessageLink({this.link,
    this.isPublic});

  /// [link] Message link 
  String? link;

  /// [isPublic] True, if the link will work for non-members of the chat
  bool? isPublic;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  MessageLink.fromJson(Map<String, dynamic> json)  {
    String? pre_link;
    try{
      pre_link=json['link'];
   }catch(_){}
    link = pre_link;
    bool? pre_isPublic;
    try{
      pre_isPublic=json['is_public'];
   }catch(_){}
    isPublic = pre_isPublic;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "link": link,
      "is_public": isPublic,
    };
  }

  static const CONSTRUCTOR = 'messageLink';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}