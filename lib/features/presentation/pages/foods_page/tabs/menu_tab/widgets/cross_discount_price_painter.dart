import 'package:dine_test/features/presentation/global/themes/app_themes.dart';
import 'package:flutter/material.dart';

class CrossDiscountPricePainter extends CustomPainter {
  final Color? color;
  final double strokeWidth;
  
  CrossDiscountPricePainter( {
    this.color,
    this.strokeWidth = 0.7,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color ?? AppThemes.primaryColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    var path = Path();
    
    path.moveTo(-2.0, size.height - (size.height * 0.15));
    
    path.lineTo(size.width + 2, size.height * 0.15);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
