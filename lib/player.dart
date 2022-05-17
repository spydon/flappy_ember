import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<FlappyEmber>, CollisionCallbacks {
  Player() : super(size: Vector2.all(100), anchor: Anchor.center);

  final _fallingSpeed = 400;
  bool _isDying = false;

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
    position.y += dt * _fallingSpeed;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (!_isDying) {
      _isDying = true;
      addAll([
        ScaleEffect.to(
          Vector2(0.0, 0.0),
          EffectController(
            duration: 2.0,
            curve: Curves.bounceInOut,
          ),
        ),
        RotateEffect.by(
          9,
          EffectController(
            duration: 2.0,
          ),
        )..onFinishCallback = gameRef.gameOver,
      ]);
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -200),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}
