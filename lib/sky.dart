import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Sky extends SpriteComponent {
  Sky() : super(priority: -1);

  @override
  Future<void> onLoad() async {
    final skyImage = await Flame.images.load('sky.png');
    sprite = Sprite(skyImage);
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    size = gameSize;
  }
}
