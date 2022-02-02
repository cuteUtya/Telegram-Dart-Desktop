import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Widgets/display_button.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/dots_indicator.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/tdlib/client.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({required this.client, required this.onNextClick, Key? key}) : super(key: key);

  final void Function() onNextClick;
  final TelegramClient client;
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int current = 0;
  double _t = 0;
  double _dragStart = 0;

  static final List<_IntroductionScreenInfo> _screens = [
    _IntroductionScreenInfo(
        appName,
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: "An ", style: TextDisplay.regular20),
              TextSpan(text: "unofficial ", style: TextDisplay.bold20),
              TextSpan(text: "Telegram client. Have additional features and nice look.", style: TextDisplay.regular20)
            ])),
        "Assets/Introduction/Logo.json"),
    _IntroductionScreenInfo(
        "Private",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: "Telegram messages are ", style: TextDisplay.regular20),
              TextSpan(text: "heavily encrypted ", style: TextDisplay.bold20),
              TextSpan(text: "and can self-destruct.", style: TextDisplay.regular20)
            ])),
        "Assets/Introduction/Private.json"),
    _IntroductionScreenInfo(
        "Synchronous",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: "Telegram lets you access your chats from multiple ", style: TextDisplay.regular20),
              TextSpan(text: "multiple ", style: TextDisplay.bold20),
              TextSpan(text: "devices.", style: TextDisplay.regular20),
            ])),
        "Assets/Introduction/Synchronous.json"),
    _IntroductionScreenInfo(
        "Fast",
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(text: "Telegram delivers messages ", style: TextDisplay.regular20),
              TextSpan(text: "faster ", style: TextDisplay.bold20),
              TextSpan(text: "than any other application.", style: TextDisplay.regular20),
            ])),
        "Assets/Introduction/Fast.json"),
    _IntroductionScreenInfo(
        "Powerful",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram has ", style: TextDisplay.regular20),
            TextSpan(text: "no limits ", style: TextDisplay.bold20),
            TextSpan(text: "on the size of your media and chats.", style: TextDisplay.regular20),
          ]),
        ),
        "Assets/Introduction/Powerfull.json"),
    _IntroductionScreenInfo(
        "Open",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram has an ", style: TextDisplay.regular20),
            TextSpan(text: "open API and source ", style: TextDisplay.bold20),
            TextSpan(text: "code free for everyone.", style: TextDisplay.regular20),
          ]),
        ),
        "Assets/Introduction/Open.json"),
    _IntroductionScreenInfo(
        "Secure",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram keeps your messages ", style: TextDisplay.regular20),
            TextSpan(text: "safe ", style: TextDisplay.bold20),
            TextSpan(text: "from hacker attacks.", style: TextDisplay.regular20),
          ]),
        ),
        "Assets/Introduction/Secure.json"),
    _IntroductionScreenInfo(
        "Social",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram groups can hold ", style: TextDisplay.regular20),
            TextSpan(text: "up to 200,000 members. ", style: TextDisplay.bold20),
          ]),
        ),
        "Assets/Introduction/Social.json"),
    _IntroductionScreenInfo(
        "Expressive",
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(text: "Telegram lets you ", style: TextDisplay.regular20),
            TextSpan(text: "completely customize ", style: TextDisplay.bold20),
            TextSpan(text: "your messenger.", style: TextDisplay.regular20),
          ]),
        ),
        "Assets/Introduction/Expressive.json")
  ];

  setT(double value) => setState(() {
        value = clamp(value, current == 0 ? 0 : -1, current == _screens.length - 1 ? 0 : 1).toDouble();
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
    return Stack(
      children: [
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
                  _IntroductionScreen(screenInfo: _screens[current]),
                  DotIndicator(
                    dotsCount: _screens.length,
                    currentDot: current,
                    t: _t,
                    onDotClick: setCurrent,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              onHorizontalDragUpdate: (draginfo) {
                setT(
                  (_dragStart - draginfo.globalPosition.dx) / (MediaQuery.of(context).size.width / 10),
                );
              },
            )),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              DesktopButton(
                  weight: FontWeight.w500,
                  width: 300,
                  text: widget.client.getTranslation("lng_start_msgs"),
                  onPressed: () => widget.onNextClick()),
            ],
          ),
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 40),
        ),
      ],
    );
  }
}

class _IntroductionScreen extends StatelessWidget {
  const _IntroductionScreen({Key? key, required this.screenInfo}) : super(key: key);
  final _IntroductionScreenInfo screenInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Lottie.asset(screenInfo.lottieAnimationPath),
          width: 256,
          height: 256,
          margin: const EdgeInsets.only(bottom: 20),
        ),
        Text(screenInfo.header, style: TextDisplay.introTitle),
        Container(
          child: screenInfo.text,
          width: 330,
          height: 64,
          margin: const EdgeInsets.only(top: 12),
        )
      ],
    );
  }
}

class _IntroductionScreenInfo {
  _IntroductionScreenInfo(this.header, this.text, this.lottieAnimationPath);
  final String lottieAnimationPath;
  final String header;
  final RichText text;
}
