part of '../tdapi.dart';

class Venue extends TdObject {

  /// Describes a venue
  Venue({this.location,
    this.title,
    this.address,
    this.provider,
    this.id,
    this.type});

  /// [location] Venue location; as defined by the sender 
  Location? location;

  /// [title] Venue name; as defined by the sender 
  String? title;

  /// [address] Venue address; as defined by the sender 
  String? address;

  /// [provider] Provider of the venue database; as defined by the sender. Currently only "foursquare" and "gplaces" (Google Places) need to be supported
  String? provider;

  /// [id] Identifier of the venue in the provider database; as defined by the sender
  String? id;

  /// [type] Type of the venue in the provider database; as defined by the sender
  String? type;

  /// Parse from a json
  Venue.fromJson(Map<String, dynamic> json)  {
    Location? pre_location;
    try{
      pre_location=Location.fromJson(json['location'] ?? <String, dynamic>{});
   }catch(_){}
    location = pre_location;
    String? pre_title;
    try{
      pre_title=json['title'];
   }catch(_){}
    title = pre_title;
    String? pre_address;
    try{
      pre_address=json['address'];
   }catch(_){}
    address = pre_address;
    String? pre_provider;
    try{
      pre_provider=json['provider'];
   }catch(_){}
    provider = pre_provider;
    String? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
    String? pre_type;
    try{
      pre_type=json['type'];
   }catch(_){}
    type = pre_type;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": location == null ? null : location?.toJson(),
      "title": title,
      "address": address,
      "provider": provider,
      "id": id,
      "type": type,
    };
  }

  static const CONSTRUCTOR = 'venue';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}