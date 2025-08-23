import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide00Title extends Slide {
  Slide00Title({super.key}) : super(route: '/slide_00_title');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Flame 3D Workshop'),
      SlideText.subtitle('Building a 3D Game with Flame'),
    ];
  }
}
