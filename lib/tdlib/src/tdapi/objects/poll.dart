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
    id = int.tryParse(json['id'] ?? "");
    question = json['question'];
    options = List<PollOption>.from((json['options'] ?? [])!.map((item) => PollOption.fromJson(item ?? <String, dynamic>{})).toList());
    totalVoterCount = json['total_voter_count'];
    recentVoterUserIds = List<int>.from((json['recent_voter_user_ids'] ?? [])!.map((item) => item).toList());
    isAnonymous = json['is_anonymous'];
    type = PollType.fromJson(json['type'] ?? <String, dynamic>{});
    openPeriod = json['open_period'];
    closeDate = json['close_date'];
    isClosed = json['is_closed'];
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