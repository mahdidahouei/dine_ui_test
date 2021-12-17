import 'package:flutter/material.dart';

import '../book_saved_page/book_saved_page.dart';
import '../foods_page/food_page.dart';
import '../profile_page/profile_page.dart';
import '../../../../core/assets/app_svg.dart';
import '../../global/localizations/app_localizations.dart';
import '../../global/widgets/dine_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/foods";

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  late List<Widget> pages = const [
    BookSavedPage(),
    FoodPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: DineBottomNavigationBar(
        items: [
          DineBottomNavigationBarItem(
            enabledIcon: AppSvg.bookSaved,
            disabledIcon: AppSvg.bookSavedDisabled,
            label: localizations.translate("book"),
          ),
          DineBottomNavigationBarItem(
            enabledIcon: AppSvg.reserve,
            disabledIcon: AppSvg.reserveDisabled,
            label: localizations.translate("browse"),
          ),
          DineBottomNavigationBarItem(
            enabledIcon: AppSvg.profile,
            disabledIcon: AppSvg.profileDisabled,
            label: localizations.translate("account"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
