import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/dots_indicator.dart';
import 'package:myapp/math_extension.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int current = 0;
  double _t = 0;
  double _dragStart = 0;

  static final List<_introductionScreenInfo> _screens = [
    _introductionScreenInfo(
        "Smthgram",
        "An unofficial Telegram client. Written on Flutter and Dart. Have additional features and have nice look",
        "Assets/Introduction/Logo.json"),
    _introductionScreenInfo(
        "Transparency",
        "Telegram has a public, well-documented API. All clients are open source.",
        "Assets/Introduction/Transparency.json"),
    _introductionScreenInfo(
        "Synchronous",
        "All your actions are synced across all devices",
        "Assets/Introduction/Synchronous.json"),
    _introductionScreenInfo(
        "Powerfull",
        "Telegram allows you to store an unlimited number of files and dialogues in the cloud",
        "Assets/Introduction/Powerfull.json"),
    _introductionScreenInfo(
        "Customizable",
        "Customize the client for you, a powerful client tool allows you to create themes for every taste",
        "Assets/Introduction/Customizable.json")
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
    return RawKeyboardListener(
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
                margin: const EdgeInsets.only(top: 36),
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
        ));
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
        margin: const EdgeInsets.only(bottom: 0),
      ),
      TextDisplay.H1(screenInfo.header),
      Container(
          child: TextDisplay.Regular(screenInfo.text),
          width: 500,
          height: 80,
          margin: const EdgeInsets.only(top: 12))
    ]);
  }
}

class _introductionScreenInfo {
  _introductionScreenInfo(this.header, this.text, this.lottieAnimationPath);
  final String lottieAnimationPath;
  final String header;
  final String text;
}
