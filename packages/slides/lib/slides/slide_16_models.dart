import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/model.dart';
import 'package:flame_3d/parser.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_game.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide16Models extends Slide {
  Slide16Models({super.key}) : super(route: '/slide_16_models');

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
      ModelComponent(model: teapot),
    ]);
    return super.onLoad();
  }
}
