part of '../tdapi.dart';

class DeletePassportElement extends TdFunction {

  /// Deletes a Telegram Passport element
  DeletePassportElement({this.type});

  /// [type] Element type
  PassportElementType? type;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  DeletePassportElement.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'deletePassportElement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}