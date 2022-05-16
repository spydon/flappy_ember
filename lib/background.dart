import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

import 'game.dart';

class Background extends ParallaxComponent<FlappyEmber> {
  Background() : super(priority: -1);

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load('parallax/fg_fog_warm.png');
    final middleground = await Flame.images.load('parallax/fg_path.png');
    final layers = [
      ParallaxLayer(
        ParallaxImage(background, fill: LayerFill.height),
        velocityMultiplier: Vector2.all(1.0),
      ),
      ParallaxLayer(
        ParallaxImage(middleground, fill: LayerFill.none),
        velocityMultiplier: Vector2.all(5.0),
      ),
    ];
    parallax = Parallax(layers);
    gameRef.speed.addListener(
      () => parallax!.baseVelocity.setFrom(gameRef.speed),
    );
  }
}
