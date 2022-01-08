part of '../tdapi.dart';

class MessageSendOptions extends TdObject {

  /// Options to be used when a message is sent
  MessageSendOptions({this.disableNotification,
    this.fromBackground,
    this.protectContent,
    this.schedulingState});

  /// [disableNotification] Pass true to disable notification for the message
  bool? disableNotification;

  /// [fromBackground] Pass true if the message is sent from the background
  bool? fromBackground;

  /// [protectContent] Pass true if the content of the message must be protected from forwarding and saving; for bots only
  bool? protectContent;

  /// [schedulingState] Message scheduling state; pass null to send message immediately. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
  MessageSchedulingState? schedulingState;

  /// Parse from a json
  MessageSendOptions.fromJson(Map<String, dynamic> json)  {
    disableNotification = json['disable_notification'] == null ? null : json['disable_notification'];
    fromBackground = json['from_background'] == null ? null : json['from_background'];
    protectContent = json['protect_content'] == null ? null : json['protect_content'];
    schedulingState = json['scheduling_state'] == null ? null : MessageSchedulingState.fromJson(json['scheduling_state'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "disable_notification": disableNotification,
      "from_background": fromBackground,
      "protect_content": protectContent,
      "scheduling_state": schedulingState == null ? null : schedulingState?.toJson(),
    };
  }

  static const CONSTRUCTOR = 'messageSendOptions';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}