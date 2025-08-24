import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide03PassiveVSActiveRendering extends Slide {
  Slide03PassiveVSActiveRendering({super.key})
    : super(route: '/slide_03_passive_vs_active_rendering');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Passive vs Active Rendering'),
      const Expanded(
        child: SlideImage(
          asset: 'assets/images/backgrounds/apps.jpg',
          credit:
              'Photo by Rami Al-zayat on Unsplash - https://unsplash.com/@rami_alzayat',
        ),
      ),
    ];
  }
}
