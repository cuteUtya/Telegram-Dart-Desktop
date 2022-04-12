import 'package:flutter/material.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/widget_hider.dart';

class MessageInfoOverlayDisplay extends StatelessWidget {
  const MessageInfoOverlayDisplay({
    Key? key,
    required this.content,
    required this.info,
  }) : super(key: key);

  final Widget content;
  final Widget info;

  @override
  Widget build(BuildContext context) {
    GlobalKey<WidgetHiderState> hiderKey = GlobalKey<WidgetHiderState>();
    return MouseRegion(
      onEnter: (_) => hiderKey.currentState?.show(),
      onExit: (_) => hiderKey.currentState?.hide(),
      child: Stack(
        children: [
          content,
          Positioned(
            right: 6,
            bottom: 6,
            child: WidgetHider(
              hiddenOnInit: !UIManager.isMobile,
              key: hiderKey,
              child: info,
            ),
          ),
        ],
      ),
    );
  }
}
