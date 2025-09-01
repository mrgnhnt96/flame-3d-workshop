import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide09Matrices extends FullPageSlide {
  Slide09Matrices({super.key}) : super(route: '/slide_09_matrices');

  @override
  Widget child(BuildContext context) {
    return const SlideImage(
      asset: 'assets/images/backgrounds/matrices.jpg',
      credit: 'From imgflip.com',
    );
  }
}
