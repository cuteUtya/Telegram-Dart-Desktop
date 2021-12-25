part of '../tdapi.dart';

class SuggestedAction extends TdObject {

  /// Describes an action suggested to the current user
  SuggestedAction();

  

  /// a SuggestedAction return type can be :
  /// * SuggestedActionEnableArchiveAndMuteNewChats
  /// * SuggestedActionCheckPassword
  /// * SuggestedActionCheckPhoneNumber
  /// * SuggestedActionViewChecksHint
  /// * SuggestedActionConvertToBroadcastGroup
  /// * SuggestedActionSetPassword
  factory SuggestedAction.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case SuggestedActionEnableArchiveAndMuteNewChats.CONSTRUCTOR:
        return SuggestedActionEnableArchiveAndMuteNewChats.fromJson(json);
      case SuggestedActionCheckPassword.CONSTRUCTOR:
        return SuggestedActionCheckPassword.fromJson(json);
      case SuggestedActionCheckPhoneNumber.CONSTRUCTOR:
        return SuggestedActionCheckPhoneNumber.fromJson(json);
      case SuggestedActionViewChecksHint.CONSTRUCTOR:
        return SuggestedActionViewChecksHint.fromJson(json);
      case SuggestedActionConvertToBroadcastGroup.CONSTRUCTOR:
        return SuggestedActionConvertToBroadcastGroup.fromJson(json);
      case SuggestedActionSetPassword.CONSTRUCTOR:
        return SuggestedActionSetPassword.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'suggestedAction';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionEnableArchiveAndMuteNewChats extends SuggestedAction {

  /// Suggests the user to enable "archive_and_mute_new_chats_from_unknown_users" option
  SuggestedActionEnableArchiveAndMuteNewChats();

  

  /// Parse from a json
  SuggestedActionEnableArchiveAndMuteNewChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionEnableArchiveAndMuteNewChats';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionCheckPassword extends SuggestedAction {

  /// Suggests the user to check whether they still remember their 2-step verification password
  SuggestedActionCheckPassword();

  

  /// Parse from a json
  SuggestedActionCheckPassword.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionCheckPassword';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionCheckPhoneNumber extends SuggestedAction {

  /// Suggests the user to check whether authorization phone number is correct and change the phone number if it is inaccessible
  SuggestedActionCheckPhoneNumber();

  

  /// Parse from a json
  SuggestedActionCheckPhoneNumber.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionCheckPhoneNumber';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionViewChecksHint extends SuggestedAction {

  /// Suggests the user to view a hint about the meaning of one and two check marks on sent messages
  SuggestedActionViewChecksHint();

  

  /// Parse from a json
  SuggestedActionViewChecksHint.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionViewChecksHint';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionConvertToBroadcastGroup extends SuggestedAction {

  /// Suggests the user to convert specified supergroup to a broadcast group
  SuggestedActionConvertToBroadcastGroup({this.supergroupId});

  /// [supergroupId] Supergroup identifier
  int? supergroupId;

  /// Parse from a json
  SuggestedActionConvertToBroadcastGroup.fromJson(Map<String, dynamic> json)  {
    supergroupId = json['supergroup_id'] == null ? null : json['supergroup_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "supergroup_id": supergroupId,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionConvertToBroadcastGroup';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class SuggestedActionSetPassword extends SuggestedAction {

  /// Suggests the user to set a 2-step verification password to be able to log in again
  SuggestedActionSetPassword({this.authorizationDelay});

  /// [authorizationDelay] The number of days to pass between consecutive authorizations if the user declines to set password
  int? authorizationDelay;

  /// Parse from a json
  SuggestedActionSetPassword.fromJson(Map<String, dynamic> json)  {
    authorizationDelay = json['authorization_delay'] == null ? null : json['authorization_delay'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "authorization_delay": authorizationDelay,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionSetPassword';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}