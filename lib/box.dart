import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'game.dart';

class Box extends SpriteComponent with HasGameRef<FlappyEmber> {
  Box({required Vector2 position})
      : super(position: position, size: initialSize);

  static final Vector2 initialSize = Vector2.all(150);
  static final Random _rng = Random();

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('boxes/${_rng.nextInt(2) + 1}.png');
    add(RectangleHitbox());
  }
}
