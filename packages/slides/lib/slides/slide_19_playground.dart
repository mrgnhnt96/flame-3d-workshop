import 'package:flame/game.dart';
import 'package:flame_3d_workshop_playground/playground.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flutter/material.dart';

class Slide19Playground extends FullPageSlide {
  Slide19Playground({super.key}) : super(route: '/slide_19_playground');

  @override
  Widget child(BuildContext context) {
    return const GameWidget.controlled(
      gameFactory: Playground.new,
    );
  }
}
