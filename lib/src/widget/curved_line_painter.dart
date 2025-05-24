import 'package:flutter/material.dart';

class CurvedLinePainter extends CustomPainter {
  final Color color;
  final bool showCurvedLine;
  final double lineWidth;
  final double lineOpacity;

  CurvedLinePainter({
    super.repaint,
    required this.color,
    this.showCurvedLine = true,
    this.lineWidth = 4.0,
    this.lineOpacity = 0.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (!showCurvedLine) return;

    const lineSize = 60.0;
    final topLeftPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [
              color.withValues(alpha: lineOpacity),
              color.withValues(alpha: lineOpacity),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round;

    final bottomRightPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [
              color.withValues(alpha: 0.5),
              color.withValues(alpha: 0.5),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);
    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );
    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CurvedLinePainter oldDelegate) => true;
}
