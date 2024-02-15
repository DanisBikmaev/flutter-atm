import 'dart:math';

import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

enum WaveType { top, bottom }

List<Color> _primaryGradient = [
  ThemeColors.secondary.withAlpha(80),
  ThemeColors.primary.withAlpha(80),
];

List<Color> _secondaryGradient = [
  ThemeColors.secondary.withOpacity(0.8),
  ThemeColors.primary.withOpacity(0.8),
];

CustomConfig _waveConfig = CustomConfig(
  gradientBegin: Alignment.centerLeft,
  gradientEnd: Alignment.centerRight,
  gradients: [
    _primaryGradient,
    _primaryGradient,
    _secondaryGradient,
    _secondaryGradient,
  ],
  durations: [35000, 58000, 54000, 44000],
  heightPercentages: [0.1, 0.3, 0.2, 0.35],
);

CustomConfig _waveSmallConfig = CustomConfig(
  gradientBegin: Alignment.centerLeft,
  gradientEnd: Alignment.centerRight,
  gradients: [
    _primaryGradient,
    _primaryGradient,
    _secondaryGradient,
    _secondaryGradient,
  ],
  durations: [35000, 58000, 54000, 44000],
  heightPercentages: [0.9, 0.9, 0.7, 0.75],
);

class Wave extends StatelessWidget {
  final double waveHeight;
  final WaveType waveType;
  const Wave({
    super.key,
    this.waveHeight = 105,
    this.waveType = WaveType.top,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Transform.rotate(
        angle: WaveType.top == waveType ? pi : 0,
        child: WaveWidget(
          config: orientation == Orientation.portrait
              ? _waveConfig
              : _waveSmallConfig,
          waveAmplitude: 15,
          wavePhase: 20,
          waveFrequency: 1.5,
          size: Size(double.infinity, waveHeight),
        ),
      );
    });
  }
}
