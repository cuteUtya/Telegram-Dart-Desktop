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
    this.needAnotherSender,
    this.retryAfter});

  /// [errorCode] An error code; 0 if unknown 
  int? errorCode;

  /// [errorMessage] Error message
  String? errorMessage;

  /// [canRetry] True, if the message can be re-sent
  bool? canRetry;

  /// [needAnotherSender] True, if the message can be re-sent only on behalf of a different sender
  bool? needAnotherSender;

  /// [retryAfter] Time left before the message can be re-sent, in seconds. No update is sent when this field changes
  double? retryAfter;

  /// Parse from a json
  MessageSendingStateFailed.fromJson(Map<String, dynamic> json)  {
    errorCode = json['error_code'] == null ? null : json['error_code'];
    errorMessage = json['error_message'] == null ? null : json['error_message'];
    canRetry = json['can_retry'] == null ? null : json['can_retry'];
    needAnotherSender = json['need_another_sender'] == null ? null : json['need_another_sender'];
    retryAfter = json['retry_after'] == null ? null : json['retry_after'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "error_code": errorCode,
      "error_message": errorMessage,
      "can_retry": canRetry,
      "need_another_sender": needAnotherSender,
      "retry_after": retryAfter,
    };
  }

  static const CONSTRUCTOR = 'messageSendingStateFailed';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}