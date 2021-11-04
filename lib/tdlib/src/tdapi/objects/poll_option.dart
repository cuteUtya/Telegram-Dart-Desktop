part of '../tdapi.dart';

class PollOption extends TdObject {

  /// Describes one answer option of a poll
  PollOption({this.text,
    this.voterCount,
    this.votePercentage,
    this.isChosen,
    this.isBeingChosen});

  /// [text] Option text; 1-100 characters 
  String? text;

  /// [voterCount] Number of voters for this option, available only for closed or voted polls 
  int? voterCount;

  /// [votePercentage] The percentage of votes for this option; 0-100
  int? votePercentage;

  /// [isChosen] True, if the option was chosen by the user
  bool? isChosen;

  /// [isBeingChosen] True, if the option is being chosen by a pending setPollAnswer request
  bool? isBeingChosen;

  /// Parse from a json
  PollOption.fromJson(Map<String, dynamic> json)  {
    text = json['text'];
    voterCount = json['voter_count'];
    votePercentage = json['vote_percentage'];
    isChosen = json['is_chosen'];
    isBeingChosen = json['is_being_chosen'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "text": text,
      "voter_count": voterCount,
      "vote_percentage": votePercentage,
      "is_chosen": isChosen,
      "is_being_chosen": isBeingChosen,
    };
  }

  static const CONSTRUCTOR = 'pollOption';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}