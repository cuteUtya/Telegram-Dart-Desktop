part of '../tdapi.dart';

class PassportAuthorizationForm extends TdObject {

  /// Contains information about a Telegram Passport authorization form that was requested
  PassportAuthorizationForm({this.id,
    this.requiredElements,
    this.privacyPolicyUrl});

  /// [id] Unique identifier of the authorization form
  int? id;

  /// [requiredElements] Telegram Passport elements that must be provided to complete the form
  List<PassportRequiredElement>? requiredElements;

  /// [privacyPolicyUrl] URL for the privacy policy of the service; may be empty
  String? privacyPolicyUrl;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  PassportAuthorizationForm.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    List<PassportRequiredElement>? pre_requiredElements;
    try{
      pre_requiredElements=List<PassportRequiredElement>.from((json['required_elements'] ?? [])!.map((item) => PassportRequiredElement.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    requiredElements = pre_requiredElements;
    String? pre_privacyPolicyUrl;
    try{
      pre_privacyPolicyUrl=json['privacy_policy_url'];
   }catch(_){}
    privacyPolicyUrl = pre_privacyPolicyUrl;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "required_elements": requiredElements?.map((i) => i.toJson()).toList(),
      "privacy_policy_url": privacyPolicyUrl,
    };
  }

  static const CONSTRUCTOR = 'passportAuthorizationForm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}