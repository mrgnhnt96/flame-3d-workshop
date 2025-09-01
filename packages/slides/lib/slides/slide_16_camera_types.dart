import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_image.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide16CameraTypes extends Slide {
  Slide16CameraTypes({super.key}) : super(route: '/slide_16_camera_types');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Camera Types'),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.0,
        children: [
          Column(
            children: [
              SlideText.subtitle('First Person'),
              Container(
                width: 800,
                child: const SlideImage(
                  asset: 'assets/images/diagrams/first-person.png',
                  credit: 'Playground Application',
                ),
              ),
            ],
          ),
          Column(
            children: [
              SlideText.subtitle('Third Person'),
              Container(
                width: 800,
                child: const SlideImage(
                  asset: 'assets/images/diagrams/third-person.png',
                  credit: 'Playground Application',
                ),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
