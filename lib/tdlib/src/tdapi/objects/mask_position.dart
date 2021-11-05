part of '../tdapi.dart';

class MaskPosition extends TdObject {

  /// Position on a photo where a mask is placed
  MaskPosition({this.point,
    this.xShift,
    this.yShift,
    this.scale});

  /// [point] Part of the face, relative to which the mask is placed
  MaskPoint? point;

  /// [xShift] Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. (For example, -1.0 will place the mask just to the left of the default mask position)
  double? xShift;

  /// [yShift] Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. (For example, 1.0 will place the mask just below the default mask position)
  double? yShift;

  /// [scale] Mask scaling coefficient. (For example, 2.0 means a doubled size)
  double? scale;

  /// Parse from a json
  MaskPosition.fromJson(Map<String, dynamic> json)  {
    MaskPoint? pre_point;
    try{
      pre_point=MaskPoint.fromJson(json['point'] ?? <String, dynamic>{});
   }catch(_){}
    point = pre_point;
    double? pre_xShift;
    try{
      pre_xShift=json['x_shift'];
   }catch(_){}
    xShift = pre_xShift;
    double? pre_yShift;
    try{
      pre_yShift=json['y_shift'];
   }catch(_){}
    yShift = pre_yShift;
    double? pre_scale;
    try{
      pre_scale=json['scale'];
   }catch(_){}
    scale = pre_scale;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "point": point == null ? null : point?.toJson(),
      "x_shift": xShift,
      "y_shift": yShift,
      "scale": scale,
    };
  }

  static const CONSTRUCTOR = 'maskPosition';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}