part of '../tdapi.dart';

class ChatSource extends TdObject {

  /// Describes a reason why an external chat is shown in a chat list
  ChatSource();

  

  /// a ChatSource return type can be :
  /// * ChatSourceMtprotoProxy
  /// * ChatSourcePublicServiceAnnouncement
  factory ChatSource.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatSourceMtprotoProxy.CONSTRUCTOR:
        return ChatSourceMtprotoProxy.fromJson(json);
      case ChatSourcePublicServiceAnnouncement.CONSTRUCTOR:
        return ChatSourcePublicServiceAnnouncement.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatSource';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatSourceMtprotoProxy extends ChatSource {

  /// The chat is sponsored by the user's MTProxy server
  ChatSourceMtprotoProxy();

  

  /// Parse from a json
  ChatSourceMtprotoProxy.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatSourceMtprotoProxy';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatSourcePublicServiceAnnouncement extends ChatSource {

  /// The chat contains a public service announcement
  ChatSourcePublicServiceAnnouncement({this.type,
    this.text});

  /// [type] The type of the announcement 
  String? type;

  /// [text] The text of the announcement
  String? text;

  /// Parse from a json
  ChatSourcePublicServiceAnnouncement.fromJson(Map<String, dynamic> json)  {
    String? pre_type;
    try{
      pre_type=json['type'];
   }catch(_){}
    type = pre_type;
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type,
      "text": text,
    };
  }

  static const CONSTRUCTOR = 'chatSourcePublicServiceAnnouncement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}