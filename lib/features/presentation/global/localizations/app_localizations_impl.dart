part of 'app_localizations.dart';

class AppLocalizationsImpl implements AppLocalizations {
  final Locale _locale;

  AppLocalizationsImpl(this._locale);

  Map<String, String>? _localizedStrings;

  @override
  Future<void> load() async {

    String jsonString = await rootBundle.loadString('assets/lang/${_locale.languageCode}.json');

    _localizedStrings = json.decode(jsonString).cast<String, String>();
  }

  @override
  Locale get locale => _locale;


  @override
  String translate(String key) {
    return _localizedStrings?[key] ?? "NA";
  }
}
