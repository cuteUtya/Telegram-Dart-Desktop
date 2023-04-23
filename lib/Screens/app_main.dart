import 'package:flutter/material.dart';
import 'package:myapp/Screens/app_main_desktop.dart';
import 'package:myapp/Screens/app_main_mobile.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/UIManager.dart';

class AppMain extends StatefulWidget {
  const AppMain({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;
  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //start receive updates only if all UI elements was inited
      Future.delayed(Duration.zero)
          .then((value) => widget.client.startReceiveUpdates());
    });

    return UIManager.useDesktopLayout
        ? AppMainDesktop(
            client: widget.client,
          )
        : AppMainMobile(
            client: widget.client,
          );
  }
}
