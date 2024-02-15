import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.backgroundColor,
      cardTheme: _cardTheme,
      appBarTheme: _appBarTheme,
      filledButtonTheme: _filledButtonThemeData,
    );
  }
}

AppBarTheme _appBarTheme = const AppBarTheme(
  titleTextStyle: TextStyle(color: ThemeColors.white),
  centerTitle: false,
  elevation: 5,
  shadowColor: ThemeColors.black,
);

CardTheme _cardTheme = const CardTheme(
  margin: EdgeInsets.only(bottom: 10),
  color: ThemeColors.white,
  shape: Border(),
  elevation: 0,
);

FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(ThemeColors.accent),
  ),
);
