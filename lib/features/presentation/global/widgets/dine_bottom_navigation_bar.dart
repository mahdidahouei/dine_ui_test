import 'package:flutter/material.dart';

import 'package:dine_test/features/presentation/global/animations/animated_donak_opacity.dart';
import '../constants.dart';

class DineBottomNavigationBar extends StatelessWidget {
  const DineBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
  }) : super(key: key);

  final List<DineBottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      height: kDineBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: themeData.scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: LayoutBuilder(builder: (context, viewPortConstraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: viewPortConstraints.maxWidth / (items.length * 3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < items.length; i++)
                  _DineBottomNavigationTile(
                    item: items[i],
                    onTap: () {
                      onTap?.call(i);
                    },
                    isSelected: i == currentIndex,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _DineBottomNavigationTile extends StatefulWidget {
  const _DineBottomNavigationTile({
    Key? key,
    required this.item,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final DineBottomNavigationBarItem item;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  _DineBottomNavigationTileState createState() =>
      _DineBottomNavigationTileState();
}

class _DineBottomNavigationTileState extends State<_DineBottomNavigationTile> {
  late bool _isIconButton;

  @override
  void initState() {
    super.initState();
    _isIconButton = !widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      _isIconButton = false;
    } else {
      Future.delayed(const Duration(milliseconds: 210), () {
        setState(() {
          _isIconButton = true;
        });
      });
    }

    final themeData = Theme.of(context);

    const sizeAnimationDuration = Duration(milliseconds: 200);
    const fadeAnimationDuration = Duration(milliseconds: 350);

    const borderRadius = BorderRadius.all(
      Radius.circular(8.0),
    );

    return IndexedStack(
      index: _isIconButton ? 0 : 1,
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: widget.onTap,
          icon: widget.item.disabledIcon,
          tooltip: widget.item.label,
          highlightColor: Colors.transparent,
        ),
        InkWell(
          onTap: widget.onTap,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          child: AnimatedContainer(
            height: null,
            width: null,
            duration: sizeAnimationDuration,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? themeData.backgroundColor
                  : Colors.transparent,
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.all(4.0),
            child: AnimatedSize(
              duration: sizeAnimationDuration,
              reverseDuration: const Duration(milliseconds: 95),
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: fadeAnimationDuration,
                    child: widget.isSelected
                        ? widget.item.enabledIcon
                        : widget.item.disabledIcon,
                  ),
                  AnimatedDineOpacity(
                    show: widget.isSelected,
                    duration: fadeAnimationDuration,
                    curve: const Interval(0.66, 1.0),
                    reverseDuration: const Duration(milliseconds: 5),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 4.0),
                      child: Text(
                        widget.item.label,
                        style: themeData.textTheme.caption!.apply(
                          color: themeData.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DineBottomNavigationBarItem {
  final Widget enabledIcon;
  final Widget disabledIcon;
  final String label;

  const DineBottomNavigationBarItem({
    required this.enabledIcon,
    required this.disabledIcon,
    required this.label,
  });
}
