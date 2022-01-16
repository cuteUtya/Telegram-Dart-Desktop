import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'dart:io' as io;

class Rlottie {
  static RLottieInfo getRLottieInfo(String animPath) {
    var json = utf8.decode(unzipTGS(io.File(animPath).readAsBytesSync()));
    var hMatch = RegExp("\"h\":.{1,5},").firstMatch(json);
    var h =
        hMatch == null ? "\"h\":0," : json.substring(hMatch.start, hMatch.end);
    h = h.substring(4, h.length - 1);
    var wMatch = RegExp("\"w\":.{1,5},").firstMatch(json);
    var w =
        wMatch == null ? "\"w\":0," : json.substring(wMatch.start, wMatch.end);
    w = w.substring(4, w.length - 1);

    var lastFrameMatch = RegExp("\"op\":(.{1,6}),").firstMatch(json);
    var lastFrame = lastFrameMatch == null
        ? "\"op\":60"
        : json.substring(lastFrameMatch.start, lastFrameMatch.end);
    lastFrame = lastFrame.substring(5, lastFrame.length - 1);

    var firstFrameMatch = RegExp("\"ip\":(.{1,6}),").firstMatch(json);
    var firstFrame = firstFrameMatch == null
        ? "\"ip\":60"
        : json.substring(firstFrameMatch.start, firstFrameMatch.end);
    firstFrame = firstFrame.substring(5, firstFrame.length - 1);

    var frameRateMatch = RegExp("\"fr\":(.{1,3}),").firstMatch(json);
    var frameRate = (frameRateMatch == null
        ? "\"fr\":60,"
        : json.substring(frameRateMatch.start, frameRateMatch.end));
    frameRate = frameRate.substring(5, frameRate.length - 1);

    var framesCount = int.parse(lastFrame) - int.parse(firstFrame);

    return RLottieInfo(
        duration: framesCount / int.parse(frameRate),
        width: double.parse(w),
        height: double.parse(h));
  }

  static Uint8List unzipTGS(Uint8List tgs) =>
      Uint8List.fromList(io.gzip.decode(tgs.toList()));

  static Widget file(
      {Key? key,
      required String path,
      bool loadSync = false,
      Function()? onClick,
      Widget loadPlaceholder = const SizedBox.shrink(),
      PlayBehavior behavior = PlayBehavior.loop,
      int? fitzpatrickType,
      double? width,
      double? height,
      Alignment? aligment,
      BoxFit? fit,
      FrameRate? frameRate,
      bool reverse = false,
      LottieDelegates? lottieDelegates,
      LottieOptions? options,
      bool addRepaintBoundary = false}) {
    var file = io.File(path);
    if (loadSync) {
      return _Rlottie(
        bytes: unzipTGS(file.readAsBytesSync()),
        behavior: behavior,
        onClick: onClick,
        fitzpatrickType: fitzpatrickType,
        width: width,
        height: height,
        aligment: aligment,
        fit: fit,
        frameRate: frameRate,
        reverse: reverse,
        lottieDelegates: lottieDelegates,
        options: options,
        addRepaintBoundary: addRepaintBoundary,
      );
    } else {
      return FutureBuilder(
          future: file.readAsBytes(),
          builder: (context, builder) {
            if (builder.hasData) {
              return _Rlottie(
                bytes: unzipTGS(builder.data as Uint8List),
                behavior: behavior,
                fitzpatrickType: fitzpatrickType,
                onClick: onClick,
                width: width,
                height: height,
                aligment: aligment,
                fit: fit,
                frameRate: frameRate,
                reverse: reverse,
                lottieDelegates: lottieDelegates,
                options: options,
                addRepaintBoundary: addRepaintBoundary,
              );
            }
            return loadPlaceholder;
          });
    }
  }
}

class _Rlottie extends StatefulWidget {
  const _Rlottie(
      {Key? key,
      required this.bytes,
      this.behavior = PlayBehavior.loop,
      this.fitzpatrickType,
      this.width,
      this.height,
      this.aligment,
      this.onClick,
      this.fit,
      this.frameRate,
      this.reverse = false,
      this.lottieDelegates,
      this.options,
      this.addRepaintBoundary = false})
      : super(key: key);

  final Uint8List bytes;
  final PlayBehavior behavior;
  final int? fitzpatrickType;
  final double? width;
  final double? height;
  final Alignment? aligment;
  final Function()? onClick;
  final BoxFit? fit;
  final FrameRate? frameRate;
  final bool reverse;
  final LottieDelegates? lottieDelegates;
  final LottieOptions? options;
  final bool addRepaintBoundary;

  @override
  State<StatefulWidget> createState() => RlottieState();
}

class RlottieState extends State<_Rlottie> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    switch (widget.behavior) {
      case PlayBehavior.loop:
        return _build();
      case PlayBehavior.playOnClick:
        _counter.compareTo(_counter);
        var renderWidget = GestureDetector(
          onTap: () {
            if (widget.onClick != null) {
              widget.onClick!();
            }
            setState(() => _counter++);
          },
          child: _build(_counter != 0, UniqueKey()),
        );
        return renderWidget;
      case PlayBehavior.playOnHover:
        return ClickableObject(builder: (hover) => _build(hover));
    }
  }

  Widget _build([bool animate = true, Key? key]) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Lottie.memory(
          widget.bytes,
          key: key,
          animate: animate,
          repeat: widget.behavior == PlayBehavior.loop,
          width: widget.width,
          height: widget.height,
          alignment: widget.aligment,
          fit: widget.fit,
          frameRate: widget.frameRate,
          reverse: widget.reverse,
          delegates: widget.lottieDelegates,
          options: widget.options,
          addRepaintBoundary: widget.addRepaintBoundary,
        ));
  }
}

class RLottieInfo {
  const RLottieInfo(
      {required this.duration, required this.height, required this.width});
  final double duration;
  final double width;
  final double height;
}

enum PlayBehavior {
  loop,
  playOnClick,
  playOnHover,
}
