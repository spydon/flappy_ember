import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Player extends SpriteAnimationComponent {
  Player() : super();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('ember.png');
    SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
