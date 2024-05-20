import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final double strokeWidth; // 宽度
  final Color insideColor; // 颜色

  RingPainter({
    this.strokeWidth = 20.0,
    this.insideColor = Colors.yellow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制内部圆环
    final innerPaint = Paint()
      ..color = insideColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        size.width / 2 - strokeWidth / 2, innerPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // 如果绘制内容没有改变，则返回false
  }
}
