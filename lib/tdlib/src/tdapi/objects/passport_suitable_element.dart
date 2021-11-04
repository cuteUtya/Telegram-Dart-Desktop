part of '../tdapi.dart';

class PassportSuitableElement extends TdObject {

  /// Contains information about a Telegram Passport element that was requested by a service
  PassportSuitableElement({this.type,
    this.isSelfieRequired,
    this.isTranslationRequired,
    this.isNativeNameRequired});

  /// [type] Type of the element 
  PassportElementType? type;

  /// [isSelfieRequired] True, if a selfie is required with the identity document
  bool? isSelfieRequired;

  /// [isTranslationRequired] True, if a certified English translation is required with the document
  bool? isTranslationRequired;

  /// [isNativeNameRequired] True, if personal details must include the user's name in the language of their country of residence
  bool? isNativeNameRequired;

  /// Parse from a json
  PassportSuitableElement.fromJson(Map<String, dynamic> json)  {
    type = PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
    isSelfieRequired = json['is_selfie_required'];
    isTranslationRequired = json['is_translation_required'];
    isNativeNameRequired = json['is_native_name_required'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "is_selfie_required": isSelfieRequired,
      "is_translation_required": isTranslationRequired,
      "is_native_name_required": isNativeNameRequired,
    };
  }

  static const CONSTRUCTOR = 'passportSuitableElement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}