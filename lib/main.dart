import 'dart:math';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:myapp/Links%20utils/linksOpener.dart';
import 'package:myapp/Screens/autorization_router.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Themes engine/theme_interpreter.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/stream_builder_wrapper.dart';
import 'package:myapp/Widgets/burger_menu.dart';
import 'package:myapp/scale_utils.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';

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
    StreamBuilderWrapper.init(widget.client);
    return ExcludeSemantics(
      child: SafeArea(
        child: Scaffold(
          drawer: Container(
            width: UIManager.useDesktopLayout
                ? max(
                    MediaQuery.of(context).size.width * 0.20,
                    p(300),
                  ).toDouble()
                : MediaQuery.of(context).size.width * 0.75,
            child: BurgerMenu(
              client: widget.client,
              onThemeChange: () => setState(() {}),
            ),
            color: ClientTheme.currentTheme.getField(
              "BurgerMenu.color",
            ),
          ),
          body: Center(
            child: ColoredBox(
              color: ClientTheme.currentTheme.getField("BaseColor"),
              child: AutorizationRouter(
                client: widget.client,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
