import 'package:flame/game.dart';
import 'package:flappy_ember/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyEmberGame();
  runApp(GameWidget(game: game));
}
