part of '../tdapi.dart';

class CallState extends TdObject {

  /// Describes the current call state
  CallState();

  

  /// a CallState return type can be :
  /// * CallStatePending
  /// * CallStateExchangingKeys
  /// * CallStateReady
  /// * CallStateHangingUp
  /// * CallStateDiscarded
  /// * CallStateError
  factory CallState.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case CallStatePending.CONSTRUCTOR:
        return CallStatePending.fromJson(json);
      case CallStateExchangingKeys.CONSTRUCTOR:
        return CallStateExchangingKeys.fromJson(json);
      case CallStateReady.CONSTRUCTOR:
        return CallStateReady.fromJson(json);
      case CallStateHangingUp.CONSTRUCTOR:
        return CallStateHangingUp.fromJson(json);
      case CallStateDiscarded.CONSTRUCTOR:
        return CallStateDiscarded.fromJson(json);
      case CallStateError.CONSTRUCTOR:
        return CallStateError.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'callState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStatePending extends CallState {

  /// The call is pending, waiting to be accepted by a user
  CallStatePending({this.isCreated,
    this.isReceived});

  /// [isCreated] True, if the call has already been created by the server 
  bool? isCreated;

  /// [isReceived] True, if the call has already been received by the other party
  bool? isReceived;

  /// Parse from a json
  CallStatePending.fromJson(Map<String, dynamic> json)  {
    bool? pre_isCreated;
    try{
      pre_isCreated=json['is_created'];
   }catch(_){}
    isCreated = pre_isCreated;
    bool? pre_isReceived;
    try{
      pre_isReceived=json['is_received'];
   }catch(_){}
    isReceived = pre_isReceived;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "is_created": isCreated,
      "is_received": isReceived,
    };
  }

  static const CONSTRUCTOR = 'callStatePending';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStateExchangingKeys extends CallState {

  /// The call has been answered and encryption keys are being exchanged
  CallStateExchangingKeys();

  

  /// Parse from a json
  CallStateExchangingKeys.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callStateExchangingKeys';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStateReady extends CallState {

  /// The call is ready to use
  CallStateReady({this.protocol,
    this.servers,
    this.config,
    this.encryptionKey,
    this.emojis,
    this.allowP2p});

  /// [protocol] Call protocols supported by the peer 
  CallProtocol? protocol;

  /// [servers] List of available call servers 
  List<CallServer>? servers;

  /// [config] A JSON-encoded call config 
  String? config;

  /// [encryptionKey] Call encryption key 
  String? encryptionKey;

  /// [emojis] Encryption key emojis fingerprint 
  List<String>? emojis;

  /// [allowP2p] True, if peer-to-peer connection is allowed by users privacy settings
  bool? allowP2p;

  /// Parse from a json
  CallStateReady.fromJson(Map<String, dynamic> json)  {
    CallProtocol? pre_protocol;
    try{
      pre_protocol=CallProtocol.fromJson(json['protocol'] ?? <String, dynamic>{});
   }catch(_){}
    protocol = pre_protocol;
    List<CallServer>? pre_servers;
    try{
      pre_servers=List<CallServer>.from((json['servers'] ?? [])!.map((item) => CallServer.fromJson(item ?? <String, dynamic>{})).toList());
   }catch(_){}
    servers = pre_servers;
    String? pre_config;
    try{
      pre_config=json['config'];
   }catch(_){}
    config = pre_config;
    String? pre_encryptionKey;
    try{
      pre_encryptionKey=json['encryption_key'];
   }catch(_){}
    encryptionKey = pre_encryptionKey;
    List<String>? pre_emojis;
    try{
      pre_emojis=List<String>.from((json['emojis'] ?? [])!.map((item) => item).toList());
   }catch(_){}
    emojis = pre_emojis;
    bool? pre_allowP2p;
    try{
      pre_allowP2p=json['allow_p2p'];
   }catch(_){}
    allowP2p = pre_allowP2p;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "protocol": protocol == null ? null : protocol?.toJson(),
      "servers": servers?.map((i) => i.toJson()).toList(),
      "config": config,
      "encryption_key": encryptionKey,
      "emojis": emojis?.map((i) => i).toList(),
      "allow_p2p": allowP2p,
    };
  }

  static const CONSTRUCTOR = 'callStateReady';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStateHangingUp extends CallState {

  /// The call is hanging up after discardCall has been called
  CallStateHangingUp();

  

  /// Parse from a json
  CallStateHangingUp.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'callStateHangingUp';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStateDiscarded extends CallState {

  /// The call has ended successfully
  CallStateDiscarded({this.reason,
    this.needRating,
    this.needDebugInformation});

  /// [reason] The reason, why the call has ended 
  CallDiscardReason? reason;

  /// [needRating] True, if the call rating must be sent to the server 
  bool? needRating;

  /// [needDebugInformation] True, if the call debug information must be sent to the server
  bool? needDebugInformation;

  /// Parse from a json
  CallStateDiscarded.fromJson(Map<String, dynamic> json)  {
    CallDiscardReason? pre_reason;
    try{
      pre_reason=CallDiscardReason.fromJson(json['reason'] ?? <String, dynamic>{});
   }catch(_){}
    reason = pre_reason;
    bool? pre_needRating;
    try{
      pre_needRating=json['need_rating'];
   }catch(_){}
    needRating = pre_needRating;
    bool? pre_needDebugInformation;
    try{
      pre_needDebugInformation=json['need_debug_information'];
   }catch(_){}
    needDebugInformation = pre_needDebugInformation;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "reason": reason == null ? null : reason?.toJson(),
      "need_rating": needRating,
      "need_debug_information": needDebugInformation,
    };
  }

  static const CONSTRUCTOR = 'callStateDiscarded';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class CallStateError extends CallState {

  /// The call has ended with an error
  CallStateError({this.error});

  /// [error] Error. An error with the code 4005000 will be returned if an outgoing call is missed because of an expired timeout
  TdError? error;

  /// Parse from a json
  CallStateError.fromJson(Map<String, dynamic> json)  {
    TdError? pre_error;
    try{
      pre_error=TdError.fromJson(json['error'] ?? <String, dynamic>{});
   }catch(_){}
    error = pre_error;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "error": error == null ? null : error?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'callStateError';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}