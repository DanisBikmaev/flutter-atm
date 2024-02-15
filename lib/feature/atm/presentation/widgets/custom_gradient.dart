import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
  const CustomGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [ThemeColors.primary, ThemeColors.secondary],
        ),
      ),
    );
  }
}
