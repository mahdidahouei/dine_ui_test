import 'dart:math';

import 'package:dine_test/features/presentation/global/animations/animated_donak_opacity.dart';
import 'package:flutter/material.dart';

class DineWebApp extends StatefulWidget {
  final Widget? app;

  const DineWebApp({Key? key, required this.app}) : super(key: key);

  @override
  _DineWebAppState createState() => _DineWebAppState();
}

class _DineWebAppState extends State<DineWebApp> {

  WebAppSizeData _calculateSizeData(Size appSize) {
    final width = appSize.height * 0.75;
    return WebAppSizeData(
      width: min(width, appSize.width),
      height: appSize.height,
      horizontalMargin: max((appSize.width - width) / 2, 0.0),
    );
  }

  Widget _buildWebApp() {
    final mediaQueryData = MediaQuery.of(context);
    final webAppSizeData = _calculateSizeData(mediaQueryData.size);
    final themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white60,
        ),
        MediaQuery(
          data: mediaQueryData.copyWith(
            size: Size(
              webAppSizeData.width,
              webAppSizeData.height,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: themeData.scaffoldBackgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0.0, 8.0),
                  blurRadius: 13.0,
                )
              ],
            ),
            margin: EdgeInsets.symmetric(
              horizontal: webAppSizeData.horizontalMargin,
            ),
            child: widget.app,
          ),
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedDineOpacity(
      duration: const Duration(milliseconds: 750),
      child:
          _buildWebApp(),
    );
  }
}

class WebAppSizeData {
  final double width;
  final double height;
  final double horizontalMargin;

  WebAppSizeData({
    this.width = double.infinity,
    this.height = double.infinity,
    this.horizontalMargin = 0.0,
  });
}
