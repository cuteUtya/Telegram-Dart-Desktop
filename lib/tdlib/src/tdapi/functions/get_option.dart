part of '../tdapi.dart';

class GetOption extends TdFunction {

  /// Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization
  GetOption({this.name});

  /// [name] The name of the option
  String? name;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetOption.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'getOption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}