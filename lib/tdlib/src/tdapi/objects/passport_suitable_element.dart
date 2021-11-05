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
    PassportElementType? pre_type;
    try{
      pre_type=PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    bool? pre_isSelfieRequired;
    try{
      pre_isSelfieRequired=json['is_selfie_required'];
   }catch(_){}
    isSelfieRequired = pre_isSelfieRequired;
    bool? pre_isTranslationRequired;
    try{
      pre_isTranslationRequired=json['is_translation_required'];
   }catch(_){}
    isTranslationRequired = pre_isTranslationRequired;
    bool? pre_isNativeNameRequired;
    try{
      pre_isNativeNameRequired=json['is_native_name_required'];
   }catch(_){}
    isNativeNameRequired = pre_isNativeNameRequired;
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