part of '../tdapi.dart';

class Countries extends TdObject {

  /// Contains information about countries
  Countries({this.countries});

  /// [countries] The list of countries
  List<CountryInfo>? countries;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  Countries.fromJson(Map<String, dynamic> json)  {
    countries = json['countries'] == null ? null : List<CountryInfo>.from((json['countries'] ?? [])!.map((item) => CountryInfo.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "countries": countries?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'countries';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}