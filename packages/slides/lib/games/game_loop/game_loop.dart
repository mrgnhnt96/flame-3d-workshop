import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_3d_workshop_playground/util/canvas_extensions.dart';

/// A simple diagram explaining the Flame Game Loop
class GameLoop extends FlameGame {
  GameLoop()
    : super(
        camera: CameraComponent.withFixedResolution(width: 800, height: 600),
      );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final update = DiagramNode(
      label: 'update',
      position: Vector2(size.x / 2 - 200, size.y / 2),
    );
    final render = DiagramNode(
      label: 'render',
      position: Vector2(size.x / 2 + 200, size.y / 2),
    );

    add(update);
    add(render);
    add(
      DiagramArrow(
        from: update.positionOfAnchor(Anchor.topCenter),
        to: render.positionOfAnchor(Anchor.topCenter),
        yDirection: -1,
      ),
    );
    add(
      DiagramArrow(
        from: render.positionOfAnchor(Anchor.bottomCenter),
        to: update.positionOfAnchor(Anchor.bottomCenter),
        yDirection: 1,
      ),
    );
    add(
      MultiPartArrow(
        position: update.positionOfAnchor(Anchor.topLeft),
        points: [
          -Vector2(75, 100),
          -Vector2(50, 25),
          -Vector2(25, 50),
          -Vector2(0, 25),
        ],
      ),
    );
    add(
      TextComponent(
        text: 'User Input',
        position: update.positionOfAnchor(Anchor.topLeft) - Vector2(75, 125),
        anchor: Anchor.centerLeft,
      ),
    );
  }
}

class MultiPartArrow extends PositionComponent {
  MultiPartArrow({
    required super.position,
    required this.points,
  }) : assert(
         points.length >= 2,
         'At least two points are required to draw an arrow',
       );

  final List<Vector2> points;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (var i = 0; i < points.length - 1; i++) {
      canvas.renderLine(points[i], points[i + 1], DiagramArrow._paint);
    }
    canvas.renderArrowTip(
      point: points.last,
      direction: points[points.length - 2] - points.last,
      paint: DiagramArrow._paint,
    );
  }
}

class DiagramArrow extends Component {
  static final Paint _paint = Paint()
    ..color = const Color(0xFFFFFFFF)
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  DiagramArrow({
    required this.from,
    required this.to,
    required this.yDirection,
  });

  final Vector2 from;
  final Vector2 to;
  final double yDirection;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final parabolaMidpoint = (from + to) / 2 + Vector2(0, yDirection * 150);
    // draw a curved line from from to to, passing by the parabola midpoint
    canvas.drawPath(
      Path()
        ..moveTo(from.x, from.y)
        ..quadraticBezierTo(
          parabolaMidpoint.x,
          parabolaMidpoint.y,
          to.x,
          to.y,
        ),
      _paint,
    );

    // render arrow tip
    canvas.renderArrowTip(
      point: to,
      direction: parabolaMidpoint - to,
      paint: _paint,
    );
  }
}

class DiagramNode extends PositionComponent {
  static final Paint _paint = Paint()..color = const Color(0xFF3C00FF);
  static final Vector2 _size = Vector2(200, 100);

  DiagramNode({
    required this.label,
    required super.position,
  }) : super(anchor: Anchor.center, size: _size);

  final String label;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleComponent(size: _size, paint: _paint));
    add(TextComponent(text: label, anchor: Anchor.center, position: _size / 2));
  }
}
