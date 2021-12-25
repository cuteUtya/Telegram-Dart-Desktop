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

  /// [provider] Provider of the venue database; as defined by the sender. Currently, only "foursquare" and "gplaces" (Google Places) need to be supported
  String? provider;

  /// [id] Identifier of the venue in the provider database; as defined by the sender
  String? id;

  /// [type] Type of the venue in the provider database; as defined by the sender
  String? type;

  /// Parse from a json
  Venue.fromJson(Map<String, dynamic> json)  {
    location = json['location'] == null ? null : Location.fromJson(json['location'] ?? <String, dynamic>{});
    title = json['title'] == null ? null : json['title'];
    address = json['address'] == null ? null : json['address'];
    provider = json['provider'] == null ? null : json['provider'];
    id = json['id'] == null ? null : json['id'];
    type = json['type'] == null ? null : json['type'];
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