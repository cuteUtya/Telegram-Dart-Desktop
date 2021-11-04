part of '../tdapi.dart';

class SendCallRating extends TdFunction {

  /// Sends a call rating
  SendCallRating({this.callId,
    this.rating,
    this.comment,
    this.problems});

  /// [callId] Call identifier 
  int? callId;

  /// [rating] Call rating; 1-5 
  int? rating;

  /// [comment] An optional user comment if the rating is less than 5 
  String? comment;

  /// [problems] List of the exact types of problems with the call, specified by the user
  List<CallProblem>? problems;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  SendCallRating.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "call_id": callId,
      "rating": rating,
      "comment": comment,
      "problems": problems?.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  static const CONSTRUCTOR = 'sendCallRating';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}