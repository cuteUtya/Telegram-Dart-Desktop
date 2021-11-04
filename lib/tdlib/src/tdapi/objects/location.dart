part of '../tdapi.dart';

class Location extends TdObject {

  /// Describes a location on planet Earth
  Location({this.latitude,
    this.longitude,
    this.horizontalAccuracy});

  /// [latitude] Latitude of the location in degrees; as defined by the sender 
  double? latitude;

  /// [longitude] Longitude of the location, in degrees; as defined by the sender
  double? longitude;

  /// [horizontalAccuracy] The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
  double? horizontalAccuracy;

  /// Parse from a json
  Location.fromJson(Map<String, dynamic> json)  {
    latitude = json['latitude'];
    longitude = json['longitude'];
    horizontalAccuracy = json['horizontal_accuracy'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "latitude": latitude,
      "longitude": longitude,
      "horizontal_accuracy": horizontalAccuracy,
    };
  }

  static const CONSTRUCTOR = 'location';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}