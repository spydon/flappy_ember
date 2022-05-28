import 'package:flame/components.dart';

class Sky extends SpriteComponent with HasGameRef {
  Sky() : super(priority: -2);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('parallax/sky.png');
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    size = gameSize;
  }
}
