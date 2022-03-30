import 'dart:typed_data';
import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/Themes%20engine/theme_interpreter.dart';
import 'package:myapp/Widgets/file_image_display.dart';
import 'package:myapp/Widgets/remote_file_builder.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:myapp/Widgets/backgrounds/background_fill.dart';

class BackgroundPatternDisplay extends StatelessWidget {
  const BackgroundPatternDisplay({
    Key? key,
    required this.pattern,
    required this.client,
    required this.file,
  }) : super(key: key);

  final BackgroundTypePattern pattern;
  final TelegramClient client;
  final Document file;

  @override
  Widget build(BuildContext context) {
    pattern.isInverted =
        ClientTheme.currentTheme.environmentVariables["theme"]!() == "dark";

    return LayoutBuilder(
      builder: (_, box) {
        Widget svgWidget = RemoteFileBuilder(
          builder: (_, path) {
            var file = io.File(path);
            return FutureBuilder(
              future: file.readAsBytes(),
              builder: (_, data) {
                if (data.hasData) {
                  var bytes = Uint8List.fromList(
                    io.gzip.decode((data.data as Uint8List).toList()),
                  );
                  var intensity = pattern.intensity! / 100;
                  var colors =
                      BackgroundFillDisplay.getColorsFromFill(pattern.fill!)
                          .map((e) => e.withOpacity(intensity))
                          .toList();

                  var fillColor = Colors.black.withOpacity(intensity);
                  if (colors.length == 1) colors.add(colors[0]);

                  var gradient = LinearGradient(
                    begin: const Alignment(-1, 0.5),
                    end: const Alignment(1, -0.5),
                    colors:
                        pattern.isInverted! ? colors : [fillColor, fillColor],
                  );

                  return FittedBox(
                    fit: BoxFit.fill,
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: box.maxWidth,
                      height: box.maxHeight,
                      child: ShaderedSVG(
                        image: bytes,
                        shaderCallback: (rect) => gradient.createShader(rect),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            );
          },
          fileId: file.document!.id!,
          client: client,
        );

        return Stack(
          children: [
            BackgroundFillDisplay(
              fill: pattern.isInverted!
                  ? BackgroundFillSolid(color: Colors.black.value)
                  : pattern.fill!,
            ),
            svgWidget,
          ],
        );
      },
    );
  }
}

class ShaderedSVG extends StatefulWidget {
  const ShaderedSVG({
    Key? key,
    required this.image,
    required this.shaderCallback,
    this.blendMode = BlendMode.srcIn,
  }) : super(key: key);
  final Uint8List image;
  final Shader Function(Rect)? shaderCallback;
  final BlendMode blendMode;

  @override
  State<StatefulWidget> createState() => ShaderedSVGState();
}

class ShaderedSVGState extends State<ShaderedSVG> {
  Widget? _image;

  void loadImage() async {
    var svgRoot =
        await svg.fromSvgBytes(widget.image, "${widget.image.length}");
    var picture = svgRoot.toPicture();
    var image = await picture.toImage(
      svgRoot.viewport.viewBox.width.toInt(),
      svgRoot.viewport.viewBox.height.toInt(),
    );
    setState(
      () => _image = RawImage(
        image: image,
        repeat: ImageRepeat.repeatX,
      ),
    );
  }

  @override
  void initState() {
    loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_image == null) {
      return const SizedBox();
    }

    return Container(
      child: widget.shaderCallback == null
          ? _image
          : ShaderMask(
              blendMode: widget.blendMode,
              shaderCallback: widget.shaderCallback!,
              child: _image,
            ),
    );
  }
}
