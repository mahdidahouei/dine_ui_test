import 'package:dine_test/features/presentation/global/widgets/dine_selection_buttons.dart';

import '../../../../global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final themeData = Theme.of(context);
    const horizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: horizontalPadding,
          child: Text(
            localizations.translate("menu_title"),
            style: themeData.textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: horizontalPadding,
          child: Text(
            localizations.translate("location"),
            style: themeData.textTheme.headline5,
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: horizontalPadding,
          child: Text(
            localizations.translate("filter_title"),
            style: themeData.textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const DineSelectionButtons<int>(
          items: [
            DineSelectionButtonData(
              title: "35%",
              value: 35,
            ),
            DineSelectionButtonData(
              title: "40%",
              value: 40,
            ),
            DineSelectionButtonData(
              title: "50%",
              value: 50,
            ),
            DineSelectionButtonData(
              title: "55%",
              value: 55,
            ),
            DineSelectionButtonData(
              title: "70%",
              value: 70,
            ),
            DineSelectionButtonData(
              title: "80%",
              value: 80,
            ),
            DineSelectionButtonData(
              title: "85%",
              value: 85,
            ),
            DineSelectionButtonData(
              title: "90%",
              value: 90,
            ),
          ],
        ),
      ],
    );
  }
}
