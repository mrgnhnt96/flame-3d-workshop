import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide11ClassStructure extends Slide {
  Slide11ClassStructure({super.key})
    : super(route: '/slide_11_class_structure');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Class Structure'),
      const Expanded(
        child: SlideImage(
          asset: 'assets/images/diagrams/class-structure.png',
          credit: 'From the Flame & (real) 3D talk',
        ),
      ),
    ];
  }
}
