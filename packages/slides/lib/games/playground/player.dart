import 'dart:math';

import 'package:flame/components.dart' show HasGameReference, KeyboardHandler;
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d/resources.dart';
import 'package:flame_3d_workshop_slides/games/playground/control_type.dart';
import 'package:flame_3d_workshop_slides/games/playground/playground.dart';
import 'package:flame_3d_workshop_slides/games/playground/util/keyboard_utils.dart';
import 'package:flame_3d_workshop_slides/games/playground/util/mouse.dart';
import 'package:flutter/services.dart';

class Player extends MeshComponent
    with HasGameReference<Playground>, KeyboardHandler {
  final Vector2 _input = Vector2.zero();

  bool isRunning = false;
  double speedY = 0.0;

  double _yaw = 0.0; // horizontal angle
  double get yaw => _yaw;
  set yaw(double value) {
    _yaw = value % tau;
    _updateRotation();
  }

  double _pitch = 0.0; // vertical angle
  double get pitch => _pitch;
  set pitch(double value) {
    _pitch = value.clamp(-1.2, 1.2);
    _updateRotation();
  }

  void _updateRotation() {
    transform.rotation.setAxisAngle(_up, yaw);
  }

  Vector3 get lookAt => Vector3(sin(yaw), 0.0, cos(yaw));
  Vector3 get right => Vector3(-cos(yaw), 0.0, sin(yaw));

  Vector3 get forward {
    final yawQuaternion = Quaternion.axisAngle(_yawAxis, yaw);
    final pitchQuaternion = Quaternion.axisAngle(_pitchAxis, pitch);
    return Vector3(0, 0, 1)
      ..applyQuaternion(yawQuaternion * pitchQuaternion)
      ..normalize();
  }

  Player({required Vector3 position})
    : super(
        position: position,
        mesh: CuboidMesh(
          size: Vector3(1, 2, 1),
          material: SpatialMaterial(
            albedoTexture: ColorTexture(BasicPalette.yellow.color),
          ),
        ),
      );

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final shiftKeys = {
      LogicalKeyboardKey.shift,
      LogicalKeyboardKey.shiftLeft,
      LogicalKeyboardKey.shiftRight,
    };
    isRunning = shiftKeys.any(keysPressed.contains);

    final isDown = event is KeyDownEvent || event is KeyRepeatEvent;
    if (isDown && event.logicalKey == LogicalKeyboardKey.space) {
      jump();
      return false;
    }

    return readArrowLikeKeysIntoVector2(event, keysPressed, _input);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _handleMovement(dt);
  }

  void reset() {
    position.setFrom(Vector3(0, 1, 0));
    _yaw = 0.0;
    _pitch = 0.0;
    _updateRotation();
    _input.setZero();
  }

  void jump() {
    if (position.y == _floorHeight) {
      speedY = _jumpSpeed;
    }
  }

  void _handleMovement(double dt) {
    switch (game.controlType) {
      case ControlType.fps:
        _handleFPSMovement(dt);
      case ControlType.platformer:
        _handlePlatformerMovement(dt);
    }

    _handleVerticalMovement(dt);
  }

  void _handleVerticalMovement(double dt) {
    if (speedY != 0 || position.y > _floorHeight) {
      position.y += speedY * dt + 0.5 * _accY * dt * dt;
      speedY += _accY * dt;
      if (position.y < _floorHeight) {
        position.y = _floorHeight;
        speedY = 0;
      }
    } else {
      position.y = _floorHeight;
      speedY = 0;
    }
  }

  void _handlePlatformerMovement(double dt) {
    yaw += -_input.x * _rotationSpeed * dt;
    final movement = lookAt.scaled(
      -_input.y * _runningModifier * _walkingSpeed * dt,
    );
    position.add(movement);
  }

  void _handleFPSMovement(double dt) {
    final delta = Mouse.getDelta();
    yaw -= delta.dx * _mouseSensitivity * dt;
    pitch += delta.dy * _mouseSensitivity * dt;

    final move =
        (lookAt * -_input.y + right * _input.x).normalized() *
        _runningModifier *
        _walkingSpeed *
        dt;
    position.add(move);
  }

  double get _runningModifier => isRunning ? 2.5 : 1.0;

  static const double _mouseSensitivity = 1.0;
  static const double _rotationSpeed = 3.0;
  static const double _walkingSpeed = 1.85;
  static const double _floorHeight = 1.0;
  static const double _jumpSpeed = 5.0;
  static const double _accY = -9.81;

  static final Vector3 _up = Vector3(0, 1, 0);
  static final Vector3 _yawAxis = Vector3(0, 1, 0);
  static final Vector3 _pitchAxis = Vector3(1, 0, 0);
}
