part of '../tdapi.dart';

class CallbackQueryAnswer extends TdObject {

  /// Contains a bot's answer to a callback query
  CallbackQueryAnswer({this.text,
    this.showAlert,
    this.url});

  /// [text] Text of the answer 
  String? text;

  /// [showAlert] True, if an alert must be shown to the user instead of a toast notification 
  bool? showAlert;

  /// [url] URL to be opened
  String? url;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CallbackQueryAnswer.fromJson(Map<String, dynamic> json)  {
    String? pre_text;
    try{
      pre_text=json['text'];
   }catch(_){}
    text = pre_text;
    bool? pre_showAlert;
    try{
      pre_showAlert=json['show_alert'];
   }catch(_){}
    showAlert = pre_showAlert;
    String? pre_url;
    try{
      pre_url=json['url'];
   }catch(_){}
    url = pre_url;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "show_alert": showAlert,
      "url": url,
    };
  }

  static const CONSTRUCTOR = 'callbackQueryAnswer';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}