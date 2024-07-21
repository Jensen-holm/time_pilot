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
  late SpriteAnimation north;
  late SpriteAnimation south;
  late SpriteAnimation east;
  late SpriteAnimation west;

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
      ..animation = east
      ..anchor = Anchor.center
      ..position = game.size / 2; // works because HasGameRef
  }

  void loadAnimations() {
    north = sheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      to: Direction.n.index,
    );

    south = sheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: Direction.s.index - 1,
      to: Direction.s.index,
    );

    east = sheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: Direction.e.index - 1,
      to: Direction.e.index,
    );

    west = sheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: Direction.w.index - 1,
      to: Direction.w.index,
    );
  }
}
