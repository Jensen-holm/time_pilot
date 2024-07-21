import 'package:flame/components.dart';
import 'package:time_pilot/sprites/custom_sprite.dart';
import 'dart:io';

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
  double rotationTime = 0.1;

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
        stepTime: rotationTime,
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

  void rotateToDirection(int newDirection) {
    int targetDirection = newDirection % Direction.values.length;
    if (targetDirection == 0) {
      targetDirection = 1; // Skip the unused enum value
    }

    int currentIndex = curDirection;
    int distanceClockwise =
        (targetDirection - currentIndex + Direction.values.length) %
            Direction.values.length;
    int distanceCounterClockwise =
        (currentIndex - targetDirection + Direction.values.length) %
            Direction.values.length;

    if (distanceClockwise <= distanceCounterClockwise) {
      rotateClockwise(distanceClockwise);
    } else {
      rotateCounterClockwise(distanceCounterClockwise);
    }
  }

  void rotateClockwise(int steps) {
    for (int i = 0; i < steps; i++) {
      curDirection = (curDirection + 1) % Direction.values.length;
      if (curDirection == 0) {
        curDirection = 1; // Skip the unused enum value
      }
      sprite.animation = animations[curDirection];
      // You might want to add a delay or wait here to control the rotation speed
    }
  }

  void rotateCounterClockwise(int steps) {
    for (int i = 0; i < steps; i++) {
      curDirection = (curDirection - 1 + Direction.values.length) %
          Direction.values.length;
      if (curDirection == 0) {
        curDirection = 1; // Skip the unused enum value
      }
      sprite.animation = animations[curDirection];
      // You might want to add a delay or wait here to control the rotation speed
    }
  }
}
