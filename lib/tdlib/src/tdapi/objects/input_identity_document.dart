part of '../tdapi.dart';

class InputIdentityDocument extends TdObject {

  /// An identity document to be saved to Telegram Passport
  InputIdentityDocument({this.number,
    this.expiryDate,
    this.frontSide,
    this.reverseSide,
    this.selfie,
    this.translation});

  /// [number] Document number; 1-24 characters 
  String? number;

  /// [expiryDate] Document expiry date; pass null if not applicable 
  Date? expiryDate;

  /// [frontSide] Front side of the document
  InputFile? frontSide;

  /// [reverseSide] Reverse side of the document; only for driver license and identity card; pass null otherwise
  InputFile? reverseSide;

  /// [selfie] Selfie with the document; pass null if unavailable 
  InputFile? selfie;

  /// [translation] List of files containing a certified English translation of the document
  List<InputFile>? translation;

  /// Parse from a json
  InputIdentityDocument.fromJson(Map<String, dynamic> json)  {
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
    InputFile? pre_frontSide;
    try{
      pre_frontSide=InputFile.fromJson(json['front_side'] ?? <String, dynamic>{});
   }catch(_){}
    frontSide = pre_frontSide;
    InputFile? pre_reverseSide;
    try{
      pre_reverseSide=InputFile.fromJson(json['reverse_side'] ?? <String, dynamic>{});
   }catch(_){}
    reverseSide = pre_reverseSide;
    InputFile? pre_selfie;
    try{
      pre_selfie=InputFile.fromJson(json['selfie'] ?? <String, dynamic>{});
   }catch(_){}
    selfie = pre_selfie;
    List<InputFile>? pre_translation;
    try{
      pre_translation=List<InputFile>.from((json['translation'] ?? [])!.map((item) => InputFile.fromJson(item ?? <String, dynamic>{})).toList());
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

  static const CONSTRUCTOR = 'inputIdentityDocument';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}