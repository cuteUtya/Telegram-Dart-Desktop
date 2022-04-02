import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/background_display.dart';
import 'package:myapp/Widgets/message/service_message.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';

class DesktopBackgroundManager extends StatefulWidget {
  const DesktopBackgroundManager({Key? key, required this.client})
      : super(key: key);

  final TelegramClient client;

  @override
  State<DesktopBackgroundManager> createState() =>
      _DesktopBackgroundManagerState();
}

class _DesktopBackgroundManagerState
    extends StateWithStreamsSubscriptions<DesktopBackgroundManager> {
  late Background? defaultBackground =
      widget.client.getCachedBackground(useDark);
  Background? themeBackgrond;
  bool get useDark =>
      ClientTheme.currentTheme.environmentVariables["theme"]!() == "dark";
  bool willBeHistory = true;

  void showWillBeHistory() => setState(() => willBeHistory = true);
  void hideWillBeHistory() => setState(() => willBeHistory = false);

  void applyChatTheme(String themeName) {
    if (themeName.isNotEmpty) {
      var themes = widget.client.getCachedThemes().firstWhere(
            (e) => e.name == themeName,
          );
      var theme = useDark ? themes.darkSettings! : themes.lightSettings!;
      var themeColor = Color(theme.accentColor!).withOpacity(1);
      if (ClientTheme.currentTheme.getField("Accent") != themeColor) {
        ClientTheme.currentTheme.overrideValue(
          "Accent",
          ClientTheme.colorToHEX(themeColor),
        );
      }
      setState(() => themeBackgrond = theme.background!);
    } else {
      ClientTheme.currentTheme.clearOverridenValues();
      setState(() => themeBackgrond = null);
    }
  }

  @override
  void initState() {
    StreamSubscription? themeSubscription;
    UIEvents.selectedChat().listen(
      (chats) {
        themeSubscription?.cancel();
        if (chats.isEmpty) {
          showWillBeHistory();
        } else {
          hideWillBeHistory();
          applyChatTheme(widget.client.getChat(chats.last).themeName!);
          themeSubscription = widget.client.chatThemeIn(chats.last).listen(
            (theme) {
              applyChatTheme(theme);
            },
          );
        }
      },
    );

    streamSubscriptions.add(
      widget.client.selectedBackground.listen(
        (b) {
          if (b.forDarkTheme! == useDark) {
            if (b.background == null) {
              setDefaultBackground();
            } else {
              setState(() => defaultBackground = b.background);
            }
          }
        },
      ),
    );

    super.initState();
  }

  void setDefaultBackground() async {
    var def = widget.client.getCachedBackground(useDark);
    if (def != null) {
      setState(() => defaultBackground = def);
    } else {
      var backgrounds = await widget.client.send(GetBackgrounds());
      backgrounds as Backgrounds;
      widget.client.send(
        SetBackground(
          background: InputBackgroundRemote(
            backgroundId: backgrounds.backgrounds![3].id,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = const SizedBox();

    var background = themeBackgrond ?? defaultBackground;

    if (background != null) {
      result = BackgroundDisplay(
        key: Key(
          "background?hashCode=${background.hashCode}?size=${MediaQuery.of(context).size}",
        ),
        background: background,
        client: widget.client,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        result,
        if (willBeHistory)
          ServiceMessage(
            text: widget.client.getTranslation("lng_willbe_history"),
          ),
      ],
    );
  }
}
