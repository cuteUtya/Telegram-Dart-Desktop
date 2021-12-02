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
    id = json['id'] == null ? null : json['id'];
    requiredElements = json['required_elements'] == null ? null : List<PassportRequiredElement>.from((json['required_elements'] ?? [])!.map((item) => PassportRequiredElement.fromJson(item ?? <String, dynamic>{})).toList());
    privacyPolicyUrl = json['privacy_policy_url'] == null ? null : json['privacy_policy_url'];
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