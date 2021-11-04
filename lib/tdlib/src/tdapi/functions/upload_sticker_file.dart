part of '../tdapi.dart';

class UploadStickerFile extends TdFunction {

  /// Uploads a PNG image with a sticker; returns the uploaded file
  UploadStickerFile({this.userId,
    this.sticker});

  /// [userId] Sticker file owner; ignored for regular users 
  int? userId;

  /// [sticker] Sticker file to upload
  InputSticker? sticker;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  UploadStickerFile.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "sticker": sticker == null ? null : sticker?.toJson(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'uploadStickerFile';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}