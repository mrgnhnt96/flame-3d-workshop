import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide07ThreeDimensionalProjections extends Slide {
  Slide07ThreeDimensionalProjections({super.key})
    : super(route: '/slide_07_3d_projections');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('3D Projections'),
      const Expanded(
        child: SlideImage(
          asset: 'assets/images/diagrams/3d-projections.png',
          credit: 'From the Flame & (real) 3D talk',
        ),
      ),
    ];
  }
}
