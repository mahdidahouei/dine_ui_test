import 'package:dine_test/web_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'features/presentation/global/localizations/app_localizations.dart';
import 'features/presentation/global/themes/app_themes.dart';
import 'features/presentation/pages/main_page/main_page.dart';

void main() {
  runApp(const DineApp());
}

class DineApp extends StatelessWidget {
  const DineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dine',
      theme: AppThemes.light,
      supportedLocales: AppSupportedLocales.all,
      localizationsDelegates: AppLocalizations.delegates,
      localeResolutionCallback: AppLocalizations.localeResolutionCallback,
      builder: (context, app) {
        return Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) =>
                (kIsWeb
                    ? DineWebApp(
                        app: app,
                      )
                    : app) ??
                const SizedBox.shrink(),
          ),
        );
      },
      initialRoute: MainPage.routeName,
      routes: {
        MainPage.routeName: (context) => const MainPage(),
      },
    );
  }
}
