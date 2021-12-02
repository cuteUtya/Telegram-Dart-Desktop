part of '../tdapi.dart';

class Contact extends TdObject {

  /// Describes a user contact
  Contact({this.phoneNumber,
    this.firstName,
    this.lastName,
    this.vcard,
    this.userId});

  /// [phoneNumber] Phone number of the user 
  String? phoneNumber;

  /// [firstName] First name of the user; 1-255 characters in length 
  String? firstName;

  /// [lastName] Last name of the user 
  String? lastName;

  /// [vcard] Additional data about the user in a form of vCard; 0-2048 bytes in length 
  String? vcard;

  /// [userId] Identifier of the user, if known; otherwise 0
  int? userId;

  /// Parse from a json
  Contact.fromJson(Map<String, dynamic> json)  {
    phoneNumber = json['phone_number'] == null ? null : json['phone_number'];
    firstName = json['first_name'] == null ? null : json['first_name'];
    lastName = json['last_name'] == null ? null : json['last_name'];
    vcard = json['vcard'] == null ? null : json['vcard'];
    userId = json['user_id'] == null ? null : json['user_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "phone_number": phoneNumber,
      "first_name": firstName,
      "last_name": lastName,
      "vcard": vcard,
      "user_id": userId,
    };
  }

  static const CONSTRUCTOR = 'contact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}