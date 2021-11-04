part of '../tdapi.dart';

class SearchBackground extends TdFunction {

  /// Searches for a background by its name
  SearchBackground({this.name});

  /// [name] The name of the background
  String? name;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SearchBackground.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'searchBackground';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}