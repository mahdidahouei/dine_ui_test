import 'package:flutter/material.dart';

class AppFonts {
  // change this to IRANSans when english language and fonts added
  static const montserrat = "Montserrat";

  static const textsColor = Colors.black;

  static final textTheme = TextTheme(
    headline3: const TextStyle(
      fontSize: 20,
      fontWeight: DineFontWeight.bold,
      color: textsColor,
    ).withZoomFix,
    headline4: const TextStyle(
      fontSize: 16,
      fontWeight: DineFontWeight.regular,
      color: textsColor,
    ).withZoomFix,
    headline5: const TextStyle(
      fontSize: 14,
      fontWeight: DineFontWeight.regular,
      color: textsColor,
    ).withZoomFix,
    subtitle1: const TextStyle(
      fontSize: 18,
      fontWeight: DineFontWeight.semiBold,
      color: textsColor,
    ).withZoomFix,
    subtitle2: const TextStyle(
      fontSize: 18,
      fontWeight: DineFontWeight.regular,
      color: textsColor,
    ).withZoomFix,
    bodyText2: const TextStyle(
      fontSize: 17,
      fontWeight: DineFontWeight.regular,
      color: textsColor,
    ).withZoomFix,
    button: const TextStyle(
      fontSize: 16,
      fontWeight: DineFontWeight.semiBold,
      color: textsColor,
    ).withZoomFix,
    caption: const TextStyle(
      fontSize: 12,
      fontWeight: DineFontWeight.semiBold,
      color: textsColor,
    ).withZoomFix,
    overline: const TextStyle(
      fontSize: 12,
      fontWeight: DineFontWeight.regular,
      color: textsColor,
    ).withZoomFix,
  );
}

abstract class DineFontWeight {
  static const regular = FontWeight.w400;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;

}

extension on TextStyle {
  /// https://github.com/flutter/flutter/issues/65526
  TextStyle get withZoomFix => copyWith(wordSpacing: 0);
}