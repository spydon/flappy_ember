import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Player extends SpriteAnimationComponent {
  Player() : super();

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      await Flame.images.load('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
