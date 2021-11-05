part of '../tdapi.dart';

class IdentityDocument extends TdObject {

  /// An identity document
  IdentityDocument({this.number,
    this.expiryDate,
    this.frontSide,
    this.reverseSide,
    this.selfie,
    this.translation});

  /// [number] Document number; 1-24 characters 
  String? number;

  /// [expiryDate] Document expiry date; may be null if not applicable 
  Date? expiryDate;

  /// [frontSide] Front side of the document
  DatedFile? frontSide;

  /// [reverseSide] Reverse side of the document; only for driver license and identity card; may be null
  DatedFile? reverseSide;

  /// [selfie] Selfie with the document; may be null 
  DatedFile? selfie;

  /// [translation] List of files containing a certified English translation of the document
  List<DatedFile>? translation;

  /// Parse from a json
  IdentityDocument.fromJson(Map<String, dynamic> json)  {
    String? pre_number;
    try{
      pre_number=json['number'];
   }catch(_){}
    number = pre_number;
    Date? pre_expiryDate;
    try{
      pre_expiryDate=Date.fromJson(json['expiry_date'] ?? <String, dynamic>{});
   }catch(_){}
    expiryDate = pre_expiryDate;
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
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "number": number,
      "expiry_date": expiryDate == null ? null : expiryDate?.toJson(),
      "front_side": frontSide == null ? null : frontSide?.toJson(),
      "reverse_side": reverseSide == null ? null : reverseSide?.toJson(),
      "selfie": selfie == null ? null : selfie?.toJson(),
      "translation": translation?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'identityDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}