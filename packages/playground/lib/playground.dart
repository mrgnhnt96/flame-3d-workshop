import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame_3d/camera.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d_workshop_playground/components/room_bounds.dart';
import 'package:flame_3d_workshop_playground/control_type.dart';
import 'package:flame_3d_workshop_playground/player.dart';
import 'package:flame_3d_workshop_playground/playground_camera.dart';
import 'package:flame_3d_workshop_playground/util/mouse.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Playground extends FlameGame3D<World3D, PlaygroundCamera>
    with HasKeyboardHandlerComponents {
  late Player player;

  Playground()
    : super(
        world: World3D(clearColor: const Color(0xFF000000)),
        camera: PlaygroundCamera(),
      );

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.keyR) {
        camera.reset();
        player.reset();
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.keyM) {
        controlType = controlType == ControlType.fps
            ? ControlType.platformer
            : ControlType.fps;
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.escape) {
        controlType = ControlType.platformer;
        return KeyEventResult.handled;
      }
    }

    return super.onKeyEvent(event, keysPressed);
  }

  ControlType _controlType = ControlType.platformer;
  ControlType get controlType => _controlType;
  set controlType(ControlType controlType) {
    _controlType = controlType;
    switch (controlType) {
      case ControlType.fps:
        Mouse.lock();
      case ControlType.platformer:
        Mouse.unlock();
    }
    camera.reset();
  }

  @override
  FutureOr<void> onLoad() async {
    world.addAll([
      RoomBounds(),
      LightComponent.ambient(
        intensity: 1.0,
      ),
      player = Player(
        position: Vector3(0, 1, 0),
      ),
    ]);
    return super.onLoad();
  }
}
