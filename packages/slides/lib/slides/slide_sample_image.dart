import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flutter/material.dart';

class SlideSampleImage extends FullPageSlide {
  SlideSampleImage({super.key}) : super(route: '/slide_sample_image');

  @override
  Widget child(BuildContext context) {
    return const SlideImage(
      asset: 'assets/images/backgrounds/3d-bg.jpg',
      credit:
          'Photo by Renders BR on Unsplash - https://unsplash.com/@rendersbr',
    );
  }
}
