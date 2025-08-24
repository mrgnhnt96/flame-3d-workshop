import 'package:flame/game.dart';
import 'package:flame_3d_workshop_slides/games/game_loop/game_loop.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide04FlameGameLoop extends Slide {
  Slide04FlameGameLoop({super.key}) : super(route: '/slide_04_flame_game_loop');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Game Loop'),
      Container(
        width: 800,
        height: 600,
        child: const GameWidget.controlled(
          gameFactory: GameLoop.new,
          autofocus: false,
        ),
      ),
    ];
  }
}
