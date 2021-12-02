part of '../tdapi.dart';

class ChatJoinRequest extends TdObject {

  /// Describes a user that sent a join request and waits for administrator approval
  ChatJoinRequest({this.userId,
    this.date,
    this.bio});

  /// [userId] User identifier 
  int? userId;

  /// [date] Point in time (Unix timestamp) when the user sent the join request 
  int? date;

  /// [bio] A short bio of the user
  String? bio;

  /// Parse from a json
  ChatJoinRequest.fromJson(Map<String, dynamic> json)  {
    userId = json['user_id'] == null ? null : json['user_id'];
    date = json['date'] == null ? null : json['date'];
    bio = json['bio'] == null ? null : json['bio'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "user_id": userId,
      "date": date,
      "bio": bio,
    };
  }

  static const CONSTRUCTOR = 'chatJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}