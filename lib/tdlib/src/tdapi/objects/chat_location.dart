part of '../tdapi.dart';

class ChatLocation extends TdObject {

  /// Represents a location to which a chat is connected
  ChatLocation({this.location,
    this.address});

  /// [location] The location 
  Location? location;

  /// [address] Location address; 1-64 characters, as defined by the chat owner
  String? address;

  /// Parse from a json
  ChatLocation.fromJson(Map<String, dynamic> json)  {
    Location? pre_location;
    try{
      pre_location=Location.fromJson(json['location'] ?? <String, dynamic>{});
   }catch(_){}
    location = pre_location;
    String? pre_address;
    try{
      pre_address=json['address'];
   }catch(_){}
    address = pre_address;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": location == null ? null : location?.toJson(),
      "address": address,
    };
  }

  static const CONSTRUCTOR = 'chatLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}