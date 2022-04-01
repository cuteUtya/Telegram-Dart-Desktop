import 'package:flutter/material.dart';
import 'package:myapp/State%20managment/ui_events.dart';
import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Chat/chat_display.dart';
import 'package:myapp/Widgets/background_manager_desktop.dart';
import 'package:myapp/Widgets/left%20panel/left_panel.dart';
import 'package:myapp/Widgets/transcluent_gestures_stack.dart';
import 'package:myapp/tdlib/client.dart';

class AppMainDesktop extends StatefulWidget {
  const AppMainDesktop({
    Key? key,
    required this.client,
  }) : super(key: key);

  final TelegramClient client;

  @override
  State<AppMainDesktop> createState() => _AppMainDesktopState();
}

class _AppMainDesktopState extends State<AppMainDesktop> {
  double resizePX = 0;
  bool startResize = false;
  bool down = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width *
                  (UIManager.isMobile ? 0.4 : 0.25) +
              resizePX,
          child: LeftPanel(
            client: widget.client,
          ),
        ),
        Flexible(
          child: Stack(
            children: [
              DesktopBackgroundManager(client: widget.client),
              StreamBuilder(
                stream: UIEvents.selectedChat(),
                initialData: const <int>[],
                builder: (_, data) => (data.data as List<int>).isEmpty
                    ? const SizedBox()
                    : ChatDisplay(
                        client: widget.client,
                        chatId: (data.data as List<int>).last,
                        onChatRevert: () => UIEvents.popChat(widget.client),
                      ),
              ),
              SizedBox(
                width: 3,
                child: GestureDetector(
                  onHorizontalDragUpdate: (pointer) {
                    setState(() => resizePX += pointer.delta.dx);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeColumn,
                    onHover: (pointer) {
                      if (down) {
                        setState(() => resizePX += pointer.delta.dx);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
