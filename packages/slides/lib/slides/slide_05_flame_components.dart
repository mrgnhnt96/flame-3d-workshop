import 'package:flame_3d_workshop_slides/slides/components/slide.dart';
import 'package:flame_3d_workshop_slides/slides/components/slide_text.dart';
import 'package:flutter/material.dart';

class Slide05FlameComponents extends Slide {
  Slide05FlameComponents({super.key})
    : super(route: '/slide_05_flame_components');

  @override
  List<Widget> children(BuildContext context) {
    return [
      SlideText.title('Components'),
      SlideText.code(
        '''
        class MyComponent extends Component {
          @override
          Future<void> onLoad() async {
            await super.onLoad();
            // load
          }

          @override
          void update(double dt) {
            // update
          }

          @override
          void render(Canvas canvas) {
            // render
          }
        }
        ''',
      ),
    ];
  }
}
