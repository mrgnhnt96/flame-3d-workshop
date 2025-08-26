import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide12TheCamera extends Slide {
  Slide12TheCamera({super.key}) : super(route: '/slide_12_the_camera');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('The Camera'),
      const Expanded(
        child: SlideImage(
          asset: 'assets/images/diagrams/roll-pitch-yaw.png',
          credit: 'VTK Book - Chapter 3, Figure 3-13',
        ),
      ),
    ];
  }
}
