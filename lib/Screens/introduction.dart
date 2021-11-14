import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Screens/phone_enter.dart';
import 'package:myapp/ThemesEngine/theme_interpreter.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/dots_indicator.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/tdlib/td_api.dart' hide RichText hide Text;
import 'package:myapp/utils.dart';
import 'package:myapp/tdlib/client.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({required this.client, Key? key}) : super(key: key);

  final TelegramClient client;
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int current = 0;
  double _t = 0;
  double _dragStart = 0;

  static final List<_introductionScreenInfo> _screens = [
    _introductionScreenInfo(
        appName,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: "An ", style: TextDisplay.create()),
              TextSpan(
                  text: "unofficial ",
                  style: TextDisplay.create(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      "Telegram client. Have additional features and nice look.",
                  style: TextDisplay.create())
            ])),
        "Assets/Introduction/Logo.json"),
    _introductionScreenInfo(
        "Private",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Telegram messages are ", style: TextDisplay.create()),
              TextSpan(
                  text: "heavily encrypted ",
                  style: TextDisplay.create(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "and can self-destruct.", style: TextDisplay.create())
            ])),
        "Assets/Introduction/Private.json"),
    _introductionScreenInfo(
        "Synchronous",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Telegram lets you access your chats from multiple ",
                  style: TextDisplay.create()),
              TextSpan(
                  text: "multiple ",
                  style: TextDisplay.create(fontWeight: FontWeight.bold)),
              TextSpan(text: "devices.", style: TextDisplay.create()),
            ])),
        "Assets/Introduction/Synchronous.json"),
    _introductionScreenInfo(
        "Fast",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "Telegram delivers messages ",
                  style: TextDisplay.create()),
              TextSpan(
                  text: "faster ",
                  style: TextDisplay.create(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "than any other application.",
                  style: TextDisplay.create()),
            ])),
        "Assets/Introduction/Fast.json"),
    _introductionScreenInfo(
        "Powerful",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram has ", style: TextDisplay.create()),
            TextSpan(
                text: "no limits ",
                style: TextDisplay.create(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "on the size of your media and chats.",
                style: TextDisplay.create()),
          ]),
        ),
        "Assets/Introduction/Powerfull.json"),
    _introductionScreenInfo(
        "Open",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram has an ", style: TextDisplay.create()),
            TextSpan(
                text: "open API and source ",
                style: TextDisplay.create(fontWeight: FontWeight.bold)),
            TextSpan(
                text: "code free for everyone.", style: TextDisplay.create()),
          ]),
        ),
        "Assets/Introduction/Open.json"),
    _introductionScreenInfo(
        "Secure",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Telegram keeps your messages ",
                style: TextDisplay.create()),
            TextSpan(
                text: "safe ",
                style: TextDisplay.create(fontWeight: FontWeight.bold)),
            TextSpan(text: "from hacker attacks.", style: TextDisplay.create()),
          ]),
        ),
        "Assets/Introduction/Secure.json"),
    _introductionScreenInfo(
        "Social",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Telegram groups can hold ", style: TextDisplay.create()),
            TextSpan(
                text: "up to 200,000 members. ",
                style: TextDisplay.create(fontWeight: FontWeight.bold)),
          ]),
        ),
        "Assets/Introduction/Social.json"),
    _introductionScreenInfo(
        "Expressive",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram lets you ", style: TextDisplay.create()),
            TextSpan(
                text: "completely customize ",
                style: TextDisplay.create(fontWeight: FontWeight.bold)),
            TextSpan(text: "your messenger.", style: TextDisplay.create()),
          ]),
        ),
        "Assets/Introduction/Expressive.json")
  ];

  setT(double value) => setState(() {
        value = clamp(value, current == 0 ? 0 : -1,
            current == _screens.length - 1 ? 0 : 1);
        _t = value;
      });

  setCurrent(int index) => setState(() {
        current = clampInt(index, 0, _screens.length - 1);
      });

  next() => setState(() {
        current++;
        current = clampInt(current, 0, _screens.length - 1);
      });

  previus() => setState(() {
        current--;
        current = clampInt(current, 0, _screens.length - 1);
      });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RawKeyboardListener(
          onKey: (kEvent) {
            if (kEvent.isKeyPressed(LogicalKeyboardKey.arrowRight)) next();
            if (kEvent.isKeyPressed(LogicalKeyboardKey.arrowLeft)) previus();
          },
          focusNode: FocusNode(debugLabel: "Button"),
          child: GestureDetector(
            onHorizontalDragStart: (draginfo) {
              _dragStart = draginfo.globalPosition.dx;
            },
            onHorizontalDragEnd: (_) {
              if (_t > 0.5) next();
              if (_t < -0.5) previus();
              setT(0);
            },
            onTap: next,
            child: Column(
              children: [
                _introductionScreen(screenInfo: _screens[current]),
                Container(
                  child: DotIndicator(
                    dotsCount: _screens.length,
                    currentDot: current,
                    t: _t,
                    onDotClick: setCurrent,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            onHorizontalDragUpdate: (draginfo) {
              setT(
                (_dragStart - draginfo.globalPosition.dx) /
                    (MediaQuery.of(context).size.width / 10),
              );
            },
          )),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            FutureBuilder(
                future: widget.client.getLanguagePackString("lng_start_msgs"),
                builder: (context, builder) {
                  return DesktopButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => PhoneEnterScreen(
                            client: widget.client,
                          ),
                        )),
                    fontSize: 18,
                    weight: FontWeight.w500,
                    text: builder.hasData
                        ? (builder.data as LanguagePackStringValueOrdinary)
                            .value!
                        : "Loading... ",
                    width: 300,
                  );
                }),
          ],
        ),
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(bottom: 40),
      )
    ]);
  }
}

class _introductionScreen extends StatelessWidget {
  const _introductionScreen({Key? key, required this.screenInfo})
      : super(key: key);
  final _introductionScreenInfo screenInfo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Lottie.asset(screenInfo.lottieAnimationPath),
        width: 256,
        height: 256,
        margin: const EdgeInsets.only(bottom: 20),
      ),
      Text(screenInfo.header,
          style: TextDisplay.create(size: 26, textColor: TextColor.Accent)),
      Container(
          child: screenInfo.text,
          width: 330,
          height: 64,
          margin: const EdgeInsets.only(top: 12))
    ]);
  }
}

class _introductionScreenInfo {
  _introductionScreenInfo(this.header, this.text, this.lottieAnimationPath);
  final String lottieAnimationPath;
  final String header;
  final RichText text;
}
