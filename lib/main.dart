import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  final game = FlappyEmberGame();
  runApp(GameWidget(game: game));
}
