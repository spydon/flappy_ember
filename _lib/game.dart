import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'box_stack.dart';
import 'ground.dart';
import 'player.dart';
import 'sky.dart';

class FlappyEmber extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyEmber();

  final _random = Random();
  double speed = 200;
  double _timeSinceBox = 0;
  final _boxInterval = 2;
  late Player player;
  bool _gameOver = false;

  @override
  Future<void> onLoad() async {
    await addAll([
      Sky(),
      Ground(),
      player = Player(),
      ScreenHitbox(),
    ]);
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

  @override
  void updateTree(double dt) {
    if (_gameOver) {
      return;
    }
    super.updateTree(dt);
  }

  void gameOver() {
    _gameOver = true;
  }

  @override
  void onTap() {
    player.fly();
  }
}
