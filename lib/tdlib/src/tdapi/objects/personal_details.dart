part of '../tdapi.dart';

class PersonalDetails extends TdObject {

  /// Contains the user's personal details
  PersonalDetails({this.firstName,
    this.middleName,
    this.lastName,
    this.nativeFirstName,
    this.nativeMiddleName,
    this.nativeLastName,
    this.birthdate,
    this.gender,
    this.countryCode,
    this.residenceCountryCode});

  /// [firstName] First name of the user written in English; 1-255 characters
  String? firstName;

  /// [middleName] Middle name of the user written in English; 0-255 characters 
  String? middleName;

  /// [lastName] Last name of the user written in English; 1-255 characters
  String? lastName;

  /// [nativeFirstName] Native first name of the user; 1-255 characters
  String? nativeFirstName;

  /// [nativeMiddleName] Native middle name of the user; 0-255 characters 
  String? nativeMiddleName;

  /// [nativeLastName] Native last name of the user; 1-255 characters
  String? nativeLastName;

  /// [birthdate] Birthdate of the user
  Date? birthdate;

  /// [gender] Gender of the user, "male" or "female" 
  String? gender;

  /// [countryCode] A two-letter ISO 3166-1 alpha-2 country code of the user's country 
  String? countryCode;

  /// [residenceCountryCode] A two-letter ISO 3166-1 alpha-2 country code of the user's residence country
  String? residenceCountryCode;

  /// Parse from a json
  PersonalDetails.fromJson(Map<String, dynamic> json)  {
    String? pre_firstName;
    try{
      pre_firstName=json['first_name'];
   }catch(_){}
    firstName = pre_firstName;
    String? pre_middleName;
    try{
      pre_middleName=json['middle_name'];
   }catch(_){}
    middleName = pre_middleName;
    String? pre_lastName;
    try{
      pre_lastName=json['last_name'];
   }catch(_){}
    lastName = pre_lastName;
    String? pre_nativeFirstName;
    try{
      pre_nativeFirstName=json['native_first_name'];
   }catch(_){}
    nativeFirstName = pre_nativeFirstName;
    String? pre_nativeMiddleName;
    try{
      pre_nativeMiddleName=json['native_middle_name'];
   }catch(_){}
    nativeMiddleName = pre_nativeMiddleName;
    String? pre_nativeLastName;
    try{
      pre_nativeLastName=json['native_last_name'];
   }catch(_){}
    nativeLastName = pre_nativeLastName;
    Date? pre_birthdate;
    try{
      pre_birthdate=Date.fromJson(json['birthdate'] ?? <String, dynamic>{});
   }catch(_){}
    birthdate = pre_birthdate;
    String? pre_gender;
    try{
      pre_gender=json['gender'];
   }catch(_){}
    gender = pre_gender;
    String? pre_countryCode;
    try{
      pre_countryCode=json['country_code'];
   }catch(_){}
    countryCode = pre_countryCode;
    String? pre_residenceCountryCode;
    try{
      pre_residenceCountryCode=json['residence_country_code'];
   }catch(_){}
    residenceCountryCode = pre_residenceCountryCode;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "first_name": firstName,
      "middle_name": middleName,
      "last_name": lastName,
      "native_first_name": nativeFirstName,
      "native_middle_name": nativeMiddleName,
      "native_last_name": nativeLastName,
      "birthdate": birthdate == null ? null : birthdate?.toJson(),
      "gender": gender,
      "country_code": countryCode,
      "residence_country_code": residenceCountryCode,
    };
  }

  static const CONSTRUCTOR = 'personalDetails';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}