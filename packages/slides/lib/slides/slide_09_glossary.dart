import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide09Glossary extends Slide {
  Slide09Glossary({super.key}) : super(route: '/slide_09_glossary');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Glossary'),
      SlideText.p('Some useful terms that we are going to be using a lot.'),
      SlideText.bullet('Vertex'),
      SlideText.bullet('Surface'),
      SlideText.bullet('Mesh'),
      SlideText.bullet('Model'),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/diagrams/vertex.png'),
          Image.asset('assets/images/diagrams/surface.png'),
          Image.asset('assets/images/diagrams/mesh.png'),
        ],
      ),
    ];
  }
}
