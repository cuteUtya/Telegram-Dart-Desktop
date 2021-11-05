part of '../tdapi.dart';

class DeepLinkInfo extends TdObject {

  /// Contains information about a tg: deep link
  DeepLinkInfo({this.text,
    this.needUpdateApplication});

  /// [text] Text to be shown to the user 
  FormattedText? text;

  /// [needUpdateApplication] True, if the user must be asked to update the application
  bool? needUpdateApplication;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeepLinkInfo.fromJson(Map<String, dynamic> json)  {
    FormattedText? pre_text;
    try{
      pre_text=FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    bool? pre_needUpdateApplication;
    try{
      pre_needUpdateApplication=json['need_update_application'];
   }catch(_){}
    needUpdateApplication = pre_needUpdateApplication;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "need_update_application": needUpdateApplication,
    };
  }

  static const CONSTRUCTOR = 'deepLinkInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}