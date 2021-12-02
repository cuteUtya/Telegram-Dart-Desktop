part of '../tdapi.dart';

class SuggestedAction extends TdObject {

  /// Describes an action suggested to the current user
  SuggestedAction();

  

  /// a SuggestedAction return type can be :
  /// * SuggestedActionEnableArchiveAndMuteNewChats
  /// * SuggestedActionCheckPassword
  /// * SuggestedActionCheckPhoneNumber
  /// * SuggestedActionSeeTicksHint
  /// * SuggestedActionConvertToBroadcastGroup
  factory SuggestedAction.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case SuggestedActionEnableArchiveAndMuteNewChats.CONSTRUCTOR:
        return SuggestedActionEnableArchiveAndMuteNewChats.fromJson(json);
      case SuggestedActionCheckPassword.CONSTRUCTOR:
        return SuggestedActionCheckPassword.fromJson(json);
      case SuggestedActionCheckPhoneNumber.CONSTRUCTOR:
        return SuggestedActionCheckPhoneNumber.fromJson(json);
      case SuggestedActionSeeTicksHint.CONSTRUCTOR:
        return SuggestedActionSeeTicksHint.fromJson(json);
      case SuggestedActionConvertToBroadcastGroup.CONSTRUCTOR:
        return SuggestedActionConvertToBroadcastGroup.fromJson(json);
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

  /// Suggests the user to check whether 2-step verification password is still remembered
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

class SuggestedActionSeeTicksHint extends SuggestedAction {

  /// Suggests the user to see a hint about meaning of one and two ticks on sent message
  SuggestedActionSeeTicksHint();

  

  /// Parse from a json
  SuggestedActionSeeTicksHint.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'suggestedActionSeeTicksHint';
  
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