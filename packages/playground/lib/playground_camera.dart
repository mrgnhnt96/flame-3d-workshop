import 'package:flame/components.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d_workshop_playground/components/simple_hud.dart';
import 'package:flame_3d_workshop_playground/control_type.dart';
import 'package:flame_3d_workshop_playground/player.dart';
import 'package:flame_3d_workshop_playground/playground.dart';

class PlaygroundCamera extends CameraComponent3D
    with HasGameReference<Playground> {
  PlaygroundCamera()
    : super(
        position: Vector3(0, 2, 4),
        projection: CameraProjection.perspective,
        viewport: FixedResolutionViewport(
          resolution: Vector2(800, 600),
        ),
        hudComponents: [SimpleHud()],
      );

  void reset() {
    if (game.controlType == ControlType.fps) {
      position = player.position + headHeight;
      target = position + player.forward;
    } else {
      position =
          player.position +
          _computePositionOffsetForPlatformer(player.rotation);
      target = player.position + player.lookAt;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (game.controlType == ControlType.fps) {
      _fpsCameraUpdate(dt);
    } else if (game.controlType == ControlType.platformer) {
      _platformerCameraUpdate(dt);
    }
  }

  void _fpsCameraUpdate(double dt) {
    position.setFrom(player.position + headHeight);
    target.setFrom(position + player.forward);
  }

  Player get player => game.player;

  void _platformerCameraUpdate(double dt) {
    final targetOffset =
        player.position + _computePositionOffsetForPlatformer(player.rotation);
    final targetLookAt = player.position + player.lookAt;

    position += (targetOffset - position) * _cameraLinearSpeed * dt;
    target += (targetLookAt - target) * _cameraRotationSpeed * dt;
  }

  Vector3 _computePositionOffsetForPlatformer(Quaternion rotation) {
    final forward = Vector3(0, -1, 1)..applyQuaternion(rotation);
    return forward.normalized() * -_distance;
  }

  static final Vector3 headHeight = Vector3(0, 1.7, 0);
  static const double _distance = 5.0;
  static const double _cameraRotationSpeed = 6.0;
  static const double _cameraLinearSpeed = 12.0;
}
