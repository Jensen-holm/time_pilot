import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:time_pilot/sprites/explosion.dart';
import 'sprites/player.dart';

void main() {
  runApp(GameWidget(game: TimePilot()));
}

class TimePilot extends FlameGame {
  late Player player;
  late Explosion explosion;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    explosion = Explosion();
    add(explosion);

    player = Player();
    add(player);
  }
}
