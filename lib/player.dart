import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

enum PlayerState {
  idle,
  shooting,
}

class Player extends SpriteAnimationComponent
    with HasGameRef<FlappyEmber>, CollisionCallbacks {
  Player() : super(size: Vector2.all(50), anchor: Anchor.center);

  double fallingSpeed = 200;

  @override
  Future<void> onLoad() async {
    position.x = size.x * 3;
    position.y = gameRef.size.y / 2;
    animation = await gameRef.loadSpriteAnimation(
      'ember.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
    add(CircleHitbox());
    debugMode = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * fallingSpeed;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    gameRef.gameOver();
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
