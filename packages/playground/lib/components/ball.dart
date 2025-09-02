import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/resources.dart';

class Ball extends MeshComponent {
  Ball({required Vector3 position})
    : super(
        position: position,
        mesh: SphereMesh(
          radius: .5,
          material: SpatialMaterial(
            albedoTexture: ColorTexture(BasicPalette.pink.color),
          ),
        ),
      );
}
