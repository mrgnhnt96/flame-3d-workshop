import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Slide01Bg extends FlutterDeckSlideWidget {
  const Slide01Bg({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/slide_01_bg',
          header: FlutterDeckHeaderConfiguration(title: 'Flame 3D Workshop'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) => Image.asset(
        'assets/images/3d-bg.jpg',
        fit: BoxFit.contain,
      ),
      footerBuilder: (context) => const FlutterDeckFooter(
        widget: Text(
          'Photo by Renders BR on Unsplash - https://unsplash.com/@rendersbr',
        ),
      ),
    );
  }
}
