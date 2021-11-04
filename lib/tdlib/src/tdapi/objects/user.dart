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
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    status = UserStatus.fromJson(json['status'] ?? <String, dynamic>{});
    profilePhoto = ProfilePhoto.fromJson(json['profile_photo'] ?? <String, dynamic>{});
    isContact = json['is_contact'];
    isMutualContact = json['is_mutual_contact'];
    isVerified = json['is_verified'];
    isSupport = json['is_support'];
    restrictionReason = json['restriction_reason'];
    isScam = json['is_scam'];
    isFake = json['is_fake'];
    haveAccess = json['have_access'];
    type = UserType.fromJson(json['type'] ?? <String, dynamic>{});
    languageCode = json['language_code'];
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