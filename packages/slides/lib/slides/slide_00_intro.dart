import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Slide00Intro extends FlutterDeckSlideWidget {
  const Slide00Intro({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/slide_00_intro',
          header: FlutterDeckHeaderConfiguration(title: 'Flame 3D Workshop'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'Flame 3D Workshop',
    );
  }
}
