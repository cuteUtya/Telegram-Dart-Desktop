part of '../tdapi.dart';

class LoginUrlInfo extends TdObject {

  /// Contains information about an inline button of type inlineKeyboardButtonTypeLoginUrl
  LoginUrlInfo();

  

  /// a LoginUrlInfo return type can be :
  /// * LoginUrlInfoOpen
  /// * LoginUrlInfoRequestConfirmation
  factory LoginUrlInfo.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case LoginUrlInfoOpen.CONSTRUCTOR:
        return LoginUrlInfoOpen.fromJson(json);
      case LoginUrlInfoRequestConfirmation.CONSTRUCTOR:
        return LoginUrlInfoRequestConfirmation.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'loginUrlInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LoginUrlInfoOpen extends LoginUrlInfo {

  /// An HTTP url needs to be open
  LoginUrlInfoOpen({this.url,
    this.skipConfirm});

  /// [url] The URL to open 
  String? url;

  /// [skipConfirm] True, if there is no need to show an ordinary open URL confirm
  bool? skipConfirm;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LoginUrlInfoOpen.fromJson(Map<String, dynamic> json)  {
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    bool? pre_skipConfirm;
    try{
      pre_skipConfirm=json['skip_confirm'];
   }catch(_){}
    skipConfirm = pre_skipConfirm;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "skip_confirm": skipConfirm,
    };
  }

  static const CONSTRUCTOR = 'loginUrlInfoOpen';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LoginUrlInfoRequestConfirmation extends LoginUrlInfo {

  /// An authorization confirmation dialog needs to be shown to the user
  LoginUrlInfoRequestConfirmation({this.url,
    this.domain,
    this.botUserId,
    this.requestWriteAccess});

  /// [url] An HTTP URL to be opened 
  String? url;

  /// [domain] A domain of the URL
  String? domain;

  /// [botUserId] User identifier of a bot linked with the website
  int? botUserId;

  /// [requestWriteAccess] True, if the user needs to be requested to give the permission to the bot to send them messages
  bool? requestWriteAccess;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LoginUrlInfoRequestConfirmation.fromJson(Map<String, dynamic> json)  {
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    String? pre_domain;
    try{
      pre_domain=json['domain'];
   }catch(_){}
    domain = pre_domain;
    int? pre_botUserId;
    try{
      pre_botUserId=json['bot_user_id'];
   }catch(_){}
    botUserId = pre_botUserId;
    bool? pre_requestWriteAccess;
    try{
      pre_requestWriteAccess=json['request_write_access'];
   }catch(_){}
    requestWriteAccess = pre_requestWriteAccess;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "url": url,
      "domain": domain,
      "bot_user_id": botUserId,
      "request_write_access": requestWriteAccess,
    };
  }

  static const CONSTRUCTOR = 'loginUrlInfoRequestConfirmation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}