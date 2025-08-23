import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide02Agenda extends Slide {
  Slide02Agenda({super.key}) : super(route: '/slide_02_agenda');
  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Agenda'),
      SlideText.bullet('Flame - Primer'),
      SlideText.bullet('3D Rendering Concepts'),
    ];
  }
}
