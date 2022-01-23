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
  const EnterCodeScreen({Key? key, required this.client, required this.codeInfo}) : super(key: key);
  final TelegramClient client;
  final AuthenticationCodeInfo codeInfo;
  @override
  State<StatefulWidget> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  AuthenticationCodeInfo? updatedCodeInfo;

  AuthenticationCodeInfo getCodeInfo() {
    if (updatedCodeInfo != null) return updatedCodeInfo!;
    return widget.codeInfo;
  }

  String? errorStr;

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
            if (widget.codeInfo.nextType!.getConstructor() == AuthenticationCodeTypeCall.CONSTRUCTOR) {
              widget.client.send(ResendAuthenticationCode()).then(errorHandler);
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
    if (seconds <= 0 && widget.codeInfo.timeout != 0 && widget.codeInfo.nextType != passedType) {
      seconds = widget.codeInfo.timeout!;
      suggestResend = false;
    }

    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getCodeInfo().phoneNumber!, style: TextDisplay.title),
          const SizedBox(height: 18),
          widget.client.buildTextByKey(
              getCodeInfo().type!.runtimeType == AuthenticationCodeTypeTelegramMessage ? "lng_code_telegram" : "lng_code_desc",
              TextDisplay.additional),
          const SizedBox(height: 20),
          DataInput(
              value: code,
              externalControll: true,
              onValueChange: (v) => code = v,
              validationCallback: (v) => v.length == codeLength(),
              fieldName: widget.client.getTranslation("lng_code_ph")),
          const SizedBox(height: 16),
          suggestResend
              ? ClickableText(
                  data: widget.client.getTranslation("lng_code_no_telegram"),
                  onTap: () {
                    widget.client.send(ResendAuthenticationCode()).then(errorHandler);
                    suggestResend = false;
                  },
                )
              : widget.client.buildTextByKey(telegramIsDial ? "lng_code_called" : "lng_code_call", TextDisplay.additional,
                  replacing: {"{minutes}": getMinutes(), "{seconds}": getSeconds()}),
          const SizedBox(height: 40),
          DesktopButton(
              onPressed: () => widget.client.send(CheckAuthenticationCode(code: code)).then(errorHandler),
              width: 400,
              weight: FontWeight.w500,
              text: widget.client.getTranslation("lng_intro_next")),
          const SizedBox(height: 16),
          errorStr == null ? const Center() : Text(errorStr!, style: TextDisplay.regular16),
        ],
      ),
    );
  }

  void errorHandler(TdObject result) {
    if (result.getConstructor() == TdError.CONSTRUCTOR) {
      setState(() => errorStr = widget.client.getLocalizedErrorMessage(result as TdError));
    }
  }

  int codeLength() {
    switch (getCodeInfo().type!.runtimeType) {
      case AuthenticationCodeTypeCall:
        return (getCodeInfo().type as AuthenticationCodeTypeCall).length!;
      case AuthenticationCodeTypeSms:
        return (getCodeInfo().type as AuthenticationCodeTypeSms).length!;
      case AuthenticationCodeTypeTelegramMessage:
        return (getCodeInfo().type as AuthenticationCodeTypeTelegramMessage).length!;
      default:
        return 5;
    }
  }
}
