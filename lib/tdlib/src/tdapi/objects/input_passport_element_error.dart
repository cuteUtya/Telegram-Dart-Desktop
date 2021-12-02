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
    type = json['type'] == null ? null : PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
    message = json['message'] == null ? null : json['message'];
    source = json['source'] == null ? null : InputPassportElementErrorSource.fromJson(json['source'] ?? <String, dynamic>{});
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