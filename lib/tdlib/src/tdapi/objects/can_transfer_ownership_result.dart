part of '../tdapi.dart';

class CanTransferOwnershipResult extends TdObject {

  /// Represents result of checking whether the current session can be used to transfer a chat ownership to another user
  CanTransferOwnershipResult();

  

  /// a CanTransferOwnershipResult return type can be :
  /// * CanTransferOwnershipResultOk
  /// * CanTransferOwnershipResultPasswordNeeded
  /// * CanTransferOwnershipResultPasswordTooFresh
  /// * CanTransferOwnershipResultSessionTooFresh
  factory CanTransferOwnershipResult.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case CanTransferOwnershipResultOk.CONSTRUCTOR:
        return CanTransferOwnershipResultOk.fromJson(json);
      case CanTransferOwnershipResultPasswordNeeded.CONSTRUCTOR:
        return CanTransferOwnershipResultPasswordNeeded.fromJson(json);
      case CanTransferOwnershipResultPasswordTooFresh.CONSTRUCTOR:
        return CanTransferOwnershipResultPasswordTooFresh.fromJson(json);
      case CanTransferOwnershipResultSessionTooFresh.CONSTRUCTOR:
        return CanTransferOwnershipResultSessionTooFresh.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'canTransferOwnershipResult';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CanTransferOwnershipResultOk extends CanTransferOwnershipResult {

  /// The session can be used
  CanTransferOwnershipResultOk();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CanTransferOwnershipResultOk.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'canTransferOwnershipResultOk';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CanTransferOwnershipResultPasswordNeeded extends CanTransferOwnershipResult {

  /// The 2-step verification needs to be enabled first
  CanTransferOwnershipResultPasswordNeeded();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CanTransferOwnershipResultPasswordNeeded.fromJson(Map<String, dynamic> json)  {
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'canTransferOwnershipResultPasswordNeeded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CanTransferOwnershipResultPasswordTooFresh extends CanTransferOwnershipResult {

  /// The 2-step verification was enabled recently, user needs to wait
  CanTransferOwnershipResultPasswordTooFresh({this.retryAfter});

  /// [retryAfter] Time left before the session can be used to transfer ownership of a chat, in seconds
  int? retryAfter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CanTransferOwnershipResultPasswordTooFresh.fromJson(Map<String, dynamic> json)  {
    retryAfter = json['retry_after'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "retry_after": retryAfter,
    };
  }

  static const CONSTRUCTOR = 'canTransferOwnershipResultPasswordTooFresh';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CanTransferOwnershipResultSessionTooFresh extends CanTransferOwnershipResult {

  /// The session was created recently, user needs to wait
  CanTransferOwnershipResultSessionTooFresh({this.retryAfter});

  /// [retryAfter] Time left before the session can be used to transfer ownership of a chat, in seconds
  int? retryAfter;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  CanTransferOwnershipResultSessionTooFresh.fromJson(Map<String, dynamic> json)  {
    retryAfter = json['retry_after'];
    extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "retry_after": retryAfter,
    };
  }

  static const CONSTRUCTOR = 'canTransferOwnershipResultSessionTooFresh';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}