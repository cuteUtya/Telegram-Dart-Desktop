import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libwinmedia/libwinmedia.dart';
import 'package:myapp/Widgets/transcluent_gestures_stack.dart';
import 'package:myapp/global_key_extenstion.dart';
import 'package:myapp/utils.dart';

class ContextMenuOverlay extends StatefulWidget {
  const ContextMenuOverlay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContextMenuOverlayState();
}

class ContextMenuOverlayState extends State<ContextMenuOverlay> {
  final List<_ContextMenuInstanceInfo> _displayedMenus = [];
  static late ContextMenuOverlayState current;
  Size? _lastWindowSize;
  int _key = 0;
  Offset mousePosition = Offset.zero;

  static openMenu(Widget menu, [GlobalKey? placeHolderKey]) => current._openMenu(menu, placeHolderKey);
  static closeMenu(ContextMenuInstanceKey key) => current._closeMenu(key);
  static closeAllMenus() => current._closeAllMenus();

  ContextMenuInstanceKey _openMenu(Widget menu, [GlobalKey? placeHolderKey]) {
    closeAllMenus();
    _key++;
    var cKey = ContextMenuInstanceKey(_key);
    setState(() {
      _displayedMenus.add(
        _ContextMenuInstanceInfo(
          key: cKey,
          menu: menu,
          position: mousePosition,
          childKey: placeHolderKey,
          widgetKey: GlobalKey(),
        ),
      );
    });
    return cKey;
  }

  void _closeMenu(ContextMenuInstanceKey key) {
    for (var obj in _displayedMenus) {
      if (obj.key == key) {
        setState(() => _displayedMenus.remove(obj));
        break;
      }
    }
  }

  void _closeAllMenus() => setState(() => _displayedMenus.clear());

  @override
  Widget build(BuildContext context) {
    current = this;
    return MouseRegion(
      onHover: (pos) {
        mousePosition = pos.position;
      },
      child: LayoutBuilder(
        builder: (_, size) {
          var windowSize = Size(size.maxWidth, size.maxHeight);
          if (_lastWindowSize != windowSize && _lastWindowSize != null) {
            _displayedMenus.clear();
          }
          _lastWindowSize = windowSize;
          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Center(child: Container()),
                onTap: () => _closeAllMenus(),
                onSecondaryTap: () => _closeAllMenus(),
              ),
              Stack(
                children: _displayedMenus.map(
                  (e) {
                    bool useIternalKeyForSizeCalculating = e.childKey == null ||
                        e.childKey?.currentContext.toString().contains("(dirty)") == true ||
                        e.childKey?.currentContext == null;
                    var position = useIternalKeyForSizeCalculating ? e.position : _getWidgetInfo(e.childKey!).position;
                    if (!e.appendKey) {
                      Future.delayed(Duration.zero, () => setState(() => e.appendKey = true));
                    }
                    //on first frame we can't know widget size,
                    //so, we render object in left top corner with opacity 0
                    //that user don't see it (yep, this catches the eye)
                    return Opacity(
                      opacity: e.appendKey ? 1 : 0,
                      child: Container(
                        key: e.widgetKey,
                        margin: EdgeInsets.only(
                          left: clamp(
                              e.appendKey ? position.dx - (e.widgetKey.globalPaintBounds?.width ?? 0) : 0, 0, double.infinity),
                          top: clamp(
                              e.appendKey ? position.dy - (e.widgetKey.globalPaintBounds?.height ?? 0) : 0, 0, double.infinity),
                        ),
                        child: e.menu,
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

_WidgetInfo _getWidgetInfo(_widgetKey) {
  final RenderBox renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox;
  final Size size = renderBox.size;
  final Offset offset = renderBox.localToGlobal(Offset.zero);
  return _WidgetInfo(
    //TODO -15? why?
    position: Offset(offset.dx, offset.dy - 15),
    size: Offset(size.width, size.height),
  );
}

class _WidgetInfo {
  const _WidgetInfo({required this.position, required this.size});
  final Offset size;
  final Offset position;
}

class _ContextMenuInstanceInfo {
  _ContextMenuInstanceInfo({
    required this.key,
    required this.menu,
    required this.position,
    required this.widgetKey,
    this.appendKey = false,
    this.childKey,
  });

  final ContextMenuInstanceKey key;
  final GlobalKey widgetKey;
  final Offset position;
  final Widget menu;
  bool appendKey;
  GlobalKey? childKey;
}

class ContextMenuInstanceKey {
  const ContextMenuInstanceKey(this.key);
  final int key;

  bool operator ==(covariant ContextMenuInstanceKey a) {
    return key == a.key;
  }
}
