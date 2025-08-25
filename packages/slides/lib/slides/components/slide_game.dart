import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class SlideGame extends StatelessWidget {
  final GameFactory game;

  const SlideGame({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 600,
      child: GameWidget.controlled(
        gameFactory: game,
        autofocus: false,
      ),
    );
  }
}
