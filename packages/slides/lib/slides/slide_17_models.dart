import 'dart:async';
import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/model.dart';
import 'package:flame_3d/parser.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_game.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide17Models extends Slide {
  Slide17Models({super.key}) : super(route: '/slide_17_models');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Models - The Teapot'),
      const SlideGame(game: _TeapotModel.new),
    ];
  }
}

class _TeapotModel extends FlameGame {
  _TeapotModel()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: CameraComponent3D(
          position: Vector3.all(8),
          target: Vector3.zero(),
        ),
      );

  @override
  FutureOr<void> onLoad() async {
    final teapot = await ModelParser.parse('models/teapot.obj');
    world.addAll([
      LightComponent.ambient(
        intensity: 10.0,
      ),
      _RotatingLight(),
      ModelComponent(model: teapot),
    ]);
    return super.onLoad();
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
