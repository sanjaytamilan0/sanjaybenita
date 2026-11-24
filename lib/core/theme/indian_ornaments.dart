import 'package:flutter/material.dart';
import 'app_colors.dart';

class IndianMandalaPainter extends CustomPainter {
  final Color? color;
  final double strokeWidth;

  IndianMandalaPainter({
    this.color,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? AppColors.antiqueGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw concentric circles
    canvas.drawCircle(center, radius * 0.95, paint);
    canvas.drawCircle(center, radius * 0.82, paint);
    canvas.drawCircle(center, radius * 0.55, paint);
    canvas.drawCircle(center, radius * 0.35, paint);
    canvas.drawCircle(center, radius * 0.15, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class IndianCornerOrnamentPainter extends CustomPainter {
  final Color? color;

  IndianCornerOrnamentPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? AppColors.antiqueGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final fillPaint = Paint()
      ..color = color ?? AppColors.antiqueGold.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.2, size.width * 0.4, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.6, 0, size.height);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);

    final innerPath = Path();
    innerPath.moveTo(6, 6);
    innerPath.lineTo(size.width * 0.7, 6);
    innerPath.quadraticBezierTo(size.width * 0.35, size.height * 0.35, 6, size.height * 0.7);
    innerPath.close();
    canvas.drawPath(innerPath, paint..strokeWidth = 1.0);

    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.25), 3, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
