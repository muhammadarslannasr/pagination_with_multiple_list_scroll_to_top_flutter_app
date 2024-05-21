import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomPainterExample extends StatelessWidget {
  const CustomPainterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Painter'),
      ),
      body: Column(
        children: [
          CustomPaint(
            size: const Size(100, 10),
            painter: LinePainter(),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.polygon;
    final points = [const Offset(0, 10), const Offset(100, 10), const Offset(110, -2)];
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
