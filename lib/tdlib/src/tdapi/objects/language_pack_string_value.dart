part of '../tdapi.dart';

class LanguagePackStringValue extends TdObject {

  /// Represents the value of a string in a language pack
  LanguagePackStringValue();

  

  /// a LanguagePackStringValue return type can be :
  /// * LanguagePackStringValueOrdinary
  /// * LanguagePackStringValuePluralized
  /// * LanguagePackStringValueDeleted
  factory LanguagePackStringValue.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case LanguagePackStringValueOrdinary.CONSTRUCTOR:
        return LanguagePackStringValueOrdinary.fromJson(json);
      case LanguagePackStringValuePluralized.CONSTRUCTOR:
        return LanguagePackStringValuePluralized.fromJson(json);
      case LanguagePackStringValueDeleted.CONSTRUCTOR:
        return LanguagePackStringValueDeleted.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'languagePackStringValue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LanguagePackStringValueOrdinary extends LanguagePackStringValue {

  /// An ordinary language pack string
  LanguagePackStringValueOrdinary({this.value});

  /// [value] String value
  String? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LanguagePackStringValueOrdinary.fromJson(Map<String, dynamic> json)  {
    String? pre_value;
    try{
      pre_value=json['value'];
   }catch(_){}
    value = pre_value;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
    };
  }

  static const CONSTRUCTOR = 'languagePackStringValueOrdinary';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LanguagePackStringValuePluralized extends LanguagePackStringValue {

  /// A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more info
  LanguagePackStringValuePluralized({this.zeroValue,
    this.oneValue,
    this.twoValue,
    this.fewValue,
    this.manyValue,
    this.otherValue});

  /// [zeroValue] Value for zero objects
  String? zeroValue;

  /// [oneValue] Value for one object 
  String? oneValue;

  /// [twoValue] Value for two objects
  String? twoValue;

  /// [fewValue] Value for few objects
  String? fewValue;

  /// [manyValue] Value for many objects 
  String? manyValue;

  /// [otherValue] Default value
  String? otherValue;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LanguagePackStringValuePluralized.fromJson(Map<String, dynamic> json)  {
    String? pre_zeroValue;
    try{
      pre_zeroValue=json['zero_value'];
   }catch(_){}
    zeroValue = pre_zeroValue;
    String? pre_oneValue;
    try{
      pre_oneValue=json['one_value'];
   }catch(_){}
    oneValue = pre_oneValue;
    String? pre_twoValue;
    try{
      pre_twoValue=json['two_value'];
   }catch(_){}
    twoValue = pre_twoValue;
    String? pre_fewValue;
    try{
      pre_fewValue=json['few_value'];
   }catch(_){}
    fewValue = pre_fewValue;
    String? pre_manyValue;
    try{
      pre_manyValue=json['many_value'];
   }catch(_){}
    manyValue = pre_manyValue;
    String? pre_otherValue;
    try{
      pre_otherValue=json['other_value'];
   }catch(_){}
    otherValue = pre_otherValue;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "zero_value": zeroValue,
      "one_value": oneValue,
      "two_value": twoValue,
      "few_value": fewValue,
      "many_value": manyValue,
      "other_value": otherValue,
    };
  }

  static const CONSTRUCTOR = 'languagePackStringValuePluralized';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class LanguagePackStringValueDeleted extends LanguagePackStringValue {

  /// A deleted language pack string, the value must be taken from the built-in English language pack
  LanguagePackStringValueDeleted();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  LanguagePackStringValueDeleted.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'languagePackStringValueDeleted';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}