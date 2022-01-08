part of '../tdapi.dart';

class VectorPathCommand extends TdObject {

  /// Represents a vector path command
  VectorPathCommand();

  

  /// a VectorPathCommand return type can be :
  /// * VectorPathCommandLine
  /// * VectorPathCommandCubicBezierCurve
  factory VectorPathCommand.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case VectorPathCommandLine.CONSTRUCTOR:
        return VectorPathCommandLine.fromJson(json);
      case VectorPathCommandCubicBezierCurve.CONSTRUCTOR:
        return VectorPathCommandCubicBezierCurve.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'vectorPathCommand';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class VectorPathCommandLine extends VectorPathCommand {

  /// A straight line to a given point
  VectorPathCommandLine({this.endPoint});

  /// [endPoint] The end point of the straight line
  Point? endPoint;

  /// Parse from a json
  VectorPathCommandLine.fromJson(Map<String, dynamic> json)  {
    endPoint = json['end_point'] == null ? null : Point.fromJson(json['end_point'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "end_point": endPoint == null ? null : endPoint?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'vectorPathCommandLine';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class VectorPathCommandCubicBezierCurve extends VectorPathCommand {

  /// A cubic B?zier curve to a given point
  VectorPathCommandCubicBezierCurve({this.startControlPoint,
    this.endControlPoint,
    this.endPoint});

  /// [startControlPoint] The start control point of the curve 
  Point? startControlPoint;

  /// [endControlPoint] The end control point of the curve 
  Point? endControlPoint;

  /// [endPoint] The end point of the curve
  Point? endPoint;

  /// Parse from a json
  VectorPathCommandCubicBezierCurve.fromJson(Map<String, dynamic> json)  {
    startControlPoint = json['start_control_point'] == null ? null : Point.fromJson(json['start_control_point'] ?? <String, dynamic>{});
    endControlPoint = json['end_control_point'] == null ? null : Point.fromJson(json['end_control_point'] ?? <String, dynamic>{});
    endPoint = json['end_point'] == null ? null : Point.fromJson(json['end_point'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "start_control_point": startControlPoint == null ? null : startControlPoint?.toJson(),
      "end_control_point": endControlPoint == null ? null : endControlPoint?.toJson(),
      "end_point": endPoint == null ? null : endPoint?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'vectorPathCommandCubicBezierCurve';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}