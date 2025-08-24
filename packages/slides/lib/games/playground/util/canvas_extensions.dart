import 'dart:ui';

import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';

extension CanvasExtensions on Canvas {
  void renderLine(Vector2 p1, Vector2 p2, Paint paint) {
    drawLine(p1.toOffset(), p2.toOffset(), paint);
  }

  void renderArrowTip({
    required Vector2 point,
    required Vector2 direction,
    required Paint paint,
    double size = 16,
    double openingAngle = tau / 8,
  }) {
    Vector2 tipEnd(double angle) {
      return point + (direction.normalized()..rotate(angle)) * size;
    }

    final left = tipEnd(openingAngle / 2);
    final right = tipEnd(-openingAngle / 2);

    renderLine(point, left, paint);
    renderLine(point, right, paint);
  }
}
