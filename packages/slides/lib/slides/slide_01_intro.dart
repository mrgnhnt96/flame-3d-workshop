import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide01Intro extends Slide {
  Slide01Intro({super.key}) : super(route: '/slide_01_intro');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Who are we?'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32.0,
        children: [
          Column(
            children: [
              SlideText.subtitle('Luan Nico'),
              SlideText.subtitle('@luanpotter'),
              Image.asset('assets/images/avatars/luanpotter.png', width: 264),
              SlideText.p('Faire - faire.com/careers'),
              SlideText.italics('We are hiring!'),
            ],
          ),
          Column(
            children: [
              SlideText.subtitle('Jochum van der Ploeg'),
              SlideText.subtitle('@wolfenrain'),
              Image.asset('assets/images/avatars/wolfenrain.jpg', width: 264),
              SlideText.p('Not Faire - notfaire.com'),
              SlideText.small('Apparently works at FlutterFlow'),
            ],
          ),
        ],
      ),
      Column(
        children: [
          SlideText.p('Core Maintainers of Flame'),
          SlideText.p('Advocates for flame_3D'),
        ],
      ),
    ];
  }
}
