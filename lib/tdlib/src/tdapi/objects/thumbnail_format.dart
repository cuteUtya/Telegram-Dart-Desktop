part of '../tdapi.dart';

class ThumbnailFormat extends TdObject {

  /// Describes format of a thumbnail
  ThumbnailFormat();

  

  /// a ThumbnailFormat return type can be :
  /// * ThumbnailFormatJpeg
  /// * ThumbnailFormatGif
  /// * ThumbnailFormatMpeg4
  /// * ThumbnailFormatPng
  /// * ThumbnailFormatTgs
  /// * ThumbnailFormatWebm
  /// * ThumbnailFormatWebp
  factory ThumbnailFormat.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ThumbnailFormatJpeg.CONSTRUCTOR:
        return ThumbnailFormatJpeg.fromJson(json);
      case ThumbnailFormatGif.CONSTRUCTOR:
        return ThumbnailFormatGif.fromJson(json);
      case ThumbnailFormatMpeg4.CONSTRUCTOR:
        return ThumbnailFormatMpeg4.fromJson(json);
      case ThumbnailFormatPng.CONSTRUCTOR:
        return ThumbnailFormatPng.fromJson(json);
      case ThumbnailFormatTgs.CONSTRUCTOR:
        return ThumbnailFormatTgs.fromJson(json);
      case ThumbnailFormatWebm.CONSTRUCTOR:
        return ThumbnailFormatWebm.fromJson(json);
      case ThumbnailFormatWebp.CONSTRUCTOR:
        return ThumbnailFormatWebp.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormat';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatJpeg extends ThumbnailFormat {

  /// The thumbnail is in JPEG format
  ThumbnailFormatJpeg();

  

  /// Parse from a json
  ThumbnailFormatJpeg.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatJpeg';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatGif extends ThumbnailFormat {

  /// The thumbnail is in static GIF format. It will be used only for some bot inline results
  ThumbnailFormatGif();

  

  /// Parse from a json
  ThumbnailFormatGif.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatGif';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatMpeg4 extends ThumbnailFormat {

  /// The thumbnail is in MPEG4 format. It will be used only for some animations and videos
  ThumbnailFormatMpeg4();

  

  /// Parse from a json
  ThumbnailFormatMpeg4.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatMpeg4';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatPng extends ThumbnailFormat {

  /// The thumbnail is in PNG format. It will be used only for background patterns
  ThumbnailFormatPng();

  

  /// Parse from a json
  ThumbnailFormatPng.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatPng';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatTgs extends ThumbnailFormat {

  /// The thumbnail is in TGS format. It will be used only for TGS sticker sets
  ThumbnailFormatTgs();

  

  /// Parse from a json
  ThumbnailFormatTgs.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatTgs';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatWebm extends ThumbnailFormat {

  /// The thumbnail is in WEBM format. It will be used only for WEBM sticker sets
  ThumbnailFormatWebm();

  

  /// Parse from a json
  ThumbnailFormatWebm.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatWebm';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ThumbnailFormatWebp extends ThumbnailFormat {

  /// The thumbnail is in WEBP format. It will be used only for some stickers
  ThumbnailFormatWebp();

  

  /// Parse from a json
  ThumbnailFormatWebp.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'thumbnailFormatWebp';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}