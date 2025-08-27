import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart' hide Matrix4;
import 'package:flame/palette.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d/resources.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_game.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide06ThreeDimensionalAxes extends Slide {
  Slide06ThreeDimensionalAxes({super.key}) : super(route: '/slide_06_3d_axes');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('3D Axes'),
      const SlideGame(game: _ThreeDimensionalAxesGame.new),
    ];
  }
}

class _ThreeDimensionalAxesGame extends FlameGame3D {
  _ThreeDimensionalAxesGame()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: CameraComponent3D(
          position: Vector3.all(8),
          target: Vector3.zero(),
        ),
      );

  @override
  FutureOr<void> onLoad() async {
    world.addAll([
      LightComponent.ambient(
        intensity: 100.0,
      ),
      MeshComponent(
        mesh: SphereMesh(
          radius: 0.3,
          material: SpatialMaterial(albedoColor: BasicPalette.white.color),
        ),
      ),
      _AxisComponent(axis: Vector3(1, 0, 0), color: BasicPalette.red.color),
      _AxisComponent(axis: Vector3(0, 1, 0), color: BasicPalette.green.color),
      _AxisComponent(axis: Vector3(0, 0, 1), color: BasicPalette.blue.color),
    ]);
    return super.onLoad();
  }
}

class _AxisComponent extends Component {
  final Vector3 axis;
  final Color color;

  _AxisComponent({required this.axis, required this.color});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final material = SpatialMaterial()..albedoColor = color;
    final tip = axis * 6;
    final cylinder = _Beam.generate(
      start: Vector3.zero(),
      end: tip,
      material: material,
    );
    final arrow = _Arrow(
      position: tip,
      direction: axis,
      material: material,
    );
    add(cylinder);
    add(arrow);
  }
}

class _Beam extends MeshComponent {
  _Beam({
    required double radius,
    required double height,
    required Material material,
  }) : super(
         mesh: CylinderMesh(
           radius: radius,
           height: height,
           material: material,
         ),
       );

  factory _Beam.generate({
    required Vector3 start,
    required Vector3 end,
    required Material material,
    double radius = _beamRadius,
  }) {
    final beam = _Beam(
      radius: radius,
      height: start.distanceTo(end),
      material: material,
    );
    beam.transform.setFrom(_calculateTransform(start, end));
    return beam;
  }

  static Transform3D _calculateTransform(
    Vector3 start,
    Vector3 end,
  ) {
    final direction = end - start;
    final length = direction.length;

    final bottomCenter = Vector3(0, -length / 2, 0);
    final topCenter = Vector3(0, length / 2, 0);

    final translation = start - bottomCenter;

    final rotation = _calculateRotationMatrix(
      bottomCenter: translation + bottomCenter,
      topCenter: translation + topCenter,
      target: end,
    );

    final translationMatrix = Matrix4.translation(translation);
    final rotationMatrix = _rotateAroundPoint(rotation, start);
    final transform = rotationMatrix.multiplied(translationMatrix);

    return Transform3D.fromMatrix4(transform);
  }

  static Matrix4 _calculateRotationMatrix({
    required Vector3 bottomCenter,
    required Vector3 topCenter,
    required Vector3 target,
  }) {
    final origin = (topCenter - bottomCenter).normalized();
    final dest = (target - bottomCenter).normalized();

    final normal = origin.cross(dest);
    if (normal.length == 0) {
      return Matrix4.identity();
    }

    final dotProduct = origin.dot(dest);
    final angle = acos(dotProduct);

    return Matrix4.identity()..rotate(normal, angle);
  }

  static Matrix4 _rotateAroundPoint(Matrix4 rotation, Vector3 point) {
    return Matrix4.translation(
      point,
    ).multiplied(rotation).multiplied(Matrix4.translation(-point));
  }

  static const _beamRadius = 0.2;
}

class _Arrow extends MeshComponent {
  final Vector3 direction;

  _Arrow({
    required super.position,
    required this.direction,
    required Material material,
  }) : super(
         mesh: ConeMesh(
           radius: 0.4,
           height: 0.5,
           material: material,
         ),
       ) {
    _lookAt(direction);
  }

  /// Rotates the cone so its tip (+Y axis) points to [direction].
  void _lookAt(Vector3 direction) {
    final from = up;
    final to = direction.normalized();
    final dot = from.dot(to);

    final axis = from.cross(to).normalized();
    final angle = acos(dot.clamp(-1.0, 1.0));
    rotation.setFrom(Quaternion.axisAngle(axis, angle));
  }

  static final up = Vector3(0, 1, 0);
}
