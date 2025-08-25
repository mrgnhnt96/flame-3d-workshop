import 'dart:async';

import 'package:flame/geometry.dart';
import 'package:flame/palette.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d/resources.dart';

class TemplateGame extends FlameGame3D {
  late MeshComponent cube;

  TemplateGame()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: CameraComponent3D(
          position: Vector3(10, 10, 10),
        ),
      );

  @override
  FutureOr<void> onLoad() async {
    world.addAll([
      cube = MeshComponent(
        mesh: CuboidMesh(
          size: Vector3.all(8.0),
          material: SpatialMaterial()..albedoColor = BasicPalette.magenta.color,
        ),
      ),
    ]);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    cube.transform.rotation *= Quaternion.euler(0, dt % tau, 0);
  }
}
