import 'package:flutter/material.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';
import 'dart:io' as io;
import 'package:myapp/tdlib/td_api.dart';

class BakgroundDisplay extends StatelessWidget {
  const BakgroundDisplay(
      {Key? key, required this.background, required this.client})
      : super(key: key);
  final Background background;
  final TelegramClient client;
  @override
  Widget build(BuildContext context) {
    switch (background.type.runtimeType) {
      case BackgroundTypeWallpaper:
        return FileImageDisplay(
            id: background.document!.document!.id!, client: client);
      case BackgroundTypeFill:
        if ((background.type as BackgroundTypeFill).fill
            is BackgroundFillFreeformGradient) {
          var colors = ((background.type as BackgroundTypeFill).fill!
                  as BackgroundFillFreeformGradient)
              .colors!
              .map((n) => Color(n))
              .toList();
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: colors,
                      transform: const GradientRotation(50 * 3.14 / 180))));
        }
    }

    return Container(color: Colors.green.shade100);
  }

  Widget _buildImage(String path) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: FileImage(io.File(path)))));
}
