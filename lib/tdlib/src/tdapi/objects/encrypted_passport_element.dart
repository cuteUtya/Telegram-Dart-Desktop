part of '../tdapi.dart';

class EncryptedPassportElement extends TdObject {

  /// Contains information about an encrypted Telegram Passport element; for bots only
  EncryptedPassportElement({this.type,
    this.data,
    this.frontSide,
    this.reverseSide,
    this.selfie,
    this.translation,
    this.files,
    this.value,
    this.hash});

  /// [type] Type of Telegram Passport element 
  PassportElementType? type;

  /// [data] Encrypted JSON-encoded data about the user 
  String? data;

  /// [frontSide] The front side of an identity document 
  DatedFile? frontSide;

  /// [reverseSide] The reverse side of an identity document; may be null 
  DatedFile? reverseSide;

  /// [selfie] Selfie with the document; may be null 
  DatedFile? selfie;

  /// [translation] List of files containing a certified English translation of the document 
  List<DatedFile>? translation;

  /// [files] List of attached files 
  List<DatedFile>? files;

  /// [value] Unencrypted data, phone number or email address 
  String? value;

  /// [hash] Hash of the entire element
  String? hash;

  /// Parse from a json
  EncryptedPassportElement.fromJson(Map<String, dynamic> json)  {
    PassportElementType? pre_type;
    try{
      pre_type=PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    String? pre_data;
    try{
      pre_data=json['data'];
   }catch(_){}
    data = pre_data;
    DatedFile? pre_frontSide;
    try{
      pre_frontSide=DatedFile.fromJson(json['front_side'] ?? <String, dynamic>{});
   }catch(_){}
    frontSide = pre_frontSide;
    DatedFile? pre_reverseSide;
    try{
      pre_reverseSide=DatedFile.fromJson(json['reverse_side'] ?? <String, dynamic>{});
   }catch(_){}
    reverseSide = pre_reverseSide;
    DatedFile? pre_selfie;
    try{
      pre_selfie=DatedFile.fromJson(json['selfie'] ?? <String, dynamic>{});
   }catch(_){}
    selfie = pre_selfie;
    List<DatedFile>? pre_translation;
    try{
      pre_translation=List<DatedFile>.from((json['translation'] ?? [])!.map((item) => DatedFile.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    translation = pre_translation;
    List<DatedFile>? pre_files;
    try{
      pre_files=List<DatedFile>.from((json['files'] ?? [])!.map((item) => DatedFile.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    files = pre_files;
    String? pre_value;
    try{
      pre_value=json['value'];
   }catch(_){}
    value = pre_value;
    String? pre_hash;
    try{
      pre_hash=json['hash'];
   }catch(_){}
    hash = pre_hash;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": type == null ? null : type?.toJson(),
      "data": data,
      "front_side": frontSide == null ? null : frontSide?.toJson(),
      "reverse_side": reverseSide == null ? null : reverseSide?.toJson(),
      "selfie": selfie == null ? null : selfie?.toJson(),
      "translation": translation?.map((i) => i.toJson()).toList(),
      "files": files?.map((i) => i.toJson()).toList(),
      "value": value,
      "hash": hash,
    };
  }

  static const CONSTRUCTOR = 'encryptedPassportElement';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}