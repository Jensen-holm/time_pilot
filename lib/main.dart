import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'sprites/player.dart';

void main() {
  runApp(GameWidget(game: TimePilot()));
}

class TimePilot extends FlameGame with HasGameRef {
  Player player = Player();
  double timeAccumulator = 0.0;
  final double rotationInterval = 0.1; // Rotate every 1 second

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(player);
  }

  @override
  void update(double dt) {
    super.update(dt);
    timeAccumulator += dt;
    if (timeAccumulator >= rotationInterval) {
      player.rotate(1); // Rotate by 1 step
      timeAccumulator = 0.0; // Reset the accumulator
    }
  }
}
