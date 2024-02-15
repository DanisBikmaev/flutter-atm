import 'package:flutter/material.dart';

class ThemeColors {
  static const Color primary = Color(0xFF3827B4);
  static const Color secondary = Color(0xFF6C18A4);
  static const Color accent = Color(0xFFE61EAD);
  static const Color black = Color(0xFF000000);
  static const Color gray = Color(0xFFA3A2AC);
  static const Color white = Color(0xFFFFFFFF);
  static Color backgroundColor = Color.alphaBlend(
    const Color(0xFF3827B4).withOpacity(0.06),
    const Color(0xFFFFFFFF),
  );
}
