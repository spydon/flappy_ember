import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_ember/player.dart';
import 'package:flappy_ember/sky.dart';

import 'box_stack.dart';
import 'ground.dart';

class FlappyEmber extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyEmber();

  late final Player player;
  double speed = 400;
  double _timeSinceBox = 0;
  double _boxInterval = 1;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    debugMode = true;
    add(Sky());
    add(Ground());
    add(player = Player());
    add(ScreenHitbox());
  }

  @override
  void onTap() {
    player.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceBox += dt;
    speed += 10 * dt;
    if (_timeSinceBox > _boxInterval) {
      add(BoxStack(isBottom: _random.nextBool()));
      _timeSinceBox = 0;
    }
  }

  void gameOver() {
    pauseEngine();
  }
}
