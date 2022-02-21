part of '../tdapi.dart';

class StickerType extends TdObject {

  /// Describes type of a sticker
  StickerType();

  

  /// a StickerType return type can be :
  /// * StickerTypeStatic
  /// * StickerTypeAnimated
  /// * StickerTypeVideo
  /// * StickerTypeMask
  factory StickerType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case StickerTypeStatic.CONSTRUCTOR:
        return StickerTypeStatic.fromJson(json);
      case StickerTypeAnimated.CONSTRUCTOR:
        return StickerTypeAnimated.fromJson(json);
      case StickerTypeVideo.CONSTRUCTOR:
        return StickerTypeVideo.fromJson(json);
      case StickerTypeMask.CONSTRUCTOR:
        return StickerTypeMask.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'stickerType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StickerTypeStatic extends StickerType {

  /// The sticker is an image in WEBP format
  StickerTypeStatic();

  

  /// Parse from a json
  StickerTypeStatic.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'stickerTypeStatic';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StickerTypeAnimated extends StickerType {

  /// The sticker is an animation in TGS format
  StickerTypeAnimated();

  

  /// Parse from a json
  StickerTypeAnimated.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'stickerTypeAnimated';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StickerTypeVideo extends StickerType {

  /// The sticker is a video in WEBM format
  StickerTypeVideo();

  

  /// Parse from a json
  StickerTypeVideo.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'stickerTypeVideo';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class StickerTypeMask extends StickerType {

  /// The sticker is a mask in WEBP format to be placed on photos or videos
  StickerTypeMask({this.maskPosition});

  /// [maskPosition] Position where the mask is placed; may be null
  MaskPosition? maskPosition;

  /// Parse from a json
  StickerTypeMask.fromJson(Map<String, dynamic> json)  {
    maskPosition = json['mask_position'] == null ? null : MaskPosition.fromJson(json['mask_position'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "mask_position": maskPosition == null ? null : maskPosition?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'stickerTypeMask';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}