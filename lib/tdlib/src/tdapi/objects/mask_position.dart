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
    point = json['point'] == null ? null : MaskPoint.fromJson(json['point'] ?? <String, dynamic>{});
    xShift = json['x_shift'] == null ? null : json['x_shift'];
    yShift = json['y_shift'] == null ? null : json['y_shift'];
    scale = json['scale'] == null ? null : json['scale'];
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