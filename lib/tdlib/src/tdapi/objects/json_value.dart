part of '../tdapi.dart';

class JsonValue extends TdObject {

  /// Represents a JSON value
  JsonValue();

  

  /// a JsonValue return type can be :
  /// * JsonValueNull
  /// * JsonValueBoolean
  /// * JsonValueNumber
  /// * JsonValueString
  /// * JsonValueArray
  /// * JsonValueObject
  factory JsonValue.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case JsonValueNull.CONSTRUCTOR:
        return JsonValueNull.fromJson(json);
      case JsonValueBoolean.CONSTRUCTOR:
        return JsonValueBoolean.fromJson(json);
      case JsonValueNumber.CONSTRUCTOR:
        return JsonValueNumber.fromJson(json);
      case JsonValueString.CONSTRUCTOR:
        return JsonValueString.fromJson(json);
      case JsonValueArray.CONSTRUCTOR:
        return JsonValueArray.fromJson(json);
      case JsonValueObject.CONSTRUCTOR:
        return JsonValueObject.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'jsonValue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueNull extends JsonValue {

  /// Represents a null JSON value
  JsonValueNull();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueNull.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'jsonValueNull';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueBoolean extends JsonValue {

  /// Represents a boolean JSON value
  JsonValueBoolean({this.value});

  /// [value] The value
  bool? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueBoolean.fromJson(Map<String, dynamic> json)  {
    value = json['value'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
    };
  }

  static const CONSTRUCTOR = 'jsonValueBoolean';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueNumber extends JsonValue {

  /// Represents a numeric JSON value
  JsonValueNumber({this.value});

  /// [value] The value
  double? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueNumber.fromJson(Map<String, dynamic> json)  {
    value = json['value'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
    };
  }

  static const CONSTRUCTOR = 'jsonValueNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueString extends JsonValue {

  /// Represents a string JSON value
  JsonValueString({this.value});

  /// [value] The value
  String? value;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueString.fromJson(Map<String, dynamic> json)  {
    value = json['value'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "value": value,
    };
  }

  static const CONSTRUCTOR = 'jsonValueString';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueArray extends JsonValue {

  /// Represents a JSON array
  JsonValueArray({this.values});

  /// [values] The list of array elements
  List<JsonValue>? values;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueArray.fromJson(Map<String, dynamic> json)  {
    values = List<JsonValue>.from((json['values'] ?? [])!.map((item) => JsonValue.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "values": values?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'jsonValueArray';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class JsonValueObject extends JsonValue {

  /// Represents a JSON object
  JsonValueObject({this.members});

  /// [members] The list of object members
  List<JsonObjectMember>? members;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  JsonValueObject.fromJson(Map<String, dynamic> json)  {
    members = List<JsonObjectMember>.from((json['members'] ?? [])!.map((item) => JsonObjectMember.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "members": members?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'jsonValueObject';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}