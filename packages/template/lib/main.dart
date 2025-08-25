import 'package:flame/game.dart';
import 'package:flame_3d_workshop_template/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameWidget.controlled(gameFactory: TemplateGame.new));
}
