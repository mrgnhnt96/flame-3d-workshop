import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/text.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/model.dart';
import 'package:flame_3d/parser.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_game.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide18Animations extends Slide {
  Slide18Animations({super.key}) : super(route: '/slide_18_animations');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Skeletal Animations'),
      const SlideGame(game: _SkeletalAnimations.new),
    ];
  }
}

class _SkeletalAnimations extends FlameGame {
  late ModelComponent skeleton;

  _SkeletalAnimations()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: CameraComponent3D(
          position: Vector3.all(4),
          target: Vector3.zero(),
        ),
      );

  @override
  FutureOr<void> onLoad() async {
    skeleton = ModelComponent(
      model: await ModelParser.parse('models/skeleton.glb'),
    );
    await world.addAll([
      LightComponent.ambient(
        intensity: 10.0,
      ),
      _RotatingLight(),
      skeleton,
    ]);
    camera.viewport.add(_AnimationsBox(skeleton));
    return super.onLoad();
  }
}

class _AnimationsBox extends Component {
  _AnimationsBox(this.skeleton);

  int startIndex = 0;
  static const int displayCount = 20;
  final ModelComponent skeleton;

  @override
  FutureOr<void> onLoad() async {
    await _build();
  }

  Future<void> _build() async {
    final animations = skeleton.animationNames
        .skip(startIndex)
        .take(displayCount)
        .indexed;
    await add(
      ColumnComponent(
        position: Vector2.all(16.0),
        gap: 4.0,
        children: [
          for (final (index, animation) in animations)
            _ClickableBox('<${startIndex + index}>: $animation', () {
              skeleton.playAnimationByName(animation);
            }),
          RowComponent(
            gap: 8.0,
            children: [
              _ClickableBox('Top', () => set(0)),
              _ClickableBox('Up', () => move(-1)),
              _ClickableBox('Down', () => move(1)),
              _ClickableBox(
                'Bottom',
                () => set(skeleton.animationNames.length),
              ),
            ],
          ),
        ],
      ),
    );
    return super.onLoad();
  }

  Future<void> _rebuild() async {
    removeAll(children);
    await _build();
  }

  void set(int index) {
    startIndex = index.clamp(
      0,
      skeleton.animationNames.length - displayCount,
    );
    _rebuild();
  }

  void move(int delta) {
    set(startIndex + delta);
  }
}

class _ClickableBox extends TextComponent with TapCallbacks {
  static final TextRenderer _style = TextPaint(
    style: const TextStyle(
      color: Colors.white,
      fontSize: 8.0,
    ),
  );

  _ClickableBox(String text, this.onTap)
    : super(
        text: text,
        textRenderer: _style,
      );

  final Function() onTap;

  @override
  void onTapDown(TapDownEvent event) {
    onTap();
    super.onTapDown(event);
  }
}

class _RotatingLight extends LightComponent {
  double _angle = 0.0;
  _RotatingLight()
    : super.point(
        intensity: 100.0,
        position: Vector3(0, _height, 0),
      );

  @override
  void update(double dt) {
    _angle = (_angle + dt) % tau;
    position.setValues(_radius * sin(_angle), _height, _radius * cos(_angle));
    super.update(dt);
  }

  static const _radius = 3.0;
  static const _height = 0.75;
}
