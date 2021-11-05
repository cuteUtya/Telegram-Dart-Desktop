part of '../tdapi.dart';

class BackgroundFill extends TdObject {

  /// Describes a fill of a background
  BackgroundFill();

  

  /// a BackgroundFill return type can be :
  /// * BackgroundFillSolid
  /// * BackgroundFillGradient
  /// * BackgroundFillFreeformGradient
  factory BackgroundFill.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case BackgroundFillSolid.CONSTRUCTOR:
        return BackgroundFillSolid.fromJson(json);
      case BackgroundFillGradient.CONSTRUCTOR:
        return BackgroundFillGradient.fromJson(json);
      case BackgroundFillFreeformGradient.CONSTRUCTOR:
        return BackgroundFillFreeformGradient.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'backgroundFill';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundFillSolid extends BackgroundFill {

  /// Describes a solid fill of a background
  BackgroundFillSolid({this.color});

  /// [color] A color of the background in the RGB24 format
  int? color;

  /// Parse from a json
  BackgroundFillSolid.fromJson(Map<String, dynamic> json)  {
    int? pre_color;
    try{
      pre_color=json['color'];
   }catch(_){}
    color = pre_color;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "color": color,
    };
  }

  static const CONSTRUCTOR = 'backgroundFillSolid';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundFillGradient extends BackgroundFill {

  /// Describes a gradient fill of a background
  BackgroundFillGradient({this.topColor,
    this.bottomColor,
    this.rotationAngle});

  /// [topColor] A top color of the background in the RGB24 format 
  int? topColor;

  /// [bottomColor] A bottom color of the background in the RGB24 format
  int? bottomColor;

  /// [rotationAngle] Clockwise rotation angle of the gradient, in degrees; 0-359. Must be always divisible by 45
  int? rotationAngle;

  /// Parse from a json
  BackgroundFillGradient.fromJson(Map<String, dynamic> json)  {
    int? pre_topColor;
    try{
      pre_topColor=json['top_color'];
   }catch(_){}
    topColor = pre_topColor;
    int? pre_bottomColor;
    try{
      pre_bottomColor=json['bottom_color'];
   }catch(_){}
    bottomColor = pre_bottomColor;
    int? pre_rotationAngle;
    try{
      pre_rotationAngle=json['rotation_angle'];
   }catch(_){}
    rotationAngle = pre_rotationAngle;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "top_color": topColor,
      "bottom_color": bottomColor,
      "rotation_angle": rotationAngle,
    };
  }

  static const CONSTRUCTOR = 'backgroundFillGradient';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class BackgroundFillFreeformGradient extends BackgroundFill {

  /// Describes a freeform gradient fill of a background
  BackgroundFillFreeformGradient({this.colors});

  /// [colors] A list of 3 or 4 colors of the freeform gradients in the RGB24 format
  List<int>? colors;

  /// Parse from a json
  BackgroundFillFreeformGradient.fromJson(Map<String, dynamic> json)  {
    List<int>? pre_colors;
    try{
      pre_colors=List<int>.from((json['colors'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    colors = pre_colors;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "colors": colors?.map((i) => i).toList(),
    };
  }

  static const CONSTRUCTOR = 'backgroundFillFreeformGradient';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}