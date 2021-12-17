import 'package:flutter/material.dart';

import 'package:dine_test/features/presentation/global/constants.dart';

class DineTabBar extends StatelessWidget implements PreferredSizeWidget {
  static const _kDineTabBarHeight = kDineToolbarHeight - 24;

  const DineTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SizedBox(
      height: _kDineTabBarHeight,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Transform(
            transform: Matrix4.translationValues(0.0, 12.0, 1.0),
            child: TabBar(
              indicator: _CircleTabIndicator(
                lineWidth: 28.0,
                color: themeData.primaryColor,
              ),
              labelStyle: themeData.textTheme.subtitle1,
              labelColor: themeData.selectedRowColor,
              unselectedLabelColor: themeData.unselectedWidgetColor,
              unselectedLabelStyle: themeData.textTheme.subtitle2,
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_kDineTabBarHeight);
}

class _CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  _CircleTabIndicator({
    required Color color,
    double strokeWidth = 2.0,
    required lineWidth,
  }) : _painter = _CirclePainter(color, strokeWidth, lineWidth);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double strokeWidth;
  final double lineWidth;

  _CirclePainter(Color color, this.strokeWidth, this.lineWidth)
      : _paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset leftOffset = offset +
        Offset(cfg.size!.width / 2 - lineWidth / 2,
            cfg.size!.height - (strokeWidth / 2) - 5);
    final Offset rightOffset = offset +
        Offset(cfg.size!.width / 2 + lineWidth / 2,
            cfg.size!.height - (strokeWidth / 2) - 5);
    canvas.drawCircle(leftOffset, strokeWidth / 2, _paint);
    canvas.drawLine(leftOffset, rightOffset, _paint);
    canvas.drawCircle(rightOffset, strokeWidth / 2, _paint);
  }
}
