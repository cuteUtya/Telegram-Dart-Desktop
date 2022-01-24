import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_input.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class PasswordCheckScreen extends StatefulWidget {
  const PasswordCheckScreen({
    Key? key,
    required this.client,
    required this.authWaitPassword,
  }) : super(key: key);

  final AuthorizationStateWaitPassword authWaitPassword;
  final TelegramClient client;
  @override
  State<StatefulWidget> createState() => _PasswordCheckScreenState();
}

class _PasswordCheckScreenState extends State<PasswordCheckScreen> {
  bool showResetBtn = false;
  String _pass = "";
  String _code = "";
  bool recover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          widget.client.buildTextByKey("lng_signin_title", TextDisplay.title),
          const SizedBox(height: 8),
          widget.client.buildTextByKey(
              recover ? "lng_signin_recover_desc" : "lng_signin_desc",
              TextDisplay.additional,
              replacing: {
                "{email}": widget.authWaitPassword.recoveryEmailAddressPattern!
              }),
          const SizedBox(height: 36),
          DataInput(
              onValueChange: (v) => recover ? _code = v : _pass = v,
              obscureText: !recover,
              asyncValidationCallback:
                  recover ? _checkEmailCode : _checkPassword,
              fieldName: widget.client.getTranslation(
                  recover ? "lng_signin_code" : "lng_signin_password")),
          const SizedBox(height: 8),
          (widget.authWaitPassword.passwordHint!.isEmpty
              ? const Center()
              : widget.client.buildTextByKey(
                  "lng_signin_hint", TextDisplay.regular16, replacing: {
                  "{password_hint}": widget.authWaitPassword.passwordHint!
                })),
          widget.authWaitPassword.hasRecoveryEmailAddress! && !recover
              ? ClickableText(
                  onTap: () {
                    widget.client.send(RequestAuthenticationPasswordRecovery());
                    setState(() => recover = true);
                  },
                  data: widget.client.getTranslation("lng_signin_recover"))
              : const Center(),
          const SizedBox(height: 36),
          DesktopButton(
              text: widget.client.getTranslation("lng_intro_submit"),
              width: 340,
              onPressed: () =>
                  recover ? _checkEmailCode(_code) : _checkPassword(_pass)),
          const SizedBox(height: 24),
          AnimatedContainer(
              duration: const Duration(seconds: 1),
              child: DesktopButton(
                  heigth: showResetBtn ? 48 : 0,
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) =>
                          AccountResetAlert(client: widget.client)),
                  backColor: showResetBtn
                      ? ButtonColor.ButtonDangerBackColor
                      : ButtonColor.Transparent,
                  textColor: showResetBtn
                      ? ClientTheme.currentTheme.getField("DangerColor")
                      : Colors.transparent,
                  width: 340,
                  text: widget.client
                      .getTranslation("lng_signin_reset_account"))),
          const Spacer()
        ],
      ),
    );
  }

  Future<bool> _checkEmailCode(String code) async {
    var completer = Completer<bool>();
    widget.client
        .send(RecoverAuthenticationPassword(recoveryCode: code))
        .then((value) {
      var val = value is Ok;
      if (!val) setState(() => showResetBtn = true);
      completer.complete(val);
    });
    return completer.future;
  }

  Future<bool> _checkPassword(String pass) {
    var completer = Completer<bool>();
    widget.client
        .send(CheckAuthenticationPassword(password: pass))
        .then((value) {
      var valid = value is Ok;
      if (!valid) setState(() => showResetBtn = true);
      completer.complete(valid);
    });

    return completer.future;
  }
}

class AccountResetAlert extends StatelessWidget {
  const AccountResetAlert({Key? key, required this.client}) : super(key: key);
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            client.buildTextByKey(
                "lng_signin_sure_reset", TextDisplay.regular20),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: DesktopButton(
                    text: client.getTranslation("lng_cancel"),
                    onPressed: () => Navigator.pop(context, "OK"),
                  ),
                  alignment: Alignment.bottomRight,
                ),
                const SizedBox(width: 16),
                Container(
                    child: DesktopButton(
                        textColor:
                            ClientTheme.currentTheme.getField("DangerColor"),
                        backColor: ButtonColor.ButtonDangerBackColor,
                        text: client.getTranslation("lng_signin_reset"),
                        onPressed: () => Navigator.pop(
                            context, client.send(DeleteAccount()))),
                    alignment: Alignment.bottomRight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
