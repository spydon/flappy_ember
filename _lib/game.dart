import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_ember/box_stack.dart';
import 'package:flappy_ember/ground.dart';
import 'package:flappy_ember/player.dart';
import 'package:flappy_ember/sky.dart';

class FlappyEmberGame extends FlameGame
    with HasCollisionDetection, TapDetector {
  FlappyEmberGame();

  double speed = 400.0;
  late final Player player;
  late final TextComponent scoreText;
  bool gameOver = false;

  @override
  Future<void> onLoad() async {
    add(player = Player());
    add(Sky());
    add(Ground());
    add(ScreenHitbox());
    add(scoreText = TextComponent(position: Vector2.all(10)));
  }

  @override
  void updateTree(double dt) {
    if (gameOver) {
      return;
    }
    super.updateTree(dt);
  }

  double _timeSinceBox = 0;
  double boxInterval = 1;

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceBox += dt;
    if (_timeSinceBox > boxInterval) {
      add(BoxStack());
      _timeSinceBox = 0;
      boxInterval = max(boxInterval - 0.1, 0.5);
    }
    scoreText.text = 'Score: ${speed.floor()}';
    speed += dt;
  }

  @override
  void onTap() {
    player.fly();
  }
}
