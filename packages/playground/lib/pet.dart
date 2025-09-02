import 'dart:math';

import 'package:flame/components.dart' show HasGameReference, KeyboardHandler;
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d/resources.dart';
import 'package:flame_3d_workshop_playground/control_type.dart';
import 'package:flame_3d_workshop_playground/player.dart';
import 'package:flame_3d_workshop_playground/playground.dart';
import 'package:flame_3d_workshop_playground/util/keyboard_utils.dart';
import 'package:flame_3d_workshop_playground/util/mouse.dart';
import 'package:flutter/services.dart';

class Pet extends MeshComponent
    with HasGameReference<Playground>, KeyboardHandler {
  final Player player;

  Pet({required Vector3 position, required this.player})
    : super(
        position: position,
        mesh: CuboidMesh(
          size: Vector3(0.5, 0.5, 0.5),
          material: SpatialMaterial(
            albedoTexture: ColorTexture(BasicPalette.cyan.color),
          ),
        ),
      );

  @override
  void update(double dt) {
    super.update(dt);
    if (player.position.distanceTo(position) > 2.0) {
      position.add((player.position - position).normalized() * dt);
    }
  }
}
