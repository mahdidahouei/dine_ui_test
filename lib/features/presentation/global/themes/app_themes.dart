import 'package:flutter/material.dart';

import 'app_fonts.dart';

abstract class AppThemes {
  static const primaryColor = Color(0xffEF4164);
  static const accentColor = Color(0x63EF4164);
  static const backgroundColor = Color(0x19EF4164);
  static const disabledColor = Color(0x84292D32);
  static const scaffoldBackgroundColor = Colors.white;

  static ThemeData _baseTheme({
    Brightness brightness = Brightness.light,
  }) =>
      ThemeData(
        brightness: brightness,
        textTheme: AppFonts.textTheme,
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        disabledColor: disabledColor,
        splashColor: Colors.black12,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: AppFonts.montserrat,
      );

  /// light theme
  static ThemeData light = _baseTheme();

  /// dark theme
  static ThemeData dark = _baseTheme(
    brightness: Brightness.dark,
  );
}
