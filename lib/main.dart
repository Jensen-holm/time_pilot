import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'sprites/player.dart';

void main() {
  runApp(GameWidget(game: TimePilot()));
}

class TimePilot extends FlameGame with HasGameRef {
  Player player = Player();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(player);
  }
}
