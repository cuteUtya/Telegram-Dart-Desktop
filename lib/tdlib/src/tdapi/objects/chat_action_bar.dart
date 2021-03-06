part of '../tdapi.dart';

class ChatActionBar extends TdObject {

  /// Describes actions which must be possible to do through a chat action bar
  ChatActionBar();

  

  /// a ChatActionBar return type can be :
  /// * ChatActionBarReportSpam
  /// * ChatActionBarReportUnrelatedLocation
  /// * ChatActionBarInviteMembers
  /// * ChatActionBarReportAddBlock
  /// * ChatActionBarAddContact
  /// * ChatActionBarSharePhoneNumber
  /// * ChatActionBarJoinRequest
  factory ChatActionBar.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case ChatActionBarReportSpam.CONSTRUCTOR:
        return ChatActionBarReportSpam.fromJson(json);
      case ChatActionBarReportUnrelatedLocation.CONSTRUCTOR:
        return ChatActionBarReportUnrelatedLocation.fromJson(json);
      case ChatActionBarInviteMembers.CONSTRUCTOR:
        return ChatActionBarInviteMembers.fromJson(json);
      case ChatActionBarReportAddBlock.CONSTRUCTOR:
        return ChatActionBarReportAddBlock.fromJson(json);
      case ChatActionBarAddContact.CONSTRUCTOR:
        return ChatActionBarAddContact.fromJson(json);
      case ChatActionBarSharePhoneNumber.CONSTRUCTOR:
        return ChatActionBarSharePhoneNumber.fromJson(json);
      case ChatActionBarJoinRequest.CONSTRUCTOR:
        return ChatActionBarJoinRequest.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'chatActionBar';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarReportSpam extends ChatActionBar {

  /// The chat can be reported as spam using the method reportChat with the reason chatReportReasonSpam
  ChatActionBarReportSpam({this.canUnarchive});

  /// [canUnarchive] If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  bool? canUnarchive;

  /// Parse from a json
  ChatActionBarReportSpam.fromJson(Map<String, dynamic> json)  {
    canUnarchive = json['can_unarchive'] == null ? null : json['can_unarchive'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "can_unarchive": canUnarchive,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarReportSpam';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarReportUnrelatedLocation extends ChatActionBar {

  /// The chat is a location-based supergroup, which can be reported as having unrelated location using the method reportChat with the reason chatReportReasonUnrelatedLocation
  ChatActionBarReportUnrelatedLocation();

  

  /// Parse from a json
  ChatActionBarReportUnrelatedLocation.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarReportUnrelatedLocation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarInviteMembers extends ChatActionBar {

  /// The chat is a recently created group chat to which new members can be invited
  ChatActionBarInviteMembers();

  

  /// Parse from a json
  ChatActionBarInviteMembers.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarInviteMembers';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarReportAddBlock extends ChatActionBar {

  /// The chat is a private or secret chat, which can be reported using the method reportChat, or the other user can be blocked using the method toggleMessageSenderIsBlocked, or the other user can be added to the contact list using the method addContact
  ChatActionBarReportAddBlock({this.canUnarchive,
    this.distance});

  /// [canUnarchive] If true, the chat was automatically archived and can be moved back to the main chat list using addChatToList simultaneously with setting chat notification settings to default using setChatNotificationSettings
  bool? canUnarchive;

  /// [distance] If non-negative, the current user was found by the peer through searchChatsNearby and this is the distance between the users
  int? distance;

  /// Parse from a json
  ChatActionBarReportAddBlock.fromJson(Map<String, dynamic> json)  {
    canUnarchive = json['can_unarchive'] == null ? null : json['can_unarchive'];
    distance = json['distance'] == null ? null : json['distance'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "can_unarchive": canUnarchive,
      "distance": distance,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarReportAddBlock';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarAddContact extends ChatActionBar {

  /// The chat is a private or secret chat and the other user can be added to the contact list using the method addContact
  ChatActionBarAddContact();

  

  /// Parse from a json
  ChatActionBarAddContact.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarAddContact';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarSharePhoneNumber extends ChatActionBar {

  /// The chat is a private or secret chat with a mutual contact and the user's phone number can be shared with the other user using the method sharePhoneNumber
  ChatActionBarSharePhoneNumber();

  

  /// Parse from a json
  ChatActionBarSharePhoneNumber.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarSharePhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class ChatActionBarJoinRequest extends ChatActionBar {

  /// The chat is a private chat with an administrator of a chat to which the user sent join request
  ChatActionBarJoinRequest({this.title,
    this.isChannel,
    this.requestDate});

  /// [title] Title of the chat to which the join request was sent
  String? title;

  /// [isChannel] True, if the join request was sent to a channel chat
  bool? isChannel;

  /// [requestDate] Point in time (Unix timestamp) when the join request was sent
  int? requestDate;

  /// Parse from a json
  ChatActionBarJoinRequest.fromJson(Map<String, dynamic> json)  {
    title = json['title'] == null ? null : json['title'];
    isChannel = json['is_channel'] == null ? null : json['is_channel'];
    requestDate = json['request_date'] == null ? null : json['request_date'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "title": title,
      "is_channel": isChannel,
      "request_date": requestDate,
    };
  }

  static const CONSTRUCTOR = 'chatActionBarJoinRequest';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}