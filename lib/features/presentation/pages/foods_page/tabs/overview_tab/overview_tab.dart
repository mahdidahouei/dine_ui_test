import 'package:dine_test/features/presentation/global/localizations/app_localizations.dart';
import 'package:flutter/material.dart';


class OverviewTab extends StatelessWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Text(localizations.translate("overview")),
    );
  }
}
