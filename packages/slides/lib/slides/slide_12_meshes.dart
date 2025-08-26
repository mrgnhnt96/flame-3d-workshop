import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide12Meshes extends Slide {
  Slide12Meshes({super.key}) : super(route: '/slide_12_meshes');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Exercise: Playing around with meshes!'),
      SlideText.bullet('Cone'),
      SlideText.bullet('Cuboid'),
      SlideText.bullet('Cylinder'),
      SlideText.bullet('Plane'),
      SlideText.bullet('Sphere'),
    ];
  }
}
