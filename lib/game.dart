import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'background.dart';
import 'foreground.dart';
import 'player.dart';

class FlappyEmber extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyEmber();

  NotifyingVector2 speed = NotifyingVector2.zero();
  late Player player;

  @override
  Future<void> onLoad() async {
    await addAll([
      Background(),
      Foreground(),
      player = Player(),
      ScreenHitbox(),
    ]);
    speed.x = 100;
  }

  void gameOver() {
    speed.setZero();
  }

  @override
  void onTap() {
    player.fly();
  }
}
