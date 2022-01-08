import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Widgets/clickable_object.dart';
import 'dart:io' as io;

class Rlottie {
  static Widget file(
      {Key? key,
      required String path,
      bool loadSync = false,
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
    Uint8List unzipTGS(Uint8List tgs) =>
        Uint8List.fromList(io.gzip.decode(tgs.toList()));

    var file = io.File(path);
    if (loadSync) {
      return _Rlottie(
        bytes: unzipTGS(file.readAsBytesSync()),
        behavior: behavior,
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
        var widget = GestureDetector(
          onTap: () {
            setState(() => _counter++);
          },
          child: _build(_counter != 0, UniqueKey()),
        );
        return widget;
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

enum PlayBehavior {
  loop,
  playOnClick,
  playOnHover,
}
