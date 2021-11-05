part of '../tdapi.dart';

class InputPassportElementError extends TdObject {

  /// Contains the description of an error in a Telegram Passport element; for bots only
  InputPassportElementError({this.type,
    this.message,
    this.source});

  /// [type] Type of Telegram Passport element that has the error 
  PassportElementType? type;

  /// [message] Error message 
  String? message;

  /// [source] Error source
  InputPassportElementErrorSource? source;

  /// Parse from a json
  InputPassportElementError.fromJson(Map<String, dynamic> json)  {
    PassportElementType? pre_type;
    try{
      pre_type=PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    String? pre_message;
    try{
      pre_message=json['message'];
   }catch(_){}
    message = pre_message;
    InputPassportElementErrorSource? pre_source;
    try{
      pre_source=InputPassportElementErrorSource.fromJson(json['source'] ?? <String, dynamic>{});
   }catch(_){}
    source = pre_source;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "message": message,
      "source": source == null ? null : source?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputPassportElementError';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}