part of '../tdapi.dart';

class User extends TdObject {

  /// Represents a user
  User({this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.phoneNumber,
    this.status,
    this.profilePhoto,
    this.isContact,
    this.isMutualContact,
    this.isVerified,
    this.isSupport,
    this.restrictionReason,
    this.isScam,
    this.isFake,
    this.haveAccess,
    this.type,
    this.languageCode});

  /// [id] User identifier
  int? id;

  /// [firstName] First name of the user
  String? firstName;

  /// [lastName] Last name of the user
  String? lastName;

  /// [username] Username of the user
  String? username;

  /// [phoneNumber] Phone number of the user
  String? phoneNumber;

  /// [status] Current online status of the user
  UserStatus? status;

  /// [profilePhoto] Profile photo of the user; may be null
  ProfilePhoto? profilePhoto;

  /// [isContact] The user is a contact of the current user
  bool? isContact;

  /// [isMutualContact] The user is a contact of the current user and the current user is a contact of the user
  bool? isMutualContact;

  /// [isVerified] True, if the user is verified
  bool? isVerified;

  /// [isSupport] True, if the user is Telegram support account
  bool? isSupport;

  /// [restrictionReason] If non-empty, it contains a human-readable description of the reason why access to this user must be restricted
  String? restrictionReason;

  /// [isScam] True, if many users reported this user as a scam
  bool? isScam;

  /// [isFake] True, if many users reported this user as a fake account
  bool? isFake;

  /// [haveAccess] If false, the user is inaccessible, and the only information known about the user is inside this class. It can't be passed to any method except GetUser
  bool? haveAccess;

  /// [type] Type of the user
  UserType? type;

  /// [languageCode] IETF language tag of the user's language; only available to bots
  String? languageCode;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  User.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=json['id'];
   }catch(_){}
    id = pre_id;
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
    String? pre_username;
    try{
      pre_username=json['username'];
   }catch(_){}
    username = pre_username;
    String? pre_phoneNumber;
    try{
      pre_phoneNumber=json['phone_number'];
   }catch(_){}
    phoneNumber = pre_phoneNumber;
    UserStatus? pre_status;
    try{
      pre_status=UserStatus.fromJson(json['status'] ?? <String, dynamic>{});
   }catch(_){}
    status = pre_status;
    ProfilePhoto? pre_profilePhoto;
    try{
      pre_profilePhoto=ProfilePhoto.fromJson(json['profile_photo'] ?? <String, dynamic>{});
   }catch(_){}
    profilePhoto = pre_profilePhoto;
    bool? pre_isContact;
    try{
      pre_isContact=json['is_contact'];
   }catch(_){}
    isContact = pre_isContact;
    bool? pre_isMutualContact;
    try{
      pre_isMutualContact=json['is_mutual_contact'];
   }catch(_){}
    isMutualContact = pre_isMutualContact;
    bool? pre_isVerified;
    try{
      pre_isVerified=json['is_verified'];
   }catch(_){}
    isVerified = pre_isVerified;
    bool? pre_isSupport;
    try{
      pre_isSupport=json['is_support'];
   }catch(_){}
    isSupport = pre_isSupport;
    String? pre_restrictionReason;
    try{
      pre_restrictionReason=json['restriction_reason'];
   }catch(_){}
    restrictionReason = pre_restrictionReason;
    bool? pre_isScam;
    try{
      pre_isScam=json['is_scam'];
   }catch(_){}
    isScam = pre_isScam;
    bool? pre_isFake;
    try{
      pre_isFake=json['is_fake'];
   }catch(_){}
    isFake = pre_isFake;
    bool? pre_haveAccess;
    try{
      pre_haveAccess=json['have_access'];
   }catch(_){}
    haveAccess = pre_haveAccess;
    UserType? pre_type;
    try{
      pre_type=UserType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    String? pre_languageCode;
    try{
      pre_languageCode=json['language_code'];
   }catch(_){}
    languageCode = pre_languageCode;
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "phone_number": phoneNumber,
      "status": status == null ? null : status?.toJson(),
      "profile_photo": profilePhoto == null ? null : profilePhoto?.toJson(),
      "is_contact": isContact,
      "is_mutual_contact": isMutualContact,
      "is_verified": isVerified,
      "is_support": isSupport,
      "restriction_reason": restrictionReason,
      "is_scam": isScam,
      "is_fake": isFake,
      "have_access": haveAccess,
      "type": type == null ? null : type?.toJson(),
      "language_code": languageCode,
    };
  }

  static const CONSTRUCTOR = 'user';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}