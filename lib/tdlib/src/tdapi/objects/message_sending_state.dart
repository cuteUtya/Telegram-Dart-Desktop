part of '../tdapi.dart';

class MessageSendingState extends TdObject {

  /// Contains information about the sending state of the message
  MessageSendingState();

  

  /// a MessageSendingState return type can be :
  /// * MessageSendingStatePending
  /// * MessageSendingStateFailed
  factory MessageSendingState.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case MessageSendingStatePending.CONSTRUCTOR:
        return MessageSendingStatePending.fromJson(json);
      case MessageSendingStateFailed.CONSTRUCTOR:
        return MessageSendingStateFailed.fromJson(json);
    }
    throw new Exception('undefined type');
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'messageSendingState';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageSendingStatePending extends MessageSendingState {

  /// The message is being sent now, but has not yet been delivered to the server
  MessageSendingStatePending();

  

  /// Parse from a json
  MessageSendingStatePending.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
    };
  }

  static const CONSTRUCTOR = 'messageSendingStatePending';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class MessageSendingStateFailed extends MessageSendingState {

  /// The message failed to be sent
  MessageSendingStateFailed({this.errorCode,
    this.errorMessage,
    this.canRetry,
    this.retryAfter});

  /// [errorCode] An error code; 0 if unknown 
  int? errorCode;

  /// [errorMessage] Error message
  String? errorMessage;

  /// [canRetry] True, if the message can be re-sent
  bool? canRetry;

  /// [retryAfter] Time left before the message can be re-sent, in seconds. No update is sent when this field changes
  double? retryAfter;

  /// Parse from a json
  MessageSendingStateFailed.fromJson(Map<String, dynamic> json)  {
    int? pre_errorCode;
    try{
      pre_errorCode=json['error_code'];
   }catch(_){}
    errorCode = pre_errorCode;
    String? pre_errorMessage;
    try{
      pre_errorMessage=json['error_message'];
   }catch(_){}
    errorMessage = pre_errorMessage;
    bool? pre_canRetry;
    try{
      pre_canRetry=json['can_retry'];
   }catch(_){}
    canRetry = pre_canRetry;
    double? pre_retryAfter;
    try{
      pre_retryAfter=json['retry_after'];
   }catch(_){}
    retryAfter = pre_retryAfter;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "error_code": errorCode,
      "error_message": errorMessage,
      "can_retry": canRetry,
      "retry_after": retryAfter,
    };
  }

  static const CONSTRUCTOR = 'messageSendingStateFailed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}