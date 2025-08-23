import 'package:flame_3d_workshop_slides/utils/code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Slide02Code extends FlutterDeckSlideWidget {
  const Slide02Code({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/slide_02_code',
          header: FlutterDeckHeaderConfiguration(title: 'Flame 3D Workshop'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text.rich(
          Code.highlight('print("Hello, World!");'),
        ),
      ),
    );
  }
}
