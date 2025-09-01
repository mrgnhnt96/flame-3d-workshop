import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart' hide Matrix4, Material;

class Slide15BirthTheCamera extends Slide {
  Slide15BirthTheCamera({super.key})
    : super(route: '/slide_15_birth_the_camera');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Birth the Camera'),
      SlideText.code('''
class YourCamera extends CameraComponent3D {
  YourCamera() : super(
    position: Vector3(0, 2, 4),
    target: Vector3.zero(),
  );
}

class YourGame extends FlameGame3D<World3D, YourCamera> {
  YourGame() : super(
    world: World3D(...),
    camera: YourCamera(),
  );
}
'''),
    ];
  }
}
