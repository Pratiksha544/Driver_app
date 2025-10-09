import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);
    for (double x = 0; x < size.width; x += 20) {
      for (double y = 0; y < size.height; y += 20) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final List<double> dashArray;
  final Radius radius;

  const DashedContainer({
    super.key,
    required this.child,
    this.color = Colors.blue,
    this.strokeWidth = 1.0,
    this.dashArray = const [3, 3],
    this.radius = const Radius.circular(5),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: DashedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        dashArray: dashArray,
        radius: radius,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashArray;
  final Radius radius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashArray,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));
    final Path dashedPath = _dashPath(path, dashArray);
    canvas.drawPath(dashedPath, paint);
  }

  Path _dashPath(Path source, List<double> dashArray) {
    final Path dashedPath = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      int index = 0;
      while (distance < metric.length) {
        final double length = dashArray[index % dashArray.length];
        if (index % 2 == 0) {
          dashedPath.addPath(
            metric.extractPath(distance, (distance + length).clamp(0.0, metric.length)),
            Offset.zero,
          );
        }
        distance += length;
        index++;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}