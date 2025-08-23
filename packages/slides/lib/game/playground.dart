import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame_3d/components.dart';
import 'package:flame_3d/game.dart';
import 'package:flame_3d_workshop_slides/game/components/room_bounds.dart';
import 'package:flame_3d_workshop_slides/game/player.dart';

class Playground extends FlameGame3D with HasKeyboardHandlerComponents {
  late Player player;

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
