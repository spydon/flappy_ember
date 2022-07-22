import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyEmber> {
  Player() : super(position: Vector2.all(100), size: Vector2.all(50));

  final fallingSpeed = 200;

  @override
  Future<void> onLoad() async {
    debugMode = true;
    final image = await Flame.images.load('ember.png');
    add(CircleHitbox());
    animation = SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += fallingSpeed * dt;
  }

  @override
  void onCollisionStart(_, __) {
    super.onCollisionStart(_, __);
    gameRef.gameOver();
  }

  void fly() {
    final effect = MoveByEffect(
      Vector2(0, -100),
      EffectController(
        duration: 0.5,
        curve: Curves.decelerate,
      ),
    );
    add(effect);
  }
}
