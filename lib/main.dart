import 'dart:math';
import 'dart:ui';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:myapp/Links%20utils/linksOpener.dart';
import 'package:myapp/Screens/autorization_router.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Context%20menus/context_menu_overlay.dart';
import 'package:myapp/Widgets/blured_widget.dart';
import 'package:myapp/Widgets/burger_menu.dart';
import 'package:myapp/Widgets/transcluent_gestures_stack.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartVLC.initialize();
  await ClientTheme.init();
  var client = TelegramClient();
  await client.init();
  await client.send(SetLogVerbosityLevel(newVerbosityLevel: 0));
  UrlsUtils.init(client);
  runApp(
    MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ClientTheme.currentTheme.tryGetField("TextCursorColor"),
          selectionColor:
              ClientTheme.currentTheme.getField("TextSelectionColor"),
          selectionHandleColor:
              ClientTheme.currentTheme.tryGetField("TextHandleColor"),
        ),
      ),
      home: App(
        client: client,
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({required this.client, Key? key}) : super(key: key);
  final TelegramClient client;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    UIManager.screenSizeChange(context);
    return Scaffold(
      drawer: Container(
        width: max(
          MediaQuery.of(context).size.width * 0.20,
          p(300),
        ).toDouble(),
        child: BurgerMenu(
          client: widget.client,
          onThemeChange: () => setState(() {}),
        ),
        color: ClientTheme.currentTheme.getField(
          "BurgerMenu.color",
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            color: ClientTheme.currentTheme.getField("BaseColor"),
            child: TranscluentGesturesStack(
              children: [
                AutorizationRouter(client: widget.client),
                const ContextMenuOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
