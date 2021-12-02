part of '../tdapi.dart';

class MessageSendOptions extends TdObject {

  /// Options to be used when a message is sent
  MessageSendOptions({this.disableNotification,
    this.fromBackground,
    this.schedulingState});

  /// [disableNotification] Pass true to disable notification for the message
  bool? disableNotification;

  /// [fromBackground] Pass true if the message is sent from the background
  bool? fromBackground;

  /// [schedulingState] Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
  MessageSchedulingState? schedulingState;

  /// Parse from a json
  MessageSendOptions.fromJson(Map<String, dynamic> json)  {
    disableNotification = json['disable_notification'] == null ? null : json['disable_notification'];
    fromBackground = json['from_background'] == null ? null : json['from_background'];
    schedulingState = json['scheduling_state'] == null ? null : MessageSchedulingState.fromJson(json['scheduling_state'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "disable_notification": disableNotification,
      "from_background": fromBackground,
      "scheduling_state": schedulingState == null ? null : schedulingState?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageSendOptions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}