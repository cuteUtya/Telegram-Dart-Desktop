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
    number = json['number'] == null ? null : json['number'];
    expiryDate = json['expiry_date'] == null ? null : Date.fromJson(json['expiry_date'] ?? <String, dynamic>{});
    frontSide = json['front_side'] == null ? null : DatedFile.fromJson(json['front_side'] ?? <String, dynamic>{});
    reverseSide = json['reverse_side'] == null ? null : DatedFile.fromJson(json['reverse_side'] ?? <String, dynamic>{});
    selfie = json['selfie'] == null ? null : DatedFile.fromJson(json['selfie'] ?? <String, dynamic>{});
    translation = json['translation'] == null ? null : List<DatedFile>.from((json['translation'] ?? [])!.map((item) => DatedFile.fromJson(item ?? <String, dynamic>{})).toList());
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