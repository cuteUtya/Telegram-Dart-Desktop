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
    number = json['number'];
    expiryDate = Date.fromJson(json['expiry_date'] ?? <String, dynamic>{});
    frontSide = InputFile.fromJson(json['front_side'] ?? <String, dynamic>{});
    reverseSide = InputFile.fromJson(json['reverse_side'] ?? <String, dynamic>{});
    selfie = InputFile.fromJson(json['selfie'] ?? <String, dynamic>{});
    translation = List<InputFile>.from((json['translation'] ?? [])!.map((item) => InputFile.fromJson(item ?? <String, dynamic>{})).toList());
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