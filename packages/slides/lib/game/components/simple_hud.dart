import 'package:flame/components.dart';
import 'package:flame_3d_workshop_slides/game/components/crosshair.dart';

class SimpleHud extends Component {
  @override
  void onLoad() {
    add(Crosshair());
  }
}
