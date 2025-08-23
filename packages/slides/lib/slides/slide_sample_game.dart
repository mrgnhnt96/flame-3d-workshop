import 'package:flame/game.dart';
import 'package:flame_3d_workshop_slides/games/playground/playground.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flutter/material.dart';

class SlideSampleGame extends FullPageSlide {
  SlideSampleGame({super.key}) : super(route: '/slide_sample_game');

  @override
  Widget child(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: Playground.new,
    );
  }
}
