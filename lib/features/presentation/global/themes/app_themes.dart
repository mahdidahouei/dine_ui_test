import 'package:flutter/material.dart';

import 'app_fonts.dart';

abstract class AppThemes {
  static const primaryColor = Color(0xffEF4164);
  static const accentColor = Color(0x63EF4164);
  static const backgroundColor = Color(0x19EF4164);
  static const disabledColor = Color(0x84292D32);
  static const scaffoldBackgroundColor = Colors.white;
  static const shadowColor = Color(0x3f000000);

  static ThemeData _baseTheme({
    Brightness brightness = Brightness.light,
  }) =>
      ThemeData(
        brightness: brightness,
        textTheme: AppFonts.textTheme,
        accentColor: accentColor,
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
        disabledColor: disabledColor,
        unselectedWidgetColor: disabledColor,
        selectedRowColor: Colors.black,
        splashColor: Colors.black12,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: AppFonts.montserrat,
        shadowColor: shadowColor,
      );

  /// light theme
  static ThemeData light = _baseTheme();

  /// dark theme
  static ThemeData dark = _baseTheme(
    brightness: Brightness.dark,
  );
}
