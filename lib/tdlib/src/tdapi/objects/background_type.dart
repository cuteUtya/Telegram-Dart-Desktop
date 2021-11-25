part of '../tdapi.dart';

class BackgroundType extends TdObject {

  /// Describes the type of a background
  BackgroundType();

  

  /// a BackgroundType return type can be :
  /// * BackgroundTypeWallpaper
  /// * BackgroundTypePattern
  /// * BackgroundTypeFill
  factory BackgroundType.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case BackgroundTypeWallpaper.CONSTRUCTOR:
        return BackgroundTypeWallpaper.fromJson(json);
      case BackgroundTypePattern.CONSTRUCTOR:
        return BackgroundTypePattern.fromJson(json);
      case BackgroundTypeFill.CONSTRUCTOR:
        return BackgroundTypeFill.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'backgroundType';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundTypeWallpaper extends BackgroundType {

  /// A wallpaper in JPEG format
  BackgroundTypeWallpaper({this.isBlurred,
    this.isMoving});

  /// [isBlurred] True, if the wallpaper must be downscaled to fit in 450x450 square and then box-blurred with radius 12
  bool? isBlurred;

  /// [isMoving] True, if the background needs to be slightly moved when device is tilted
  bool? isMoving;

  /// Parse from a json
  BackgroundTypeWallpaper.fromJson(Map<String, dynamic> json)  {
    bool? pre_isBlurred;
    try{
      pre_isBlurred=json['is_blurred'];
   }catch(_){}
    isBlurred = pre_isBlurred;
    bool? pre_isMoving;
    try{
      pre_isMoving=json['is_moving'];
   }catch(_){}
    isMoving = pre_isMoving;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_blurred": isBlurred,
      "is_moving": isMoving,
    };
  }

  static const CONSTRUCTOR = 'backgroundTypeWallpaper';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundTypePattern extends BackgroundType {

  /// A PNG or TGV (gzipped subset of SVG with MIME type "application/x-tgwallpattern") pattern to be combined with the background fill chosen by the user
  BackgroundTypePattern({this.fill,
    this.intensity,
    this.isInverted,
    this.isMoving});

  /// [fill] Fill of the background
  BackgroundFill? fill;

  /// [intensity] Intensity of the pattern when it is shown above the filled background; 0-100.
  int? intensity;

  /// [isInverted] True, if the background fill must be applied only to the pattern itself. All other pixels are black in this case. For dark themes only
  bool? isInverted;

  /// [isMoving] True, if the background needs to be slightly moved when device is tilted
  bool? isMoving;

  /// Parse from a json
  BackgroundTypePattern.fromJson(Map<String, dynamic> json)  {
    BackgroundFill? pre_fill;
    try{
      pre_fill=BackgroundFill.fromJson(json['fill'] ?? <String, dynamic>{});
   }catch(_){}
    fill = pre_fill;
    int? pre_intensity;
    try{
      pre_intensity=json['intensity'];
   }catch(_){}
    intensity = pre_intensity;
    bool? pre_isInverted;
    try{
      pre_isInverted=json['is_inverted'];
   }catch(_){}
    isInverted = pre_isInverted;
    bool? pre_isMoving;
    try{
      pre_isMoving=json['is_moving'];
   }catch(_){}
    isMoving = pre_isMoving;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "fill": fill == null ? null : fill?.toJson(),
      "intensity": intensity,
      "is_inverted": isInverted,
      "is_moving": isMoving,
    };
  }

  static const CONSTRUCTOR = 'backgroundTypePattern';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundTypeFill extends BackgroundType {

  /// A filled background
  BackgroundTypeFill({this.fill});

  /// [fill] The background fill
  BackgroundFill? fill;

  /// Parse from a json
  BackgroundTypeFill.fromJson(Map<String, dynamic> json)  {
    BackgroundFill? pre_fill;
    try{
      pre_fill=BackgroundFill.fromJson(json['fill'] ?? <String, dynamic>{});
   }catch(_){}
    fill = pre_fill;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "fill": fill == null ? null : fill?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'backgroundTypeFill';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}