import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/game.dart';

class SpriteLoader {
  final FlameGame game;

  SpriteLoader(this.game);

  Future<SpriteAnimationComponent> loadPlayerSprite() async {
    final spriteSheet = SpriteSheet(
      image: await game.images.load('player.png'),
      srcSize: Vector2(32.0, 32.0),
    );

    final animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 14,
    );

    return SpriteAnimationComponent()
      ..animation = animation
      ..size = Vector2(32.0, 32.0)
      ..position = game.size / 2;
  }

  // Add more methods to load other sprites
}
