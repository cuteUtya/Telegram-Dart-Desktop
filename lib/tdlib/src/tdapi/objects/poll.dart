part of '../tdapi.dart';

class Poll extends TdObject {

  /// Describes a poll
  Poll({this.id,
    this.question,
    this.options,
    this.totalVoterCount,
    this.recentVoterUserIds,
    this.isAnonymous,
    this.type,
    this.openPeriod,
    this.closeDate,
    this.isClosed});

  /// [id] Unique poll identifier 
  int? id;

  /// [question] Poll question; 1-300 characters 
  String? question;

  /// [options] List of poll answer options
  List<PollOption>? options;

  /// [totalVoterCount] Total number of voters, participating in the poll
  int? totalVoterCount;

  /// [recentVoterUserIds] User identifiers of recent voters, if the poll is non-anonymous
  List<int>? recentVoterUserIds;

  /// [isAnonymous] True, if the poll is anonymous
  bool? isAnonymous;

  /// [type] Type of the poll
  PollType? type;

  /// [openPeriod] Amount of time the poll will be active after creation, in seconds
  int? openPeriod;

  /// [closeDate] Point in time (Unix timestamp) when the poll will be automatically closed 
  int? closeDate;

  /// [isClosed] True, if the poll is closed
  bool? isClosed;

  /// Parse from a json
  Poll.fromJson(Map<String, dynamic> json)  {
    int? pre_id;
    try{
      pre_id=int.tryParse(json['id'] ?? "");
   }catch(_){}
    id = pre_id;
    String? pre_question;
    try{
      pre_question=json['question'];
   }catch(_){}
    question = pre_question;
    List<PollOption>? pre_options;
    try{
      pre_options=List<PollOption>.from((json['options'] ?? [])!.map((item) => PollOption.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    options = pre_options;
    int? pre_totalVoterCount;
    try{
      pre_totalVoterCount=json['total_voter_count'];
   }catch(_){}
    totalVoterCount = pre_totalVoterCount;
    List<int>? pre_recentVoterUserIds;
    try{
      pre_recentVoterUserIds=List<int>.from((json['recent_voter_user_ids'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    recentVoterUserIds = pre_recentVoterUserIds;
    bool? pre_isAnonymous;
    try{
      pre_isAnonymous=json['is_anonymous'];
   }catch(_){}
    isAnonymous = pre_isAnonymous;
    PollType? pre_type;
    try{
      pre_type=PollType.fromJson(json['type'] ?? <String, dynamic>{});
   }catch(_){}
    type = pre_type;
    int? pre_openPeriod;
    try{
      pre_openPeriod=json['open_period'];
   }catch(_){}
    openPeriod = pre_openPeriod;
    int? pre_closeDate;
    try{
      pre_closeDate=json['close_date'];
   }catch(_){}
    closeDate = pre_closeDate;
    bool? pre_isClosed;
    try{
      pre_isClosed=json['is_closed'];
   }catch(_){}
    isClosed = pre_isClosed;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": id,
      "question": question,
      "options": options?.map((i) => i.toJson()).toList(),
      "total_voter_count": totalVoterCount,
      "recent_voter_user_ids": recentVoterUserIds?.map((i) => i).toList(),
      "is_anonymous": isAnonymous,
      "type": type == null ? null : type?.toJson(),
      "open_period": openPeriod,
      "close_date": closeDate,
      "is_closed": isClosed,
    };
  }

  static const CONSTRUCTOR = 'poll';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}