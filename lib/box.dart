import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_ember/game.dart';

class Box extends SpriteComponent with HasGameRef<FlappyEmberGame> {
  Box({required Vector2 position})
      : super(position: position, size: initialSize);

  static Vector2 initialSize = Vector2.all(50);

  @override
  Future<void> onLoad() async {
    final boxImage = await Flame.images.load('boxes/1.png');
    sprite = Sprite(boxImage);
    add(RectangleHitbox());
  }
}
