part of '../tdapi.dart';

class GetBackgroundUrl extends TdFunction {

  /// Constructs a persistent HTTP URL for a background
  GetBackgroundUrl({this.name,
    this.type});

  /// [name] Background name 
  String? name;

  /// [type] Background type
  BackgroundType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetBackgroundUrl.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getBackgroundUrl';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}