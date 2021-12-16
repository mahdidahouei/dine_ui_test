part of 'app_localizations.dart';

abstract class AppSupportedLocales {

  static const en = Locale("en", "US");

  /// A list of all supported locales, the first Locale is the default
  static const List<Locale> all = [
    en,
  ];
}
