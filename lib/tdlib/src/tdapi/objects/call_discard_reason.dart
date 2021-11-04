part of '../tdapi.dart';

class CallDiscardReason extends TdObject {

  /// Describes the reason why a call was discarded
  CallDiscardReason();

  

  /// a CallDiscardReason return type can be :
  /// * CallDiscardReasonEmpty
  /// * CallDiscardReasonMissed
  /// * CallDiscardReasonDeclined
  /// * CallDiscardReasonDisconnected
  /// * CallDiscardReasonHungUp
  factory CallDiscardReason.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case CallDiscardReasonEmpty.CONSTRUCTOR:
        return CallDiscardReasonEmpty.fromJson(json);
      case CallDiscardReasonMissed.CONSTRUCTOR:
        return CallDiscardReasonMissed.fromJson(json);
      case CallDiscardReasonDeclined.CONSTRUCTOR:
        return CallDiscardReasonDeclined.fromJson(json);
      case CallDiscardReasonDisconnected.CONSTRUCTOR:
        return CallDiscardReasonDisconnected.fromJson(json);
      case CallDiscardReasonHungUp.CONSTRUCTOR:
        return CallDiscardReasonHungUp.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'callDiscardReason';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallDiscardReasonEmpty extends CallDiscardReason {

  /// The call wasn't discarded, or the reason is unknown
  CallDiscardReasonEmpty();

  

  /// Parse from a json
  CallDiscardReasonEmpty.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callDiscardReasonEmpty';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallDiscardReasonMissed extends CallDiscardReason {

  /// The call was ended before the conversation started. It was canceled by the caller or missed by the other party
  CallDiscardReasonMissed();

  

  /// Parse from a json
  CallDiscardReasonMissed.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callDiscardReasonMissed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallDiscardReasonDeclined extends CallDiscardReason {

  /// The call was ended before the conversation started. It was declined by the other party
  CallDiscardReasonDeclined();

  

  /// Parse from a json
  CallDiscardReasonDeclined.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callDiscardReasonDeclined';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallDiscardReasonDisconnected extends CallDiscardReason {

  /// The call was ended during the conversation because the users were disconnected
  CallDiscardReasonDisconnected();

  

  /// Parse from a json
  CallDiscardReasonDisconnected.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callDiscardReasonDisconnected';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallDiscardReasonHungUp extends CallDiscardReason {

  /// The call was ended because one of the parties hung up
  CallDiscardReasonHungUp();

  

  /// Parse from a json
  CallDiscardReasonHungUp.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callDiscardReasonHungUp';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}