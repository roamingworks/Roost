import 'package:flutter/material.dart';
import 'dart:math';
import 'package:frontend/Constants/colors.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress; 

  CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5.0;
    double radius = (size.width - strokeWidth) / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw gray full circle
    Paint grayPaint = Paint()
      ..color = ColorTheme.textSecondary
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, grayPaint);

    // Draw red arc (partial)
    Paint redPaint = Paint()
      ..color = ColorTheme.appTertiary
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2; // Top
    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      redPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}