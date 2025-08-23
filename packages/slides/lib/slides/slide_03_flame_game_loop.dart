import 'package:flame/game.dart';
import 'package:flame_3d_workshop_slides/games/game_loop/game_loop.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide03FlameGameLoop extends Slide {
  Slide03FlameGameLoop({super.key}) : super(route: '/slide_03_flame_game_loop');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Game Loop'),
      SlideText.p('The game loop is the heart of any game.'),
      Container(
        width: 800,
        height: 600,
        child: const GameWidget.controlled(gameFactory: GameLoop.new),
      ),
    ];
  }
}
