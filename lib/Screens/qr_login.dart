import 'package:flutter/material.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/clickable_text.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrLogin extends StatefulWidget {
  const QrLogin({
    Key? key,
    required this.client,
    required this.link,
    required this.onBackButtonClick,
  }) : super(key: key);

  final TelegramClient client;
  final String link;
  final void Function() onBackButtonClick;
  @override
  State<StatefulWidget> createState() => _QrLoginState();
}

class _QrLoginState extends State<QrLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        QrImage(
          foregroundColor: ClientTheme.currentTheme.environmentVariables["theme"]!() == "dark" ? Colors.white : Colors.black,
          data: widget.link,
          version: QrVersions.auto,
          size: MediaQuery.of(context).size.width * (UIManager.useDesktopLayout ? 0.25 : 0.5),
          padding: const EdgeInsets.all(0),
        ),
        const SizedBox(height: 36),
        widget.client.buildTextByKey("lng_intro_qr_title", TextDisplay.title),
        const SizedBox(height: 16),
        Center(child:  SizedBox(
          width: 440,
          child: Column(
            children: [1, 2, 3]
                .map<Widget>((n) => Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Text("$n. ",
                            style: TextDisplay.create(
                              fontWeight: FontWeight.w700,
                            )),
                        widget.client.buildTextByKey("lng_intro_qr_step$n", TextDisplay.regular20),
                      ]),
                      const SizedBox(height: 6)
                    ]))
                .toList(),
          ),
        ),),
        const Spacer(),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 24),
          child: ClickableText(
            onTap: () => widget.onBackButtonClick(),
            data: widget.client.getTranslation("lng_intro_qr_skip"),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
