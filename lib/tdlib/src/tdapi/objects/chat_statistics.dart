part of '../tdapi.dart';

class ChatStatistics extends TdObject {

  /// Contains a detailed statistics about a chat
  ChatStatistics();

  

  /// a ChatStatistics return type can be :
  /// * ChatStatisticsSupergroup
  /// * ChatStatisticsChannel
  factory ChatStatistics.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatStatisticsSupergroup.CONSTRUCTOR:
        return ChatStatisticsSupergroup.fromJson(json);
      case ChatStatisticsChannel.CONSTRUCTOR:
        return ChatStatisticsChannel.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatStatistics';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatStatisticsSupergroup extends ChatStatistics {

  /// A detailed statistics about a supergroup chat
  ChatStatisticsSupergroup({this.period,
    this.memberCount,
    this.messageCount,
    this.viewerCount,
    this.senderCount,
    this.memberCountGraph,
    this.joinGraph,
    this.joinBySourceGraph,
    this.languageGraph,
    this.messageContentGraph,
    this.actionGraph,
    this.dayGraph,
    this.weekGraph,
    this.topSenders,
    this.topAdministrators,
    this.topInviters});

  /// [period] A period to which the statistics applies
  DateRange? period;

  /// [memberCount] Number of members in the chat
  StatisticalValue? memberCount;

  /// [messageCount] Number of messages sent to the chat
  StatisticalValue? messageCount;

  /// [viewerCount] Number of users who viewed messages in the chat
  StatisticalValue? viewerCount;

  /// [senderCount] Number of users who sent messages to the chat
  StatisticalValue? senderCount;

  /// [memberCountGraph] A graph containing number of members in the chat
  StatisticalGraph? memberCountGraph;

  /// [joinGraph] A graph containing number of members joined and left the chat
  StatisticalGraph? joinGraph;

  /// [joinBySourceGraph] A graph containing number of new member joins per source
  StatisticalGraph? joinBySourceGraph;

  /// [languageGraph] A graph containing distribution of active users per language
  StatisticalGraph? languageGraph;

  /// [messageContentGraph] A graph containing distribution of sent messages by content type
  StatisticalGraph? messageContentGraph;

  /// [actionGraph] A graph containing number of different actions in the chat
  StatisticalGraph? actionGraph;

  /// [dayGraph] A graph containing distribution of message views per hour
  StatisticalGraph? dayGraph;

  /// [weekGraph] A graph containing distribution of message views per day of week
  StatisticalGraph? weekGraph;

  /// [topSenders] List of users sent most messages in the last week
  List<ChatStatisticsMessageSenderInfo>? topSenders;

  /// [topAdministrators] List of most active administrators in the last week
  List<ChatStatisticsAdministratorActionsInfo>? topAdministrators;

  /// [topInviters] List of most active inviters of new members in the last week
  List<ChatStatisticsInviterInfo>? topInviters;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatStatisticsSupergroup.fromJson(Map<String, dynamic> json)  {
    period = json['period'] == null ? null : DateRange.fromJson(json['period'] ?? <String, dynamic>{});
    memberCount = json['member_count'] == null ? null : StatisticalValue.fromJson(json['member_count'] ?? <String, dynamic>{});
    messageCount = json['message_count'] == null ? null : StatisticalValue.fromJson(json['message_count'] ?? <String, dynamic>{});
    viewerCount = json['viewer_count'] == null ? null : StatisticalValue.fromJson(json['viewer_count'] ?? <String, dynamic>{});
    senderCount = json['sender_count'] == null ? null : StatisticalValue.fromJson(json['sender_count'] ?? <String, dynamic>{});
    memberCountGraph = json['member_count_graph'] == null ? null : StatisticalGraph.fromJson(json['member_count_graph'] ?? <String, dynamic>{});
    joinGraph = json['join_graph'] == null ? null : StatisticalGraph.fromJson(json['join_graph'] ?? <String, dynamic>{});
    joinBySourceGraph = json['join_by_source_graph'] == null ? null : StatisticalGraph.fromJson(json['join_by_source_graph'] ?? <String, dynamic>{});
    languageGraph = json['language_graph'] == null ? null : StatisticalGraph.fromJson(json['language_graph'] ?? <String, dynamic>{});
    messageContentGraph = json['message_content_graph'] == null ? null : StatisticalGraph.fromJson(json['message_content_graph'] ?? <String, dynamic>{});
    actionGraph = json['action_graph'] == null ? null : StatisticalGraph.fromJson(json['action_graph'] ?? <String, dynamic>{});
    dayGraph = json['day_graph'] == null ? null : StatisticalGraph.fromJson(json['day_graph'] ?? <String, dynamic>{});
    weekGraph = json['week_graph'] == null ? null : StatisticalGraph.fromJson(json['week_graph'] ?? <String, dynamic>{});
    topSenders = json['top_senders'] == null ? null : List<ChatStatisticsMessageSenderInfo>.from((json['top_senders'] ?? [])!.map((item) => ChatStatisticsMessageSenderInfo.fromJson(item ?? <String, dynamic>{})).toList());
    topAdministrators = json['top_administrators'] == null ? null : List<ChatStatisticsAdministratorActionsInfo>.from((json['top_administrators'] ?? [])!.map((item) => ChatStatisticsAdministratorActionsInfo.fromJson(item ?? <String, dynamic>{})).toList());
    topInviters = json['top_inviters'] == null ? null : List<ChatStatisticsInviterInfo>.from((json['top_inviters'] ?? [])!.map((item) => ChatStatisticsInviterInfo.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "period": period == null ? null : period?.toJson(),
      "member_count": memberCount == null ? null : memberCount?.toJson(),
      "message_count": messageCount == null ? null : messageCount?.toJson(),
      "viewer_count": viewerCount == null ? null : viewerCount?.toJson(),
      "sender_count": senderCount == null ? null : senderCount?.toJson(),
      "member_count_graph": memberCountGraph == null ? null : memberCountGraph?.toJson(),
      "join_graph": joinGraph == null ? null : joinGraph?.toJson(),
      "join_by_source_graph": joinBySourceGraph == null ? null : joinBySourceGraph?.toJson(),
      "language_graph": languageGraph == null ? null : languageGraph?.toJson(),
      "message_content_graph": messageContentGraph == null ? null : messageContentGraph?.toJson(),
      "action_graph": actionGraph == null ? null : actionGraph?.toJson(),
      "day_graph": dayGraph == null ? null : dayGraph?.toJson(),
      "week_graph": weekGraph == null ? null : weekGraph?.toJson(),
      "top_senders": topSenders?.map((i) => i.toJson()).toList(),
      "top_administrators": topAdministrators?.map((i) => i.toJson()).toList(),
      "top_inviters": topInviters?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsSupergroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatStatisticsChannel extends ChatStatistics {

  /// A detailed statistics about a channel chat
  ChatStatisticsChannel({this.period,
    this.memberCount,
    this.meanViewCount,
    this.meanShareCount,
    this.enabledNotificationsPercentage,
    this.memberCountGraph,
    this.joinGraph,
    this.muteGraph,
    this.viewCountByHourGraph,
    this.viewCountBySourceGraph,
    this.joinBySourceGraph,
    this.languageGraph,
    this.messageInteractionGraph,
    this.instantViewInteractionGraph,
    this.recentMessageInteractions});

  /// [period] A period to which the statistics applies
  DateRange? period;

  /// [memberCount] Number of members in the chat
  StatisticalValue? memberCount;

  /// [meanViewCount] Mean number of times the recently sent messages was viewed
  StatisticalValue? meanViewCount;

  /// [meanShareCount] Mean number of times the recently sent messages was shared
  StatisticalValue? meanShareCount;

  /// [enabledNotificationsPercentage] A percentage of users with enabled notifications for the chat
  double? enabledNotificationsPercentage;

  /// [memberCountGraph] A graph containing number of members in the chat
  StatisticalGraph? memberCountGraph;

  /// [joinGraph] A graph containing number of members joined and left the chat
  StatisticalGraph? joinGraph;

  /// [muteGraph] A graph containing number of members muted and unmuted the chat
  StatisticalGraph? muteGraph;

  /// [viewCountByHourGraph] A graph containing number of message views in a given hour in the last two weeks
  StatisticalGraph? viewCountByHourGraph;

  /// [viewCountBySourceGraph] A graph containing number of message views per source
  StatisticalGraph? viewCountBySourceGraph;

  /// [joinBySourceGraph] A graph containing number of new member joins per source
  StatisticalGraph? joinBySourceGraph;

  /// [languageGraph] A graph containing number of users viewed chat messages per language
  StatisticalGraph? languageGraph;

  /// [messageInteractionGraph] A graph containing number of chat message views and shares
  StatisticalGraph? messageInteractionGraph;

  /// [instantViewInteractionGraph] A graph containing number of views of associated with the chat instant views
  StatisticalGraph? instantViewInteractionGraph;

  /// [recentMessageInteractions] Detailed statistics about number of views and shares of recently sent messages
  List<ChatStatisticsMessageInteractionInfo>? recentMessageInteractions;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  ChatStatisticsChannel.fromJson(Map<String, dynamic> json)  {
    period = json['period'] == null ? null : DateRange.fromJson(json['period'] ?? <String, dynamic>{});
    memberCount = json['member_count'] == null ? null : StatisticalValue.fromJson(json['member_count'] ?? <String, dynamic>{});
    meanViewCount = json['mean_view_count'] == null ? null : StatisticalValue.fromJson(json['mean_view_count'] ?? <String, dynamic>{});
    meanShareCount = json['mean_share_count'] == null ? null : StatisticalValue.fromJson(json['mean_share_count'] ?? <String, dynamic>{});
    enabledNotificationsPercentage = json['enabled_notifications_percentage'] == null ? null : json['enabled_notifications_percentage'];
    memberCountGraph = json['member_count_graph'] == null ? null : StatisticalGraph.fromJson(json['member_count_graph'] ?? <String, dynamic>{});
    joinGraph = json['join_graph'] == null ? null : StatisticalGraph.fromJson(json['join_graph'] ?? <String, dynamic>{});
    muteGraph = json['mute_graph'] == null ? null : StatisticalGraph.fromJson(json['mute_graph'] ?? <String, dynamic>{});
    viewCountByHourGraph = json['view_count_by_hour_graph'] == null ? null : StatisticalGraph.fromJson(json['view_count_by_hour_graph'] ?? <String, dynamic>{});
    viewCountBySourceGraph = json['view_count_by_source_graph'] == null ? null : StatisticalGraph.fromJson(json['view_count_by_source_graph'] ?? <String, dynamic>{});
    joinBySourceGraph = json['join_by_source_graph'] == null ? null : StatisticalGraph.fromJson(json['join_by_source_graph'] ?? <String, dynamic>{});
    languageGraph = json['language_graph'] == null ? null : StatisticalGraph.fromJson(json['language_graph'] ?? <String, dynamic>{});
    messageInteractionGraph = json['message_interaction_graph'] == null ? null : StatisticalGraph.fromJson(json['message_interaction_graph'] ?? <String, dynamic>{});
    instantViewInteractionGraph = json['instant_view_interaction_graph'] == null ? null : StatisticalGraph.fromJson(json['instant_view_interaction_graph'] ?? <String, dynamic>{});
    recentMessageInteractions = json['recent_message_interactions'] == null ? null : List<ChatStatisticsMessageInteractionInfo>.from((json['recent_message_interactions'] ?? [])!.map((item) => ChatStatisticsMessageInteractionInfo.fromJson(item ?? <String, dynamic>{})).toList());
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "period": period == null ? null : period?.toJson(),
      "member_count": memberCount == null ? null : memberCount?.toJson(),
      "mean_view_count": meanViewCount == null ? null : meanViewCount?.toJson(),
      "mean_share_count": meanShareCount == null ? null : meanShareCount?.toJson(),
      "enabled_notifications_percentage": enabledNotificationsPercentage,
      "member_count_graph": memberCountGraph == null ? null : memberCountGraph?.toJson(),
      "join_graph": joinGraph == null ? null : joinGraph?.toJson(),
      "mute_graph": muteGraph == null ? null : muteGraph?.toJson(),
      "view_count_by_hour_graph": viewCountByHourGraph == null ? null : viewCountByHourGraph?.toJson(),
      "view_count_by_source_graph": viewCountBySourceGraph == null ? null : viewCountBySourceGraph?.toJson(),
      "join_by_source_graph": joinBySourceGraph == null ? null : joinBySourceGraph?.toJson(),
      "language_graph": languageGraph == null ? null : languageGraph?.toJson(),
      "message_interaction_graph": messageInteractionGraph == null ? null : messageInteractionGraph?.toJson(),
      "instant_view_interaction_graph": instantViewInteractionGraph == null ? null : instantViewInteractionGraph?.toJson(),
      "recent_message_interactions": recentMessageInteractions?.map((i) => i.toJson()).toList(),
    };
  }

  static const CONSTRUCTOR = 'chatStatisticsChannel';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}