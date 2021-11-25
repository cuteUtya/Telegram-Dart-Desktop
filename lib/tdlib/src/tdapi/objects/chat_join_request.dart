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
    int? pre_userId;
    try{
      pre_userId=json['user_id'];
   }catch(_){}
    userId = pre_userId;
    int? pre_date;
    try{
      pre_date=json['date'];
   }catch(_){}
    date = pre_date;
    String? pre_bio;
    try{
      pre_bio=json['bio'];
   }catch(_){}
    bio = pre_bio;
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