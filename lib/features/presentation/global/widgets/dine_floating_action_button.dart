import 'package:dine_test/features/presentation/global/constants.dart';
import 'package:flutter/material.dart';

class DineFloatingActionButton extends StatelessWidget {
  const DineFloatingActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(24.0));
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return Material(
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      color: themeData.primaryColor,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Colors.transparent,
        child: Ink(
          width: (mediaQueryData.size.width - 32) / 2,
          height: kDineButtonHeight,
          child: Center(
            child: Text(
              text,
              style: themeData.textTheme.button!.apply(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
