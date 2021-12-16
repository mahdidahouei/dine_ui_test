import 'package:dine_test/core/assets/app_svg.dart';
import 'package:dine_test/features/presentation/global/localizations/app_localizations.dart';

import '../../global/widgets/dine_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatefulWidget {
  static const routeName = "/foods";

  const FoodsPage({Key? key}) : super(key: key);

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
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
