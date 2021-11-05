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
    String? pre_phoneNumber;
    try{
      pre_phoneNumber=json['phone_number'];
   }catch(_){}
    phoneNumber = pre_phoneNumber;
    String? pre_firstName;
    try{
      pre_firstName=json['first_name'];
   }catch(_){}
    firstName = pre_firstName;
    String? pre_lastName;
    try{
      pre_lastName=json['last_name'];
   }catch(_){}
    lastName = pre_lastName;
    String? pre_vcard;
    try{
      pre_vcard=json['vcard'];
   }catch(_){}
    vcard = pre_vcard;
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
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