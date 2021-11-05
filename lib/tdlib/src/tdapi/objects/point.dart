part of '../tdapi.dart';

class Point extends TdObject {

  /// A point on a Cartesian plane
  Point({this.x,
    this.y});

  /// [x] The point's first coordinate 
  double? x;

  /// [y] The point's second coordinate
  double? y;

  /// Parse from a json
  Point.fromJson(Map<String, dynamic> json)  {
    double? pre_x;
    try{
      pre_x=json['x'];
   }catch(_){}
    x = pre_x;
    double? pre_y;
    try{
      pre_y=json['y'];
   }catch(_){}
    y = pre_y;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "x": x,
      "y": y,
    };
  }

  static const CONSTRUCTOR = 'point';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}