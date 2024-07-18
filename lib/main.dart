import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'sprite_loader.dart';

void main() {
  runApp(GameWidget(game: TimePilot()));
}

class TimePilot extends FlameGame {
  late SpriteAnimationComponent player;
  late SpriteLoader spriteLoader;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Initialize the SpriteLoader with the current game instance
    spriteLoader = SpriteLoader(this);

    // Load the player sprite using the SpriteLoader
    player = await spriteLoader.loadPlayerSprite();

    // Add the player component to the game
    add(player);
  }
}
