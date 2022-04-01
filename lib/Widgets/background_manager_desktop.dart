import 'package:flutter/cupertino.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/StateWithStreamsSubscriptions.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/background_display.dart';
import 'package:myapp/Widgets/message/service_message.dart';
import 'package:myapp/Widgets/widget_hider.dart';
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
  Chat? chat;
  bool get useDark =>
      ClientTheme.currentTheme.environmentVariables["theme"]!() == "dark";
  Background? get background => widget.client.getCachedBackground(useDark);
  String currTheme = "";
  late GlobalKey<WidgetHiderState> hider;

  Widget _build(Background background, BuildContext context) =>
      BackgroundDisplay(
        key: Key("background?size=${MediaQuery.of(context).size}"),
        client: widget.client,
        background: background,
      );

  Widget _buildBasicBackground(BuildContext context) => StreamBuilder(
        stream: widget.client.selectedBackground,
        builder: (_, data) {
          if (background == null) {
            return const SizedBox.shrink();
          }
          return _build(background!, context);
        },
      );

  @override
  void initState() {
    streamSubscriptions.add(
      UIEvents.selectedChat().listen(
        (event) {
          var last = event.isNotEmpty ? event.last : null;
          var c = last == null ? null : widget.client.getChat(last);
          if (last == null) {
            hider.currentState!.show();
          } else {
            hider.currentState!.hide();
          }
          chat = c;
          if (c?.themeName != currTheme && c != null) {
            currTheme = c.themeName!;
            setState(() {});
          }
        },
      ),
    );
    super.initState();
  }

  void setBackground() {
    widget.client.send(GetBackgrounds()).then(
          (backs) => widget.client.send(
            SetBackground(
              forDarkTheme: useDark,
              background: InputBackgroundRemote(
                backgroundId: backs is Backgrounds
                    ? backs.backgrounds![3].id!
                    : (backs as Background).id!,
              ),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget result;

    if (background == null) setBackground();

    if (chat == null) {
      result = _buildBasicBackground(context);
    } else {
      result = StreamBuilder(
        stream: widget.client.chatThemeIn(chat!.id!),
        builder: (_, theme) {
          var name = theme.hasData ? theme.data.toString() : chat!.themeName!;
          if (name.isNotEmpty) {
            var themes = widget.client.getCachedThemes().firstWhere(
                  (e) => e.name == name,
                );
            var theme = useDark ? themes.darkSettings! : themes.lightSettings!;
            var themeColor = Color(theme.accentColor!).withOpacity(1);
            if (ClientTheme.currentTheme.getField("Accent") != themeColor) {
              ClientTheme.currentTheme.overrideValue(
                "Accent",
                ClientTheme.colorToHEX(themeColor),
              );
            }
            return _build(theme.background!, context);
          } else {
            ClientTheme.currentTheme.clearOverridenValues();
            return StreamBuilder(
              stream: widget.client.selectedBackground,
              builder: (_, data) {
                if (background == null) {
                  return const SizedBox.shrink();
                }
                return _build(background!, context);
              },
            );
          }
        },
      );
    }
    hider = GlobalKey<WidgetHiderState>();
    return Stack(
      alignment: Alignment.center,
      children: [
        result,
        WidgetHider(
          hiddenOnInit: chat != null,
          key: hider,
          child: ServiceMessage(
              text: widget.client.getTranslation("lng_willbe_history")),
        ),
      ],
    );
  }
}
