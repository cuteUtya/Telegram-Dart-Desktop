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
    countryCode = json['country_code'];
    name = json['name'];
    englishName = json['english_name'];
    isHidden = json['is_hidden'];
    callingCodes = List<String>.from((json['calling_codes'] ?? [])!.map((item) => item).toList());
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