import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_ember/box_stack.dart';
import 'package:flappy_ember/ground.dart';
import 'package:flappy_ember/player.dart';
import 'package:flappy_ember/sky.dart';

class FlappyEmberGame extends FlameGame
    with HasCollisionDetection, TapDetector {
  FlappyEmberGame();

  double speed = 200;
  late final Player _player;

  @override
  Future<void> onLoad() async {
    // Add your components here
    add(_player = Player());
    add(Sky());
    add(Ground());
    add(ScreenHitbox());
  }

  @override
  void onTap() {
    _player.fly();
  }

  double _timeSinceBox = 0;
  double _boxInterval = 1;

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceBox += dt;
    if (_timeSinceBox > _boxInterval) {
      add(BoxStack());
      _timeSinceBox = 0;
    }
  }
}
