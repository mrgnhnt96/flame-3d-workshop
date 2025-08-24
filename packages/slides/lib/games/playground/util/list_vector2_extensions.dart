import 'dart:ui';

import 'package:flame/components.dart';

extension ListVector2Extensions on List<Vector2> {
  double get minX => reduce((a, b) => a.x < b.x ? a : b).x;
  double get minY => reduce((a, b) => a.y < b.y ? a : b).y;
  double get maxX => reduce((a, b) => a.x > b.x ? a : b).x;
  double get maxY => reduce((a, b) => a.y > b.y ? a : b).y;

  Rect get boundingBox {
    if (isEmpty) {
      return Rect.zero;
    }

    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }
}
