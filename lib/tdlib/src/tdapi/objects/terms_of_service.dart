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
    text = json['text'] == null ? null : FormattedText.fromJson(json['text'] ?? <String, dynamic>{});
    minUserAge = json['min_user_age'] == null ? null : json['min_user_age'];
    showPopup = json['show_popup'] == null ? null : json['show_popup'];
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