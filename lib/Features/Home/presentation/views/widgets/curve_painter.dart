
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path = Path();
    path.moveTo(0, size.height); // البداية من الزاوية السفلى اليسرى
    path.quadraticBezierTo(
        size.width / 2, 0, size.width, size.height); // المنحنى
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}