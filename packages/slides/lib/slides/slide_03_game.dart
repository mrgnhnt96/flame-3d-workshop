import 'package:flame/game.dart';
import 'package:flame_3d_workshop_slides/game/playground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Slide03Game extends FlutterDeckSlideWidget {
  const Slide03Game({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/slide_03_game',
          header: FlutterDeckHeaderConfiguration(title: 'Flame 3D Workshop'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Center(
        child: GameWidget.controlled(
          gameFactory: Playground.new,
        ),
      ),
    );
  }
}
