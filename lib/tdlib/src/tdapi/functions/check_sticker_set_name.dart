part of '../tdapi.dart';

class CheckStickerSetName extends TdFunction {

  /// Checks whether a name can be used for a new sticker set
  CheckStickerSetName({this.name});

  /// [name] Name to be checked
  String? name;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CheckStickerSetName.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "name": name,
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'checkStickerSetName';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}