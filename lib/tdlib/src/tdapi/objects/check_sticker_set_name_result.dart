part of '../tdapi.dart';

class CheckStickerSetNameResult extends TdObject {

  /// Represents result of checking whether a name can be used for a new sticker set
  CheckStickerSetNameResult();

  

  /// a CheckStickerSetNameResult return type can be :
  /// * CheckStickerSetNameResultOk
  /// * CheckStickerSetNameResultNameInvalid
  /// * CheckStickerSetNameResultNameOccupied
  factory CheckStickerSetNameResult.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case CheckStickerSetNameResultOk.CONSTRUCTOR:
        return CheckStickerSetNameResultOk.fromJson(json);
      case CheckStickerSetNameResultNameInvalid.CONSTRUCTOR:
        return CheckStickerSetNameResultNameInvalid.fromJson(json);
      case CheckStickerSetNameResultNameOccupied.CONSTRUCTOR:
        return CheckStickerSetNameResultNameOccupied.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'checkStickerSetNameResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CheckStickerSetNameResultOk extends CheckStickerSetNameResult {

  /// The name can be set
  CheckStickerSetNameResultOk();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckStickerSetNameResultOk.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'checkStickerSetNameResultOk';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CheckStickerSetNameResultNameInvalid extends CheckStickerSetNameResult {

  /// The name is invalid
  CheckStickerSetNameResultNameInvalid();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckStickerSetNameResultNameInvalid.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'checkStickerSetNameResultNameInvalid';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CheckStickerSetNameResultNameOccupied extends CheckStickerSetNameResult {

  /// The name is occupied
  CheckStickerSetNameResultNameOccupied();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckStickerSetNameResultNameOccupied.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'checkStickerSetNameResultNameOccupied';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}