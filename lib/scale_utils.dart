import 'package:myapp/UIManager.dart';

ScaleConfig get config => UIManager.isMobile
    ? const ScaleConfig(fontRatio: 1.15, pointRatio: 1.15)
    : const ScaleConfig(fontRatio: 1.1, pointRatio: 1.1);

double font(double base) {
  return base * config.fontRatio;
}

double p(double base) {
  return base * config.pointRatio;
}

class ScaleConfig {
  const ScaleConfig({required this.fontRatio, required this.pointRatio});
  final double fontRatio;
  final double pointRatio;
}
