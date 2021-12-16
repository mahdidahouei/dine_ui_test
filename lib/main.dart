import 'package:dine_test/features/presentation/pages/foods_page/foods_page.dart';
import 'package:flutter/material.dart';

import 'features/presentation/global/localizations/app_localizations.dart';
import 'features/presentation/global/themes/app_themes.dart';

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
      initialRoute: FoodsPage.routeName,
      routes: {
        FoodsPage.routeName: (context) => const FoodsPage(),
      },
    );
  }
}
