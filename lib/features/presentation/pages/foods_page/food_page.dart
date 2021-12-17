import 'package:flutter/material.dart';

import '../../../../core/assets/app_image.dart';
import '../../global/localizations/app_localizations.dart';
import '../../global/widgets/dine_floating_action_button.dart';
import '../../global/widgets/dine_sliver_app_bar.dart';
import '../../global/widgets/dine_tab_bar.dart';

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
      body: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              DineSliverAppBar(
                backgroundImages: [
                  AppImage.food,
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.black26,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.teal,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ],
                bottom: DineTabBar(
                  tabs: [
                    Tab(
                      text: localizations.translate("overview"),
                    ),
                    Tab(
                      text: localizations.translate("menu"),
                    ),
                    Tab(
                      text: localizations.translate("reviews"),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Container(),
        ),
      ),
      floatingActionButton: DineFloatingActionButton(
        text: localizations.translate("book"),
        onPressed: () {},
      ),
    );
  }
}
