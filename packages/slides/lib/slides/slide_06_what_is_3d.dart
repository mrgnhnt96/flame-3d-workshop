import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flutter/material.dart';

class Slide06WhatIs3D extends FullPageSlide {
  Slide06WhatIs3D({super.key}) : super(route: '/slide_06_what_is_3d');

  @override
  Widget child(BuildContext context) {
    return const SlideImage(
      asset: 'assets/images/backgrounds/3d-bg.jpg',
      credit:
          'Photo by Renders BR on Unsplash - https://unsplash.com/@rendersbr',
    );
  }
}
