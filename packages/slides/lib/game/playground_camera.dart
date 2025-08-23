import 'package:flame/components.dart';
import 'package:flame/extensions.dart' as v64 show Vector2;
import 'package:flame_3d/camera.dart';
import 'package:flame_3d_workshop_slides/game/components/simple_hud.dart';
import 'package:flame_3d_workshop_slides/game/control_type.dart';
import 'package:flame_3d_workshop_slides/game/player.dart';
import 'package:flame_3d_workshop_slides/game/playground.dart';

class PlaygroundCamera extends CameraComponent3D
    with HasGameReference<Playground> {
  // No longer stores its own mode; uses game.controlType

  PlaygroundCamera()
    : super(
        position: Vector3(0, 2, 4),
        projection: CameraProjection.perspective,
        viewport: FixedResolutionViewport(
          resolution: v64.Vector2(800, 600),
        ),
        hudComponents: [SimpleHud()],
      );


  void reset() {
    if (game.controlType == ControlType.fps) {
      position = player.position + Vector3(0, 1.7, 0); // Camera at head height
      target = position + _getForwardVectorFromPlayer();
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
    position.setFrom(player.position + Vector3(0, 1.7, 0));
    target.setFrom(position + _getForwardVectorFromPlayer());
  }

  Vector3 _getForwardVectorFromPlayer() {
    final yaw = Quaternion.axisAngle(Vector3(0, 1, 0), player.yaw);
    final pitch = Quaternion.axisAngle(Vector3(1, 0, 0), player.pitch);
    final direction = Vector3(0, 0, 1);
    direction.applyQuaternion(yaw);
    direction.applyQuaternion(pitch);
    return direction.normalized();
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

  static const double _distance = 5.0;
  static const double _cameraRotationSpeed = 6.0;
  static const double _cameraLinearSpeed = 12.0;
}
