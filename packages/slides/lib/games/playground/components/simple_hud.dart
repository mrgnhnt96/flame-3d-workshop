import 'package:flame/components.dart';
import 'package:flame_3d_workshop_slides/games/playground/components/crosshair.dart';

class SimpleHud extends Component {
  @override
  void onLoad() {
    add(Crosshair());
  }
}
