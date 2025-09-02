import 'dart:async';
import 'dart:typed_data';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/resources.dart';
import 'package:flutter/material.dart' hide Texture;

const checkerboardFloorGrid = 8;

class RoomBounds extends Component {
  @override
  FutureOr<void> onLoad() {
    addAll([
      // Floor
      MeshComponent(
        mesh: PlaneMesh(
          size: Vector2(32, 32),
          material: SpatialMaterial(
            albedoTexture: Texture(
              Uint32List.fromList(
                List.generate(
                  checkerboardFloorGrid * checkerboardFloorGrid,
                  (i) {
                    final x = i % checkerboardFloorGrid;
                    final y = i ~/ checkerboardFloorGrid;
                    final isEven = (x + y).isEven;
                    final c = isEven ? Colors.black : Colors.white;
                    return (c.a * 255).round() << 24 |
                        (c.r * 255).round() << 16 |
                        (c.g * 255).round() << 8 |
                        (c.b * 255).round();
                  },
                ),
              ).buffer.asByteData(),
              width: checkerboardFloorGrid,
              height: checkerboardFloorGrid,
            ),
          ),
        ),
      ),

      // Front wall
      MeshComponent(
        position: Vector3(16.5, 2.5, 0),
        mesh: CuboidMesh(
          size: Vector3(1, 5, 32),
          material: SpatialMaterial(
            albedoTexture: ColorTexture(
              BasicPalette.yellow.color,
            ),
          ),
        ),
      ),

      // Left wall
      MeshComponent(
        position: Vector3(0, 2.5, 16.5),
        mesh: CuboidMesh(
          size: Vector3(32, 5, 1),
          material: SpatialMaterial(
            albedoTexture: ColorTexture(
              BasicPalette.cyan.color,
            ),
          ),
        ),
      ),

      // Right wall
      MeshComponent(
        position: Vector3(0, 2.5, -16.5),
        mesh: CuboidMesh(
          size: Vector3(32, 5, 1),
          material: SpatialMaterial(
            albedoTexture: ColorTexture(
              BasicPalette.lime.color,
            ),
          ),
          useFaceNormals: false,
        ),
      ),
    ]);
  }
}
