import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

import 'game.dart';

class Foreground extends ParallaxComponent<FlappyEmber> {
  Foreground() : super(priority: 1);

  @override
  Future<void> onLoad() async {
    final foreground = await Flame.images.load('parallax/fg_ridge.png');
    final layers = [
      ParallaxLayer(ParallaxImage(foreground, fill: LayerFill.none)),
    ];
    parallax = Parallax(layers);
    gameRef.speed.addListener(
      () => parallax!.baseVelocity
        ..setFrom(gameRef.speed)
        ..x *= 7,
    );
  }
}
