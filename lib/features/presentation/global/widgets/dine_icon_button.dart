import 'package:flutter/material.dart';

class DineIconButton extends StatelessWidget {
  const DineIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.tooltip,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const borderRadius = BorderRadius.all(
      Radius.circular(16),
    );

    Widget _buildButton() {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        highlightColor: Colors.transparent,
        child: Ink(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: themeData.accentColor,
          ),
          padding: const EdgeInsets.all(7.5),
          child: FittedBox(
            child: icon,
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: (tooltip == null || (tooltip?.isEmpty ?? true))
          ? _buildButton()
          : Tooltip(
              message: tooltip ?? "",
              child: _buildButton(),
            ),
    );
  }
}
