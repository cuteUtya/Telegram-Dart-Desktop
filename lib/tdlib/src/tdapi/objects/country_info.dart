part of '../tdapi.dart';

class CountryInfo extends TdObject {

  /// Contains information about a country
  CountryInfo({this.countryCode,
    this.name,
    this.englishName,
    this.isHidden,
    this.callingCodes});

  /// [countryCode] A two-letter ISO 3166-1 alpha-2 country code
  String? countryCode;

  /// [name] Native name of the country
  String? name;

  /// [englishName] English name of the country
  String? englishName;

  /// [isHidden] True, if the country must be hidden from the list of all countries
  bool? isHidden;

  /// [callingCodes] List of country calling codes
  List<String>? callingCodes;

  /// Parse from a json
  CountryInfo.fromJson(Map<String, dynamic> json)  {
    String? pre_countryCode;
    try{
      pre_countryCode=json['country_code'];
   }catch(_){}
    countryCode = pre_countryCode;
    String? pre_name;
    try{
      pre_name=json['name'];
   }catch(_){}
    name = pre_name;
    String? pre_englishName;
    try{
      pre_englishName=json['english_name'];
   }catch(_){}
    englishName = pre_englishName;
    bool? pre_isHidden;
    try{
      pre_isHidden=json['is_hidden'];
   }catch(_){}
    isHidden = pre_isHidden;
    List<String>? pre_callingCodes;
    try{
      pre_callingCodes=List<String>.from((json['calling_codes'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    callingCodes = pre_callingCodes;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "country_code": countryCode,
      "name": name,
      "english_name": englishName,
      "is_hidden": isHidden,
      "calling_codes": callingCodes?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'countryInfo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}