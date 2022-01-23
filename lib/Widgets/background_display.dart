import 'package:flutter/material.dart';
import 'package:myapp/Widgets/backgrounds/background_wallpaper.dart';
import 'package:myapp/Widgets/backgrounds/background_fill.dart';
import 'package:myapp/Widgets/backgrounds/background_pattern.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'package:myapp/tdlib/td_api.dart';

class BakgroundDisplay extends StatelessWidget {
  const BakgroundDisplay({
    Key? key,
    required this.background,
    required this.client,
  }) : super(key: key);

  final Background background;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    switch (background.type.runtimeType) {
      case BackgroundTypeWallpaper:
        return BackgroundWallpaperDisplay(
          client: client,
          wallpaper: background.type as BackgroundTypeWallpaper,
          document: background.document!,
        );
      case BackgroundTypeFill:
        return BackgroundFillDisplay(
          fill: (background.type as BackgroundTypeFill).fill!,
        );
      case BackgroundTypePattern:
        return BackgroundPatternDisplay(
          client: client,
          pattern: background.type as BackgroundTypePattern,
          file: background.document!,
        );
    }
    throw Exception("Undefined type of background was used");
  }
}
