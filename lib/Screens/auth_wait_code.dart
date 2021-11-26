import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;
import 'dart:async';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen(
      {Key? key,
      required this.client,
      required this.codeInfo,
      required this.codeCheckCallback,
      required this.resendCallback})
      : super(key: key);
  final TelegramClient client;
  final AuthenticationCodeInfo codeInfo;
  final void Function() resendCallback;
  final Future<TdObject> Function(String code) codeCheckCallback;
  @override
  State<StatefulWidget> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  AuthenticationCodeInfo? updatedCodeInfo;

  AuthenticationCodeInfo getCodeInfo() {
    if (updatedCodeInfo != null) return updatedCodeInfo!;
    return widget.codeInfo;
  }

  bool telegramIsDial = false;
  String code = "";

  int seconds = 0;
  Timer? timer;

  AuthenticationCodeType? passedType;
  bool suggestResend = true;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (seconds >= 0) {
        setState(() {
          seconds--;
          if (seconds == 0) {
            passedType = widget.codeInfo.nextType;
            if (widget.codeInfo.nextType!.getConstructor() ==
                AuthenticationCodeTypeCall.CONSTRUCTOR) {
              widget.resendCallback();
              telegramIsDial = true;
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String getMinutes() {
    return max((seconds / 60) - 0.5, 0).toStringAsFixed(0);
  }

  String getSeconds() {
    var scnd = ((seconds % 60) + 0.5).toInt();
    return scnd < 10 ? "0$scnd" : scnd.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (seconds <= 0 &&
        widget.codeInfo.timeout != 0 &&
        widget.codeInfo.nextType != passedType) {
      seconds = widget.codeInfo.timeout!;
      suggestResend = false;
    }

    return SizedBox(
        width: 400,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(getCodeInfo().phoneNumber!,
                  style: TextDisplay.create(
                      fontWeight: FontWeight.w500,
                      textColor: TextColor.HeaderMain,
                      size: 24)),
              const SizedBox(height: 18),
              widget.client.buildTextByKey(
                  currentDesc(),
                  TextDisplay.create(
                      textColor: TextColor.AdditionalTextColor, size: 16)),
              const SizedBox(height: 20),
              DataInput(
                  value: code,
                  externalControll: true,
                  onValueChange: (v) => code = v,
                  validationCallback: (v) => v.length == codeLength(),
                  customLabelDisplay: widget.client.buildTextByKey(
                      "lng_code_ph", TextDisplay.create(size: 14))),
              const SizedBox(height: 16),
              suggestResend
                  ? ClickableText(onTap: () {
                      widget.resendCallback();
                      suggestResend = false;
                    }, builder: (hover) {
                      return widget.client.buildTextByKey(
                          "lng_code_no_telegram",
                          TextDisplay.create(
                              textColor: TextColor.Accent,
                              size: 16,
                              decoration: hover
                                  ? TextDecoration.underline
                                  : TextDecoration.none));
                    })
                  : widget.client.buildTextByKey(
                      telegramIsDial ? "lng_code_called" : "lng_code_call",
                      TextDisplay.create(
                          textColor: TextColor.AdditionalTextColor, size: 16),
                      replacing: {
                          "{minutes}": getMinutes(),
                          "{seconds}": getSeconds()
                        }),
              const SizedBox(height: 40),
              DesktopButton(
                  onPressed: () => widget.codeCheckCallback(code),
                  width: 400,
                  weight: FontWeight.w500,
                  languagePackStringFuture:
                      widget.client.getLanguagePackString("lng_intro_next"))
            ]));
  }

  String currentDesc() {
    if (getCodeInfo().type!.getConstructor() ==
        AuthenticationCodeTypeTelegramMessage.CONSTRUCTOR) {
      return "lng_code_telegram";
    }
    return "lng_code_desc";
  }

  int codeLength() {
    switch (getCodeInfo().type!.getConstructor()) {
      case AuthenticationCodeTypeCall.CONSTRUCTOR:
        return (getCodeInfo().type as AuthenticationCodeTypeCall).length!;
      case AuthenticationCodeTypeSms.CONSTRUCTOR:
        return (getCodeInfo().type as AuthenticationCodeTypeSms).length!;
      case AuthenticationCodeTypeTelegramMessage.CONSTRUCTOR:
        return (getCodeInfo().type as AuthenticationCodeTypeTelegramMessage)
            .length!;

      default:
        //why?
        //Because
        return 9999;
    }
  }
}
