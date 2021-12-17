import 'package:flutter/material.dart';

import 'package:dine_test/core/assets/app_svg.dart';
import 'package:dine_test/features/presentation/global/localizations/app_localizations.dart';
import 'package:dine_test/features/presentation/global/widgets/dine_icon_button.dart';

class DineBackButton extends StatelessWidget {
  const DineBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return DineIconButton(
      icon: AppSvg.arrowLeft,
      onTap: () {
        final navigator = Navigator.of(context);
        if (navigator.canPop()) {
          navigator.pop();
        }
      },
      tooltip: localizations.translate("back"),
    );
  }
}
