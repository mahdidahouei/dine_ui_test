import '../../global/widgets/dine_floating_action_button.dart';
import 'package:flutter/material.dart';

import '../../global/localizations/app_localizations.dart';

class FoodPage extends StatefulWidget {

  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: DineFloatingActionButton(
        text: localizations.translate("book"),
        onPressed: () {},
      ),
    );
  }
}
