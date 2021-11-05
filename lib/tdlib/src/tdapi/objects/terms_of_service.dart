part of '../tdapi.dart';

class TermsOfService extends TdObject {

  /// Contains Telegram terms of service
  TermsOfService({this.text,
    this.minUserAge,
    this.showPopup});

  /// [text] Text of the terms of service 
  FormattedText? text;

  /// [minUserAge] The minimum age of a user to be able to accept the terms; 0 if any 
  int? minUserAge;

  /// [showPopup] True, if a blocking popup with terms of service must be shown to the user
  bool? showPopup;

  /// Parse from a json
  TermsOfService.fromJson(Map<String, dynamic> json)  {
    FormattedText? pre_text;
    try{
      pre_text=FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
   }catch(_){}
    text = pre_text;
    int? pre_minUserAge;
    try{
      pre_minUserAge=json['min_user_age'];
   }catch(_){}
    minUserAge = pre_minUserAge;
    bool? pre_showPopup;
    try{
      pre_showPopup=json['show_popup'];
   }catch(_){}
    showPopup = pre_showPopup;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text == null ? null : text?.toJson(),
      "min_user_age": minUserAge,
      "show_popup": showPopup,
    };
  }

  static const CONSTRUCTOR = 'termsOfService';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}