import 'package:flame/components.dart';
import 'package:time_pilot/sprites/custom_sprite.dart';

enum Direction {
  // ignore: unused_field
  _, // ignoring warnings for this line because we want to start enum at 1
  n,
  nne,
  nee,
  neee,
  e,
  seee,
  see,
  se,
  s,
  sw,
  sww,
  swww,
  w,
  nw,
  nww,
  nwww
}

class Player extends CustomSprite {
  late Map<Direction, SpriteAnimation> animations;

  Player()
      : super(
          spritePath: 'player.png',
          spriteSize: Vector2.all(32.0),
        );

  @override
  Future<SpriteAnimationComponent> loadSprite() async {
    loadAnimations();
    return SpriteAnimationComponent()
      ..size = spriteSize
      ..animation = animations[Direction.e]
      ..anchor = Anchor.center
      ..position = game.size / 2; // works because HasGameRef
  }

  void loadAnimations() {
    animations = {};
    const directions = Direction.values;
    for (var idx = 1; idx < directions.length; idx++) {
      var direction = directions[idx];
      animations[direction] = sheet.createAnimation(
        row: 0,
        stepTime: 0.1,
        from: idx - 1,
        to: idx,
      );
    }
  }
}
