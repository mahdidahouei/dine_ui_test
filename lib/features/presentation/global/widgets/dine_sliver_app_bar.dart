import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import 'dine_back_button.dart';

class DineSliverAppBar extends StatelessWidget {
  const DineSliverAppBar(
      {Key? key, required this.backgroundImages, this.bottom})
      : super(key: key);

  final List<Widget> backgroundImages;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        backgroundImages: backgroundImages,
        bottom: bottom,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({required this.backgroundImages, this.bottom});

  final List<Widget> backgroundImages;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _HeaderDelegateChild(
      shrinkOffset: shrinkOffset,
      maxHeight: maxExtent,
      minHeight: minExtent,
      backgroundImages: backgroundImages,
      bottom: bottom,
    );
  }

  @override
  double get maxExtent => 430;

  @override
  double get minExtent => bottom != null
      ? kDineToolbarHeight + bottom!.preferredSize.height
      : kDineToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _HeaderDelegateChild extends StatefulWidget {
  final double shrinkOffset;
  final List<Widget> backgroundImages;
  final double maxHeight;
  final double minHeight;
  final PreferredSizeWidget? bottom;

  const _HeaderDelegateChild(
      {Key? key,
      required this.shrinkOffset,
      required this.backgroundImages,
      required this.maxHeight,
      required this.minHeight,
      required this.bottom})
      : super(key: key);

  @override
  State<_HeaderDelegateChild> createState() => _HeaderDelegateChildState();
}

class _HeaderDelegateChildState extends State<_HeaderDelegateChild> {
  late PageController _imageSliderController;

  @override
  void initState() {
    super.initState();
    _imageSliderController = PageController();
  }

  @override
  void dispose() {
    _imageSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);

    final animationValue = widget.shrinkOffset / widget.maxHeight;

    final reverseAnimationValue = max((1 - (animationValue * 2)), 0.0);

    final opacityAnimationValue =
        max(0.0, ((1 - reverseAnimationValue) * 2.5) - 1.5);

    // debugPrint("shrinkOffset: ${widget.shrinkOffset}");
    // debugPrint("animationValue: $animationValue");
    // debugPrint("opacityAnimationValue: $opacityAnimationValue");

    final radius = Radius.circular(reverseAnimationValue * 24.0);

    return Stack(
      children: [
        Positioned.fill(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              height: widget.maxHeight,
              width: mediaQueryData.size.width,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      for (var image in widget.backgroundImages)
                        FittedBox(
                          fit: BoxFit.cover,
                          child: image,
                        ),
                    ],
                    controller: _imageSliderController,
                  ),
                  Positioned(
                    bottom: 32,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 99,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black
                                .withOpacity(reverseAnimationValue * 0.72),
                            Colors.black.withOpacity(0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: widget.bottom!.preferredSize.height + 16.0),
                      child: SmoothPageIndicator(
                        controller: _imageSliderController,
                        count: widget.backgroundImages.length,
                        effect: WormEffect(
                          activeDotColor: themeData.primaryColor,
                          dotColor: Colors.white,
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          spacing: 4.0,
                        ),
                        onDotClicked: (index) =>
                            _imageSliderController.animateToPage(
                          index,
                          duration: kPageAnimationDuration,
                          curve: kResizeAnimationCurve,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (opacityAnimationValue > 0)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(opacityAnimationValue * 0.5),
              ),
            ),
          ),
        PositionedDirectional(
          top: mediaQueryData.padding.top + (kIsWeb ? 28.0 : 16.0),
          start: 16.0,
          child: const DineBackButton(),
        ),
        if (widget.bottom != null)
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: -1.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: radius,
              ),
              child: Material(
                color: themeData.scaffoldBackgroundColor,
                elevation: 0.0,
                child: widget.bottom ?? const SizedBox.shrink(),
              ),
            ),
          ),
      ],
    );
  }
}
