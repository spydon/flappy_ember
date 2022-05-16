import 'package:flame/game.dart';

import 'background.dart';
import 'foreground.dart';

class FlappyEmber extends FlameGame {
  FlappyEmber();

  NotifyingVector2 speed = NotifyingVector2.zero();

  @override
  Future<void> onLoad() async {
    await add(Background());
    await add(Foreground());
    speed.x = 100;
  }
}
