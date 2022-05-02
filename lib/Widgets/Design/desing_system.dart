import 'package:myapp/UIManager.dart';
import 'package:myapp/Widgets/Design/desing_components.dart';
import 'package:myapp/Widgets/Design/desing_layout.dart';
import 'package:myapp/Widgets/Design/desing_typography.dart';
import 'package:myapp/Widgets/Design/desing_colors.dart';

abstract class DesingSystem {
  abstract ColorData colors;
  abstract TypographyData typography;
  abstract LayoutData layout;
  abstract ComponentsData components;
}

bool get isMobile => UIManager.isMobile;
