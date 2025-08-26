import 'package:flame/palette.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d/resources.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_game.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide10FirstCube extends Slide {
  Slide10FirstCube({super.key}) : super(route: '/slide_10_first_cube');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Our First Cube!'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.0,
        children: [
          SlideText.code('''
class _FirstCubeGame extends FlameGame3D {
  _FirstCubeGame() : super(
    world: World3D(clearColor: ...),
    camera: CameraComponent3D(
      position: Vector3.all(8),
    ),
  );

  @override
  Future<void> onLoad() async {
    world.addAll([
      MeshComponent(
        mesh: CuboidMesh(
          size: Vector3.all(2.0),
          material: SpatialMaterial(albedoColor: ...),
        ),
      ),
    ]);
    return super.onLoad();
  }
}
          '''),
          const SlideGame(game: _FirstCubeGame.new),
        ],
      ),
    ];
  }
}

class _FirstCubeGame extends FlameGame3D {
  _FirstCubeGame()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: CameraComponent3D(
          position: Vector3.all(8),
        ),
      );

  @override
  Future<void> onLoad() async {
    world.addAll([
      MeshComponent(
        mesh: CuboidMesh(
          size: Vector3.all(2.0),
          material: SpatialMaterial(albedoColor: BasicPalette.white.color),
        ),
      ),
    ]);
    return super.onLoad();
  }
}
