import 'package:flame/game.dart';
import 'package:flame_3d_workshop_playground/playground.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameWidget.controlled(gameFactory: Playground.new));
}
