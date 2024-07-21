import 'package:flame/components.dart';
import 'package:time_pilot/sprites/custom_sprite.dart';

enum Direction {
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
  int curDirection = Direction.e.index; // initialize east

  Player()
      : super(
          spritePath: 'player.png',
          spriteSize: Vector2.all(32.0),
        );

  @override
  void loadSprite() {
    // this function is called in the CustomSprite.onLoad() method
    loadAnimations();
    sprite
      ..size = spriteSize
      ..animation = animations[curDirection] // initializes at east
      ..anchor = Anchor.center
      ..position = game.size / 2; // works because HasGameRef
  }

  void loadAnimations() {
    for (var idx = 1; idx < Direction.values.length; idx++) {
      var direction = Direction.values[idx];
      animations[direction.index] = sheet.createAnimation(
        row: 0,
        stepTime: 1,
        from: idx - 1,
        to: idx,
      );
    }
  }

  void rotate(int steps) {
    curDirection = (curDirection + steps) % Direction.values.length;
    if (curDirection == 0) {
      curDirection = 1; // Skip the unused enum value
    }
    sprite.animation = animations[curDirection];
  }

  void setDirection(int newDirection) {
    curDirection = newDirection % Direction.values.length;
    if (curDirection == 0) {
      curDirection = 1; // Skip the unused enum value
    }
    sprite.animation = animations[curDirection];
  }
}
