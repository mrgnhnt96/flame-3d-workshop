import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class SlideSampleCode extends Slide {
  SlideSampleCode({super.key}) : super(route: '/slide_sample_code');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.code('print("Hello, World!");'),
    ];
  }
}
