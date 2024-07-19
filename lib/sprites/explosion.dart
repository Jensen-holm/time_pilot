import 'package:flame/components.dart';
import 'package:time_pilot/sprites/custom_sprite.dart';

class Explosion extends CustomSprite {
  Explosion()
      : super(
          spritePath: 'explosion.png',
          spriteSize: Vector2(64.0, 32.0),
        );

  @override
  Future<SpriteAnimationComponent> loadSprite() async {
    final animation = sheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 4,
    );

    return SpriteAnimationComponent()
      ..animation = animation
      ..size = spriteSize
      ..anchor = Anchor.center
      ..position = game.size /
          2; // works because HasGameRef, although this will always be centered
  }
}
