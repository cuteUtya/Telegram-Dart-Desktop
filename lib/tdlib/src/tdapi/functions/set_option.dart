part of '../tdapi.dart';

class SetOption extends TdFunction {

  /// Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
  SetOption({this.name,
    this.value});

  /// [name] The name of the option
  String? name;

  /// [value] The new value of the option; pass null to reset option value to a default value
  OptionValue? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SetOption.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "value": value == null ? null : value?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'setOption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}